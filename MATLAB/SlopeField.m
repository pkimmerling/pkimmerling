function SlopeField
% (C) Matthew N. Moore - 5/15/2017
% This function displays the slope field of a differential equation
% dy/dx = f(x, y), where f is defined as a sub-function.
% This implementation uses the ODE: y' = x + y. Can be changed on line 60.
% The particular solution of defined (calculated manually) on line 51.
close all;
% Computational Domain
ax = -10;   ay = -10;       bx =  10;            by =  10;
Nx = 50;    Ny = 50;        hx = (bx - ax)/Nx;   hy = (by - ay)/Ny;
x(1, :) = ax:hx:bx;        y(1, :) = ay:hy:by;
m = zeros(Ny + 1, Nx + 1);
% Calculation of the slope of the line segments
for l = 1 : (Ny + 1)   
    m(l, :) = f(x(1, 1:(Nx+1)), y(1, l));
end
% Plots the each line segment on a domain (x-eps, x+eps); eps = hx/d
figure(1);
for l = 1 : (Nx + 1)
    for k = 1 : (Ny + 1)
        % Determines "proper" segment length as a function of slope
        if (abs(m(l, k) <= 5))
           d = 4; 
        end
        
        if (abs(m(l, k) <= 3))
           d = 2; 
        end
        
        if (abs(m(l, k)) <= 2)
            %d = (1/m(l,k))*log(real(abs(m(l, k))+1));
            d = 1;
        else
            d = 1;
        end
        
        % Endpoints of the line segment
        A = [(x(1, k)- hx*hy/d), (x(1, k) + hx*hy/d)];
        B = [-m(l, k)*hx/2 + y(1, l), m(l, k)*hx/2 + y(1, l)];
        hold on;    plot(A, B, 'k--');
    end
end
% Plots a Particular Solution
y = exp(x) - x - 1;
plot(x, y, 'r-');
grid on;    axis([ax-.5, bx+.5, ay-.5, by+.5]);
t = title('Slope field for $\frac{dy}{dx} = x+y$, with Particular Solution $y(x) = e^{x} - x - 1$');
set(t,'Interpreter','Latex', 'FontSize', 12);
end
function z = f(x, y)
    z = x+y;
end