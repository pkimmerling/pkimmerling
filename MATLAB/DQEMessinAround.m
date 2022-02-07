% Q1 = [0 0 0 0;1/sqrt(2) 0 0 0;0 0 0 0;1/sqrt(2) 0 0 0;0 1/sqrt(2) 0 0;0 0 0 0;0 1/sqrt(2) 0 0;0 0 0 0;0 0 0 0;0 0 1/sqrt(2) 0;0 0 0 0;0 0 1/sqrt(2) 0; 0 0 0 1/sqrt(2);0 0 0 0;0 0 0 1/sqrt(2);0 0 0 0];
% Q2 = [0 0 0 0;0 1/sqrt(2) 0 0;0 0 0 0;0 0 0 1/sqrt(2);1/sqrt(2) 0 0 0;0 0 0 0;0 0 1/sqrt(2) 0;0 0 0 0;0 0 0 0;0 1/sqrt(2) 0 0;0 0 0 0;0 0 0 1/sqrt(2);1/sqrt(2) 0 0 0;0 0 0 0;0 0 1/sqrt(2) 0; 0 0 0 0];
% R1 = 2*(Q1*Q1.') - eye(16);
% round(R1)
% R2 = 2*(Q2*Q2.') - eye(16);
% round(R2)
% U = R2*R1;
% round(U)
% e12 = [0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
% R1*e12;
% U*e12;

%M = [0 0.5 0.5;0.5 0 0.5;0.5 0.5 0]%our 3-cycle markov chain
M = [0 0.5 0 0.5;0.5 0 0.5 0;0 0.5 0 0.5; 0.5 0 0.5 0]
n = size(M,1);
for i = 1:n
    for j = 1:n
        N(i,j) = sqrt(M(i,j));
    end
end
I = eye(n);
Q1 = zeros(n^2,n);
for k = 1:n
    Q1(:,k) = kron(I(:,k),N*I(:,k));
end
Q1
Q2 = zeros(n^2,n);
for l = 1:n
    Q2(:,l) = kron(N.'*I(:,l),I(:,l));
end
Q2
R1 = 2*(Q1*Q1.') - eye(n^2);
R2 = 2*(Q2*Q2.') - eye(n^2);
U = R2*R1;
%e12 = [0;1;0;0;0;0;0;0;0] %3d e12
e12 = [0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%4d e12
e23 = [0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0];
R1*e23
U*e23

A = [0 1 0 1;1 0 1 0; 0 1 0 1;1 0 1 0];
L = A-2*eye(4);
[evectors,evalues] = eig(A)
inv(evectors)
[levectors,levalues] = eig(L)
inv(levectors)
syms t
e2 = [0 0 0 0;0 1 0 0;0 0 0 0;0 0 0 0];
D_A = [exp(-2i*t) 0 0 0; 0 1 0 0; 0 0 1 0;0 0 0 exp(2i*t)];
U_A = inv(evectors)*D_A*evectors
U_A*e2
D_L = [exp(-4i*t) 0 0 0; 0 exp(-2i*t) 0 0; 0 0 exp(-2i*t) 0; 0 0 0 1];
U_L = inv(evectors)*D_L*evectors
U_L*e2