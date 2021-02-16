function [x_sols] = backward_substitution(U,y_sols)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/12/2020
% Purpose: Backward Substitution
% Output Parameter: x_sols (solution vector x)
% Input Parameters: U (upper triangular matrix),
%                   y_sols (solution vector y)            
% Usage: backward_substitution(U,y_sols)
% -------------------------------------------------------------------
% Ux= y

n = length(U); % length of matrix U  
x_sols = zeros(n,1); % preallocating x_sols vector 

% Backward Substitution to fill in y_sols vector 
x_sols(n,:) = y_sols(n,:)/U(n,n); % first element in x_sols
% iterate starting from the second to last row to the first row 
for i = n-1:-1:1 
    % defining sum of row using y_sols vector
    s = y_sols(i,:);
    for j = i+1:n
        % subtract known solutions from sum
        s = s - U(i,j) * x_sols(j,:);
    end
    % compute unknown solution
    x_sols(i,:) = s/U(i,i); 
end
end

