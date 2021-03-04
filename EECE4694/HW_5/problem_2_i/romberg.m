function [I] = romberg(func, a, b, maxit, es)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 3/3/2020
% Purpose: Romberg Integration
% Output Parameter: I (integral estimate)
% Input Parameters: func (function handle),
%                   a (lower limit),
%                   b (upper limit),
%                   maxit (maximum iterations),
%                   es (pre-specified tolerance)
% Usage: [I] = romberg(func, a, b, maxit, es)
% -------------------------------------------------------------------
% Translated from pseudo-code provided 

I_mat = zeros(10,10); %
n = 1; 
I_mat(1,1) = TrapEq(func, n, a, b); % single segment trapezoidal rule
iter = 0;
while(1)
    iter = iter + 1; 
    n = 2^iter; 
    I_mat(iter+1,1) = TrapEq(func, n, a, b); % multiple segment trapezoidal rule
    for k = 2:iter+1
        j = 2 + iter - k;  
        % Romberg Integration general pattern 
        I_mat(j,k) = (4^(k-1) * I_mat(j+1,k-1) - I_mat(j,k-1)) / (4^(k-1) - 1); 
    end
    ea = abs((I_mat(1,iter+1) - I_mat(2,iter)) / I_mat(1,iter+1)) * 100; 
    if iter >= maxit || ea <= es || isnan(ea)
        break 
    end
end
    I = I_mat(1,iter+1); 
end