A = [2.0 2.5 2.0 1.0 2.5 1.5; 2.5 3.0 2.0 2.0 2.5 2.5; 2.0 2.0 2.0 2.0 1.5 1.5; 1.0 2.0 2.0 2.0 2.0 3.0; 2.5 2.5 1.5 2.0 1.0 2.5; 1.5 2.5 1.5 3.0 2.5 1.0];
f = [21;32;23;21;25;24];
x_next = zeros(6,1);
x = ones(6,1);
omega=1
for j=1:6
    sum1=0;
    for k=1:(j-1)
        sum1 = A(j,k).*x_next(k) + sum1;
    end
    sum2=0;
    for k=(j+1):6
        sum2 = A(j,k).*x(k) + sum2;
    end
    x_next(j) = (1-omega).*x(j) + (omega/A(j,j)).*(f(j) - sum1 - sum2)
end
sum1