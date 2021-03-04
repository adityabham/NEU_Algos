function [I] = GaussQuad(func, a, b, n)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 3/3/2020
% Purpose: Gaussian Quadrature
% Output Parameter: I (integral estimate)
% Input Parameters: func (function handle),
%                   a (lower limit),
%                   b (upper limit),
%                   n (order of Gaussian quadrature)
% Usage: [I] = GaussQuad(func, a, b, n)
% -------------------------------------------------------------------

constant = (b-a)/2; 
% generate the Gaussian coefficient
[x, c] = GaussLegendre_2(n); 

% Gaussian Quadrature formula implementation 
I = 0;  
for i=1:n
    xd = constant+constant*x(i); 
    f = c(i)*func(xd); 
    I = I + f; 
end
I = constant * I; 
end

 