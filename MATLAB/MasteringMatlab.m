%% Actual:Let's first define an identity matrix of size n
n = 4;
I = eye(n);
J = ones(n);
Z = zeros(n);
m = 3;

delta = eye(n,m) %(rows, columns)

C = [1 2;3 4;5 6]
B = 3.*J

%One way to initialize a matrix is to start out with one of these and use a
%loop to populate it iteratively.
A = ones(n);
for i=1:n
    A(i,:) = i+1; %this performs the same action on all of the elements of the i-th row
    A(:,i) = i^2; %this performs the same action on all of the elements of the i-th column
    A(i,i) = A(1,3); %we can also self-reference
end
A
x = A(:,2)

D = rand(n); %Generate an nxn matrix with random entries between 0 and 1
E = randi(n); %Generates a random integer between 1 and n
F = randi(100,n) %Generates an nxn matrix with integer entries between 1 and 100
G = magic(n)

%% New Section
A = ones(n);
for i=1:n
    A(i,:) = i+1; %this performs the same action on all of the elements of the i-th row
    A(:,i) = i^2; %this performs the same action on all of the elements of the i-th column
    A(i,i) = A(1,3); %we can also self-reference
end
[evectors,evalues] = eig(A)
[Q,R] = qr(A)
[U,S,V] = svd(A) %A = USV^T

%% Notes: Some Copies of stuff above but also some other stuff I didn't get to.
n = 4; %If I don't want something to print, put a semi-colon to end the line
I = eye(n)

%We can also generate a matrix of zeros or a matrix of ones
Z = zeros(n)
O = ones(n)

%Both of these take second input arguments if you need non-square matrices
m=3;
delta = eye(n,m)
z = zeros(n,m)
o = ones(n,m)

%One way to initialize a matrix is to start out with one of these and use a
%loop to populate it iteratively.
A = ones(n)
for i=1:n
    A(i,:) = i+1; %this performs the same action on all of the elements of the i-th row
    A(:,i) = i^2; %this performs the same action on all of the elements of the i-th column
    A(i,i) = A(1,3); %we can also self-reference
end
A  %Simply typing a variable will print it out
B = rand(n) % will generate a nxn matrix with random entries between 0 and 1
C = randi(n) %generates a random integer between 1 and n
D = randi(m,n) %generates an nxn matrix with random integers entries between 1 and m
E = [1 2;3 4;5 6] %lastly we could simply type it out.Use spaces to separate entries, semi-colons rows.

%% Say we had a two matrices and we wanted to compare them
A = ones(n)
B = rand(n)
A == B %Because none of the entries match, the logical array contains only zeros. 
%If they did match, it would contain 1's in those entries. Sizes do need to match.

%Definitely want basic matrix operations:
sum = A+B
prod = A*B
power = A^m

%If we want to perform entry-wise operations we do .(operation):
(0.5).*A
A.^m
A.*B

%If you want conjugate transpose, it's ' but if you only want transpose, it's .'
A'

%If you want the inverse of a matrix
A_inv = inv(A)
%BUT if you're trying to solve Ax=b, better to use x = b\A
b = [1;2;3;4]
x = b\A

%% So you wanna talk about eigen-things
A = [1 2;3 4] %Use A = [1 2;3 4] to show that errors kick in.
e = eig(A) %Just gives a vector containing the eigenvalues
[evectors,evalues] = eig(A) % produces both, with eigenvalues in a diagonal matrix
%Check
A*evectors(:,1) == evectors(:,1)*evalues(1,1) %Errors abound, so be careful

%To actually check, check norm of difference:
norm(A*evectors(:,1)-evectors(:,1)*evalues(1,1))%Pretty small, basically at machine precision

% Characteristic polynomial
syms x;
p = charpoly(A,x)
factor(p) %can't be factored over the rationals

rank(A)%full rank
%% Singular Value Decomposition

A = ones(n);
for i=1:n
    A(i,:) = i+1; %this performs the same action on all of the elements of the i-th row
    A(:,i) = i^2; %this performs the same action on all of the elements of the i-th column
    A(i,i) = A(1,3); %we can also self-reference
end
A
s = svd(A)%Just grabs the singular values
[U,S,V] = svd(A) %S will be diagonal, U and V will be unitary
norm(A - U*S*V') %darn small
norm(A-U*S*V)%not small, require the transpose of V

%When trying to solve a linear system, it's important to know if the matrix
%A is ill-conditioned or not. You can call
%The coefficient matrix is called ill-conditioned if a small change in the
%constant coefficients results in a large change in the solution.
dA = decomposition(A)
tf = isIllConditioned(dA) %not ill conditioned, could solve Ax=b without issue

%Also works on rectangular matrices
E = [1 2;3 4;5 6]
[U1,S1,V1] = svd(E)
%% QR Decomposition
A = ones(n);
for i=1:n
    A(i,:) = i+1; 
    A(:,i) = i^2; 
    A(i,i) = A(1,3); 
end
A
[Q,R] = qr(A) %Q is orthogonal, R will be upper triangular
norm(Q*R - A) %Pretty darn small, good enough

%Also works on rectangular matrices
E = [1 2;3 4;5 6]
[Q1,R1] = qr(E)
%% Galleries for testing
%Sometimes we desire to test something on a bunch of matrices of a certain
%type. the gallery() function can do this

A1 = gallery('jordbloc', 3, 2)%So I can generate Jordan Blocks and then insert them if needed.
A2 = gallery('minij',n)%I can also generate a symmetric positive definite matrix