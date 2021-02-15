function [approx,ea,n,et] = maclaurin(x,maxit,tol)
% -------------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/8/2020
% Purpose: Maclaurin series expansion for the cosine function
% Output Parameter: approx (estimate of cos(x)), 
%                   ea (approximate relative error),
%                   n (the number of iterations),
%                   et (true relative error)
% Input Parameter: x (number input),
%                  maxit (maximum number of iterations),
%                  tol (pre-specified tolerance)
% Usage: [approx,ea,n,et] = maclaurin(x,maxit,tol),
%        [approx,ea,n,et] = maclaurin(x,maxit),
%        [approx,ea,n,et] = maclaurin(x)     
% -------------------------------------------------------------------------
format long 
% default values of tol and maxit 
if nargin < 2
    maxit = 100; 
end
if nargin < 3
    tol = 0.000001;
end

sum = 0; 
for n = 0:maxit
    % Maclaurin series approximation for cos(x) 
    approx = sum+((-1)^n)*(x^(2*n))/(factorial(2*n)); 
    % approximate error
    approx_error = approx-sum; 
    ea = approx_error/approx; 
    % true error
    true_error = cos(x)-approx; 
    et = true_error/cos(x); 
    % stopping criterion abs(ea) <= pre-specified tolerance
    if abs(ea) <= tol
        break
    else
        % update sum value each iteration 
        sum = approx;  
    end 
end 
end

