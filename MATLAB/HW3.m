%%% Math 544 HW 3 %%%

%% Use Rayleigh Quotient on%%
clear 
A = [9 1;1 2];
n = size(A,1);

for i = 1:4
    if i==1
        q0 = [1;1]
    elseif i ==2
        q0 = [1;-1]
    elseif i == 3
        q0 = [50;0]
    elseif i == 4
        q0 = [0;50]
    end
    rho = 1;
    m = 0;
    while norm(A*q0-rho.*q0)>10e-9
        rho = (q0'*A*q0)/(q0'*q0);
        q_hat = inv(A - rho.*eye(n))*q0;
        q0 = (1/q_hat(1)).*q_hat;
        m = m+1;
        fprintf('%d & %.9f & %.9f\\\\ \n',m,q0(2),rho)
    end
end
