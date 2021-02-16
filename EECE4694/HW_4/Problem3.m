% Systems of equations for the circuit 
A = [9 -4 0 -2; 4 -15 4 6; 0 -2 5 -1; 1 3 1 -10];
b = [6 12 6 0]';  

% Derivation using PLU algorithm  
[P, L, U] = plu_decomposition(A); 
[y_sols] = forward_substitution(L,P,b); 
[x_sols] = backward_substitution(U,y_sols); 

% Derivation using MATLAB in-built functions
[L_ver,U_ver,P_ver] = lu(A); 
y_sols_ver = L_ver\(P*b);
x_sols_ver = U_ver\y_sols_ver;

