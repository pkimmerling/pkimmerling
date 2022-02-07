A = [4 -1 0 -1 0 0 0 0 0; -1 4 -1 0 -1 0 0 0 0; 0 -1 4 -1 0 -1 0 0 0;-1 0 -1 4 -1 0 -1 0 0 ;0 -1 0 -1 4 -1 0 -1 0; 0 0 -1 0 -1 4 -1 0 -1; 0 0 0 -1 0 -1 4 -1 0; 0 0 0 0 -1 0 -1 4 -1; 0 0 0 0 0 -1 0 -1 4]
f = [0;5;-2;4;-4;4;-2;5;0]
sz = size(A,1);


%%Test%%
% We want to see how the convergence is based on iterations
stop_crit = zeros(54,1); %specific because I ran it first to find out what the largest iteration number was; 54, so left some room
iteration = zeros(54,1);
for z = 1:54
    iteration(z)=z;
end
for y = 1:2
    if y == 1
        omega = 1;
        fprintf('GS')
    elseif y == 2
        D = zeros(sz);
        Dinv = zeros(sz);
        for i=1:sz
            D(i,i) = A(i,i);
            Dinv(i,i) = 1/D(i,i);
        end
        offdiagA = D-A;
        R_J = Dinv*offdiagA;
        rho = max(abs(eig(R_J)));% Spectral radius of Jacobi iteration matrix, calculated just above
        omega = 2/(1+sqrt(1-rho^2));% Theoretical optimal value for omega
        fprintf('SOR')
    end
    i=1;
    for i = 1:2
    m=0;
    stopping_criterion = 1;
    x = ones(sz,1); % Take any first guess and as long as we choose stuff correctly, it should converge.
    x_next= zeros(sz,1);
        while (stopping_criterion>10e-10)
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
            res = f-A*x_next;
            if i==1
                stopping_criterion = norm(res);
            elseif i==2
                stopping_criterion = norm(res,Inf);
            end
            stop_crit(m+1) = stopping_criterion;
            % Setup for next iteration
            x = x_next;
            m = m+1;
        end
    x
    if i==1
        fprintf('Residual in 2-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    elseif i==2
        fprintf('Residual in Sup-norm = %.6e\nIteration number m = %d\n\n',stopping_criterion,m)
    end
    hold on
    plot(iteration,stop_crit)
    end
    y = y+1;%switch methods from GS to SOR
end
