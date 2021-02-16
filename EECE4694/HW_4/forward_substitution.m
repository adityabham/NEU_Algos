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
% Ly = Pb 

b_prime = P*b; 
n = length(L); % length of matrix L  
y_sols = zeros(n,1); % preallocating y_sols vector 

% Forward Substitution to fill in y_sols vector 
y_sols(1,:) = b_prime(1,:)/L(1,1); % first element in y_sols
% iterate starting from the second row to the last row 
for i = 2:n 
     % defining sum of row using b_prime vector
     s = b_prime(i,:); 
     for j = 1:i-1
        % subtract known solutions from sum
        s = s - L(i,j) * y_sols(j,:);
     end
     % compute unknown solution
     y_sols(i,:) = s/L(i,i);
end
end

