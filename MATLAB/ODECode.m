%% Euler's Method
% Citation: https://www.mathworks.com/matlabcentral/answers/278300-matlab-code-help-on-euler-s-method
% Initial conditions and setup
h = 0.1;  % step size
x = 0:h:4;  % the range of x
y = zeros(size(x));  % allocate the result y
y(1) = 0;  % the initial y value
n = numel(y);  % the number of y values
% The loop to solve the DE
for i=1:n-1
    f = x(i)+2*y(i); %the expression for y' in your DE
    y(i+1) = y(i) + h*f;
end
x
y
plot(x,y)
%% Solve 1st order linear ODE symbolically
% Citation: https://www.mathworks.com/help/symbolic/solve-a-single-differential-equation.html
syms y(t)
ode = diff(y,t) == t+2*y; % diff(dependent, independent)
ySol(t) = dsolve(ode)

%With initial condition
cond = y(1) == 0;
ySol(t) = dsolve(ode,cond)