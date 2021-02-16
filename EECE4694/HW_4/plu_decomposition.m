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

n = length(A); % length of coefficient matrix A   
L = zeros(n,n); % nxn zero matrix
U = A; % initalizing matrix U with coefficient matrix A
P = eye(n); % nxn identity matrix

% Convert U to upper triangular form and L to lower triangular form
% while adjusting the permutation matrix. 
for k = 1:n-1 % top row 
    % adjusting the column k per iteration 
    col = U(:,k);
    col = col(k:end);
    % finding the max value and corresponding index of column k 
    [max_val, idx] = max(abs(col)); 
    if max_val == 0 
        disp("error - matrix is non invertible") 
        break;
    end
    % offset to account for column k adjustment 
    idx = idx + k-1;
    % swapping rows ′k′ and ′idx′ in the L, U, and P matrices  
    temp_L=L(k,:);
    L(k,:)=L(idx,:);
    L(idx,:)=temp_L;

    temp_U=U(k,:);
    U(k,:)=U(idx,:);
    U(idx,:)=temp_U;

    temp_P=P(k,:);
    P(k,:)=P(idx,:);
    P(idx,:)=temp_P;
    
    for i = k+1:n % bottom row 
        xmult = U(i,k)/U(k,k); % multiplier 
        U(i,k) = 0; % U bottom row first element = 0 
        L(i,k) = xmult; % L bottom row first element = multiplier
        % iterate through bottom row of U and compute elements using
        % multiplier
        for j = k+1:n
            U(i,j) = U(i,j)-(xmult)*U(k,j); 
        end
    end
end
L = L + eye(n); % add diagonal 1 elements
end

