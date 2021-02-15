function [val] = doSolnsExist(A,b)
% -------------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/2/2020
% Purpose: doSolnsExist function EECE 4694 HW2 Problem 3
% Output Parameter: val (statement integer value returned)
% Input Parameter: A (coefficient matrix), 
%                  B (solution vector)
% Usage: [val] = doSolnsExist(A,b)
% -------------------------------------------------------------------------
% A has dimensions m x n where n is number of unknowns
[~,num_unknowns] = size(A); 
% Concatenating matrices A & b 
c = [A b]; 
% if rank(A) == rank(c), the system is consistent  
if rank(A) == rank(c)
    if rank(A) == num_unknowns
        disp('2 −> There is a unique solution.') 
        val = 2;  
    elseif rank(A) < num_unknowns 
        disp('3 −> There are an infinite number of solutions.') 
        val = 3; 
    end
% if rank(A) < rank(c), the system is inconsistent  
elseif rank(A) < rank(c)
    disp('1 −> This system has no solutions.') 
    val = 1; 
end 
end 


