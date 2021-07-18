[X, Y] = meshgrid(-1 : .1 : 1, -1 : .1 : 1);

r = sqrt(X.^2 + Y.^2);
U = 1./r + (X.^2) ./ (r.^3);
V = (X.*Y) ./ (r.^3) ;

q = quiver(X,Y,U,V);
axis equal
title('Velocity Field of Point Force')
