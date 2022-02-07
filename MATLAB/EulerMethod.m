% Euler's Method
% Initial conditions and setup
h = (enter your step size here);  % step size
x = (enter the starting value of x here):h:(enter the ending value of x here);  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = (enter the starting value of y here);  % the initial y value
n = numel(y);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = %the expression for y' in your DE
    y(i+1) = y(i) + h * f;
end