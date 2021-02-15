function [P, L, U] = plu_decomposition(A)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/12/2020
% Purpose: PLU Decomposition 
% Output Parameters: P (permutation matrix)
%                    L (lower triangular matrix)
%                    U (upper triangular matrix) 
% Input Parameter: A (coefficient matrix)              
% Usage: [P, L, U] = plu_decomposition(A)
% -------------------------------------------------------------------

n = length(A);  
L = zeros(n,n);
U = A;
P = eye(n); 

for k = 1:n-1
    col = U(:,k);
    col = col(k:end); 
    [max_val, idx] = max(abs(col)); 
    if max_val == 0 
        disp("error - matrix is non invertible") 
        break;
    end
    idx = idx + k-1;
    
    temp_L=L(k,:);
    L(k,:)=L(idx,:);
    L(idx,:)=temp_L;

    temp_U=U(k,:);
    U(k,:)=U(idx,:);
    U(idx,:)=temp_U;

    temp_P=P(k,:);
    P(k,:)=P(idx,:);
    P(idx,:)=temp_P;
    
    for i = k+1:n 
        xmult = U(i,k)/U(k,k); 
        U(i,k) = 0;
        L(i,k) = xmult; 
        for j = k+1:n
            U(i,j) = U(i,j)-(xmult)*U(k,j); 
        end
    end
end
L = L + eye(n); 
end

