z = peaks(100);

figure
mesh(z)

figure
surf(z)
colormap(jet)

[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
figure
mesh(X,Y,Z)
