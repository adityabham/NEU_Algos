A = [3 1 6; -6 0 -16; 0 8 -17];
b = [0 4 17]';  

[P, L, U] = plu_decomposition(A); 

[y_sols] = forward_substitution(L,P,b); 

[x_sols] = backward_substitution(U,y_sols); 

