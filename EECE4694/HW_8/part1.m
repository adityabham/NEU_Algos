clear; clc;

% a
fun1 = @(x) x(1)^4 + 10*x(1)^3 - 20*x(1) -15;
fun1_negative = @(x) -(x(1)^4 + 10*x(1)^3 - 20*x(1) -15);
interval_1 = [-10,4];
% fplot(fun1,interval_1)
[x1_min,fminval1] = fminunc(fun1,-8); 
[x1_max,fmaxval1] = fminunc(fun1_negative,-1); 
disp(x1_min) 
disp(x1_max) 


% b 
fun2 = @(x) ((sin(x(1)-0.75))^2)./(x(1)^2 -1.5*x(1) + 0.5625);
fun2_negative = @(x) -(((sin(x(1)-0.75))^2)./(x(1)^2 -1.5*x(1) + 0.5625));
interval_2 = [-4,6];
% fplot(fun2,interval_2)
[x2_min1,fminval2_1] = fminunc(fun2,-2); 
[x2_min2,fminval2_2] = fminunc(fun2,3);
[x2_max,fmaxval2] = fminunc(fun2_negative,1); 
disp(x2_min1) 
disp(x2_min2) 
disp(x2_max) 



