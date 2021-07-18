[X, Y] = meshgrid(-1 : .05 : 1, -1 : .05 : 1);

r = sqrt(X.^2 + Y.^2);
U = (-1 + 3 * (X.^2) ./ (r.^2)) ./ (r.^3); 
V = (3 * (X.*Y) ./ (r.^2)) ./ (r.^3);

P = U ./ sqrt(U.^2 + V.^2);
Q = V ./ sqrt(U.^2 + V.^2);

q = quiver(X,Y,P,Q,.5);
axis equal
title('Normalized Velocity Field of Source Dipole')
