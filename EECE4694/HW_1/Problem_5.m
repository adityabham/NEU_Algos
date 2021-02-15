% Problem 5 
a = 1; 
b = 1000;
N = 1000;
% x created by built in rand function;
% x = N random numbers in the interval (a,b)
x = a+(b-a).*rand(N,1); 
x = round(x); % ensuring elements in x are integers
x = transpose(x); % creating row vector 
x_bar=mean(x); % calculating average of x
variance=(1/numel(x))*sum((x-x_bar).^(2)); % variance summation equation 
disp(variance); 
% since x is creating using the rand function, x is different every time 
% this script is executed outputting a new value of variance.
% If x=(1:1000); variance = 8.3333e+04. 