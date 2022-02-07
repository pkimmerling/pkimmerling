%%% We want to solve Ax=f where
A = [4 -1 0 -1 0 0 0 0 0; -1 4 -1 0 -1 0 0 0 0; 0 -1 4 -1 0 -1 0 0 0;-1 0 -1 4 -1 0 -1 0 0 ;0 -1 0 -1 4 -1 0 -1 0; 0 0 -1 0 -1 4 -1 0 -1; 0 0 0 -1 0 -1 4 -1 0; 0 0 0 0 -1 0 -1 4 -1; 0 0 0 0 0 -1 0 -1 4];
f = [0;5;-2;4;-4;4;-2;5;0];
sz = size(A,1);

%% Only need to define the prolongation operator because the restriction operator is the transpose
D = eye(sz, floor(sz/2));
E = 0.5.*D + circshift(D,1,1) + 0.5.*circshift(D,2,1);%Not right, but still useful
prolongation = zeros(sz,floor(sz/2));
for h=1:floor(sz/2)
    prolongation(:,h) = circshift(E(:,1),(h-1)*2);
end
%But for clarity, define restriction explicitly here
restriction = prolongation';
%% Multigrid Method
omega = 1;
for k = 2:10
    m=0;
    x = ones(sz,1); % Take any first guess
    x_next= zeros(sz,1);
    %Relax k times, find residual r
    while m< k
        for j=1:sz
            sum1=0;
            for n=1:(j-1)
                sum1 = A(j,n).*x_next(n) + sum1;
            end
            sum2=0;
            for n=(j+1):sz
                sum2 = A(j,n).*x(n) + sum2;
            end
            x_next(j) = (1-omega).*x(j) + (omega/A(j,j)).*(f(j) - sum1 - sum2);
        end
        r = f-A*x_next;%residual error
        % Setup for next iteration
        x = x_next;
        m = m+1;
    end
    %Restrict problem to courser mesh using restriction
    r = restriction*r;
    coarse_A = restriction*A*prolongation;
    
    %Solve Ae=r using Gauss-Seidal k times
    m=0;
    e = zeros(floor(sz/2),1); % Take any first guess and as long as we choose stuff correctly, it should converge.
    e_next= zeros(floor(sz/2),1);
    %Relax k times, find e
    while m< k
        for j=1:floor(sz/2)
            sum1=0;
            for n=1:(j-1)
                sum1 = coarse_A(j,n).*e_next(n) + sum1;
            end
            sum2=0;
            for n=(j+1):floor(sz/2)
                sum2 = coarse_A(j,n).*e(n) + sum2;
            end
            e_next(j) = (1-omega).*e(j) + (omega/coarse_A(j,j)).*(r(j) - sum1 - sum2);
        end
        % Setup for next iteration
        e = e_next;
        m = m+1;
    end
    %Interpolate e back to finer grid and add e to x from above
    e = prolongation*e;
    x = x+e;
    
    %Run k more times on fine grid
    m=0;
    x_next= zeros(sz,1);
    while m< k
        for j=1:sz
            sum1=0;
            for n=1:(j-1)
                sum1 = A(j,n).*x_next(n) + sum1;
            end
            sum2=0;
            for n=(j+1):sz
                sum2 = A(j,n).*x(n) + sum2;
            end
            x_next(j) = (1-omega).*x(j) + (omega/A(j,j)).*(f(j) - sum1 - sum2);
        end
        v = f-A*x_next;%residual error
        % Setup for next iteration
        x = x_next;
        m = m+1;
    end
    max_error = max(abs(v(:)));
    total_GS_iterations = 3*k;
    
% Solve using GS without multigrid, using ||v|| as stopping condition
    m=0;
    residual = ones(sz,1);
    x = ones(sz,1); % Take any first guess and as long as we choose stuff correctly, it should converge.
    x_next= zeros(sz,1);
    while norm(residual)>norm(v)
        for j=1:sz
            sum1=0;
            for n=1:(j-1)
                sum1 = A(j,n).*x_next(n) + sum1;
            end
            sum2=0;
            for n=(j+1):sz
                sum2 = A(j,n).*x(n) + sum2;
            end
            x_next(j) = (1-omega).*x(j) + (omega/A(j,j)).*(f(j) - sum1 - sum2);
        end
        residual = f-A*x_next;%residual error
        % Setup for next iteration
        x = x_next;
        m = m+1;
    end
    plain_GS_iterations = m; %the number of gauss-seidal iterations to achieve same accuracy as multigrid
    fprintf('k = %d\nmax error = %.9f\ntotal GS iterations = %d\nsame-accuracy GS iterations = %d \n\n',k,max_error,total_GS_iterations,plain_GS_iterations)
end