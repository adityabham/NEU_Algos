function [x_sols] = backward_substitution(U,y_sols)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/12/2020
% Purpose: Back Substitution
% Output Parameter: x_sols (solution vector x)
% Input Parameters: U (upper triangular matrix),
%                   y_sols (solution vector y)            
% Usage: backward_substitution(U,y_sols)
% -------------------------------------------------------------------

n = length(U);  
x_sols = zeros(n,1); 

x_sols(n,:) = y_sols(n,:)/U(n,n); 
for i = n-1:-1:1 
    s = y_sols(i,:);
    for j = i+1:n
        s = s - U(i,j) * x_sols(j,:);
    end
    x_sols(i,:) = s/U(i,i); 
end
end

