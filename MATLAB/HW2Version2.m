%%% We want to solve Ax=f where

%A = [2.0 2.5 2.0 1.0 2.5 1.5; 2.5 3.0 2.0 2.0 2.5 2.5; 2.0 2.0 2.0 2.0 1.5 1.5; 1.0 2.0 2.0 2.0 2.0 3.0; 2.5 2.5 1.5 2.0 1.0 2.5; 1.5 2.5 1.5 3.0 2.5 1.0]
%f = [21;32;23;21;25;24]
% for n=1:sz
%     A(n,n) = 100*A(n,n);
% end

A = [4 -1 0 -1 0 0 0 0 0; -1 4 -1 0 -1 0 0 0 0; 0 -1 4 -1 0 -1 0 0 0;-1 0 -1 4 -1 0 -1 0 0 ;0 -1 0 -1 4 -1 0 -1 0; 0 0 -1 0 -1 4 -1 0 -1; 0 0 0 -1 0 -1 4 -1 0; 0 0 0 0 -1 0 -1 4 -1; 0 0 0 0 0 -1 0 -1 4]
f = [0;5;-2;4;-4;4;-2;5;0]
sz = size(A,1);

%%% Gauss-Seidal Method
fprintf('Gauss-Seidal Method\n\n\n')
omega = 1
for i = 1:4
    m=0;
    stopping_criterion = 1;
    x = ones(sz,1); % Take any first guess and as long as we choose stuff correctly, it should converge.
    x_next= zeros(sz,1);
    while stopping_criterion>0.00001
        for j=1:sz
            sum1=0;
            for k=1:(j-1)
                sum1 = A(j,k).*x_next(k) + sum1;
            end
            sum2=0;
            for k=(j+1):sz
                sum2 = A(j,k).*x(k) + sum2;
            end
            x_next(j) = (1-omega).*x(j) + (omega/A(j,j)).*(f(j) - sum1 - sum2);
        end
        % Computing stopping criteria
        diff = x_next - x;
        res = f-A*x_next;
        if i==1
            stopping_criterion = norm(diff);
        elseif i==2
            stopping_criterion = norm(diff,Inf);
        elseif i==3
            stopping_criterion = norm(res);
        elseif i==4
            stopping_criterion = norm(res,Inf);
        end
        % Setup for next iteration
        x = x_next;
        m = m+1;
    end
    x
    if i==1
        fprintf('Difference in 2-norm = %.6e\nIteration number m = %d\n\n', stopping_criterion,m)
    elseif i==2
        fprintf('Difference in Sup-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    elseif i==3
        fprintf('Residual in 2-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    elseif i==4
        fprintf('Residual in Sup-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    end
end

%%% SOR Method
% Need to compute Jacobi iteration matrix to calculate omega
fprintf('SOR METHOD\n\n\n')
D = zeros(sz);
Dinv = zeros(sz);
for i=1:sz
    D(i,i) = A(i,i);
    Dinv(i,i) = 1/D(i,i);
end
offdiagA = D-A;
R_J = Dinv*offdiagA;
rho = max(abs(eig(R_J)));% Spectral radius of Jacobi iteration matrix, calculated just above
omega = 2/(1+sqrt(1-rho^2))% Theoretical optimal value for omega
for i = 1:4
    m=0;
    stopping_criterion = 1;
    x = ones(sz,1); % Take any first guess and as long as we choose stuff correctly, it should converge.
    x_next= zeros(sz,1);
    while (stopping_criterion>0.00001)
        for j=1:sz
            sum1=0;
            for k=1:(j-1)
                sum1 = A(j,k).*x_next(k) + sum1;
            end
            sum2=0;
            for k=(j+1):sz
                sum2 = A(j,k).*x(k) + sum2;
            end
            x_next(j) = (1-omega).*x(j) + (omega/A(j,j)).*(f(j) - sum1 - sum2);
        end
        % Computing stopping criteria
        diff = x_next - x;
        res = f-A*x_next;
        if i==1
            stopping_criterion = norm(diff);
        elseif i==2
            stopping_criterion = norm(diff,Inf);
        elseif i==3
            stopping_criterion = norm(res);
        elseif i==4
            stopping_criterion = norm(res,Inf);
        end
        % Setup for next iteration
        x = x_next;
        m = m+1;
    end
    x
    if i==1
        fprintf('Difference in 2-norm = %.6e\nIteration number m = %d\n\n', stopping_criterion,m)
    elseif i==2
        fprintf('Difference in Sup-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    elseif i==3
        fprintf('Residual in 2-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    elseif i==4
        fprintf('Residual in Sup-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    end
end
%%% Check
% As we see, they agree on what x is so we just need to verify that Ax=f:
% But we'll have to round off x because it's not exact beyond 5 decimal
% places

if A*round(x) == f
    disp('Ax=f')
else
    disp('Ax=/=f')
end

