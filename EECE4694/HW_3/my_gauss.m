% Converting system of equations to the form [A][X]=[B].
syms x1 x2 x3
% System of equations in Problem 2
eqns = [4*x1+8*x2+1*x3 == 8, -2*x1-3*x2+2*x3 == 14, 1*x1+3*x2+4*x3 == 30];
[A_eval,b_eval] = equationsToMatrix(eqns); 

% Calling function below to find the solution to the system of equations
[x_eval_sols] = gauss(A_eval,b_eval); 

% circuit i 
% Ai = [3 -2 -1; -2 9 -4; -2 -8 15];
% bi = [10 0 0]';  
% [x_sols_i] = gauss(Ai,bi); 
% x_sols_i = inv(Ai) * bi;
% x_sols_i = Ai \ bi; 

% circuit ii 
% Aii = [3 -2 0; -4 15 -10; 0 -10 13];
% bii = [10 0 38]';  
% [x_sols_ii_a] = gauss(Aii,bii);
% x_sols_ii_b = inv(Aii) * bii;
% x_sols_ii_c = Aii \ bii; 

function [x_sols] = gauss(A,b)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/8/2020
% Purpose: Gaussian Elimination Forward Elimination 
%          and Backward Substitution 
% Output Parameter: x_sols (solution to the system of equations)
% Input Parameter: A (coefficient matrix), 
%                  b (right-hand side vector)
% Usage: [x_sols] = gauss(A,b)
% -------------------------------------------------------------------
% A has dimensions m x n where n is number of unknowns
[~,n] = size(A);
% Preallocating solutions vector 
x_sols = zeros(n,1); 

% Forward Elimination to convert A to upper triangular form
for k= 1:n-1 % top row
    for i = k+1:n % bottom row
        xmult = A(i,k)/A(k,k); % multiplier 
        A(i,k) = 0; % bottom row first element = 0 
        % iterate through bottom row and compute elements using
        % multiplier
        for j = k+1:n
            A(i,j) = A(i,j)-(xmult)*A(k,j); 
        end
        % compute right-hand side vector elements using multiplier
        b(i,:) = b(i,:) - (xmult)*b(k,:);
    end
end

% Backward Substitution to fill in solution vector 
x_sols(n,:) = b(n,:)/A(n,n); % computing last element of solution vector
% iterate starting from the second to last row to the first row 
for i = n-1:-1:1 
    s = b(i,:); % defining sum of row using right-hand side vector
    for j = i+1:n
        % subtract known solutions from sum
        s = s - A(i,j) * x_sols(j,:);
    end
    % compute unknown solution
    x_sols(i,:) = s/A(i,i); 
end
end 
