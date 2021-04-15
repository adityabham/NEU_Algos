clear; clc;
format long 

% parameters 
e_0 = 8.85e-12; 
Q_q = 2e-5; 
a = 0.9; 

% force function 
fx = @(x) (1/(4*pi*e_0)) * (Q_q^2 * (x(1))) ./ ((x(1)^2 + a^2)^(3/2));
fplot(fx)
h = 0.01; % step size 
x(1) = -1; % initial condition

% Newton's Method 
maxit = 100; 
tol = 1e-12; 
for i=1:maxit
    fx1 = (fx(x(i)+h) - fx(x(i)-h)) / (2*h); 
    fx2 = (fx(x(i)+h) - 2*fx(x(i)) + fx(x(i)-h)) / (h^2); 
    if (abs(fx1) < tol) 
        break; 
    end
    x(i+1) = x(i) - fx1/fx2; 
    fprintf('%10.5f %8.5f %8.5f %8.5f \n', x(i),fx(x(i)), fx1, fx2)
end
    
% fminunc() function
fx_negative = @(x) -((1/(4*pi*e_0)) * (Q_q^2 * (x(1))) ./ ((x(1)^2 + a^2)^(3/2)));
[x_max,fmaxval] = fminunc(fx_negative,1); 
disp(x_max) 
