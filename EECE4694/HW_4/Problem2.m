% Systems of equations from Problem 1 
A = [3 1 6; -6 0 -16; 0 8 -17];
b = [0 4 17]';  

% PLU decomposition algorithm
[P, L, U] = plu_decomposition(A); 

% Forward Substitution algorithm
[y_sols] = forward_substitution(L,P,b); 

% Backward Substitution algorithm
[x_sols] = backward_substitution(U,y_sols); 