a = .1; % radius of the sphere

N = 1024; % draw the sphere in the xy-plane
k = 1 : N;
theta = 2 * pi / N * (k - 1);
x_k = a * cos(theta); x_k = x_k(:);
y_k = a * sin(theta); y_k = y_k(:);
plot(x_k, y_k, '.')
hold on


[X, Y] = meshgrid(-1 : .05 : 1, -.5 : .05 : .5);
r = sqrt(X.^2 + Y.^2);

U1 = 1./r + (X.^2) ./ (r.^3); % velocity field induced by the point force
V1 = (X.*Y) ./ (r.^3) ;

U2 = (-1 + 3 * (X.^2) ./ (r.^2)) ./ (r.^3); % velocity field induced by the force dipole
V2 = (3 * (X.*Y) ./ (r.^2)) ./ (r.^3);

const = (a^2)/3;
U = (4/3)/a - (U1 - const * U2); % combined velocities relative to the velocity at the infinity, v_inf = [(4/3)/a; 0]
V = 0 - (V1 - const * V2);

valid = (X.^2 + Y.^2 >= a^2); % draw only the velocity field outside the sphere (also remove the singularity)
U = valid .* U;
V = valid .* V;
q = quiver(X,Y,U,V,.75);

starty = -.4 : .05 : .4;
startx = ones(size(starty)) * (-1);
streamline(X,Y,U,V,startx,starty)

axis equal
title('Flow past a sphere')