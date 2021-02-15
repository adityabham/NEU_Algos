function [y_sols] = forward_substitution(L,P,b)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/12/2020
% Purpose: Forward Substitution 
% Output Parameter: y_sols (solution vector y)
% Input Parameters: L (lower triangular matrix),
%                   P (permutation matrix),
%                   b (right-hand side vector)              
% Usage: [y_sols] = forward_substitution(L,P,b)
% -------------------------------------------------------------------

b_prime = P*b; 
n = length(L); 
y_sols = zeros(n,1);

y_sols(1,:) = b_prime(1,:)/L(1,1);
for i = 2:n
     s = b_prime(i,:);
     for j = 1:i-1
        s = s - L(i,j) * y_sols(j,:);
     end
     y_sols(i,:) = s/L(i,i);
end
end

