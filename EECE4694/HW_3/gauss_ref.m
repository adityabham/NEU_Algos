syms x1 x2 x3
eqns = [4*x1+8*x2+1*x3 == 8, -2*x1-3*x2+2*x3 == 14, 1*x1+3*x2+4*x3 == 30];
[A,b] = equationsToMatrix(eqns); 

[~,n] = size(A);
sols = zeros(n,1); 

% Forward Elimination
for i = 1:n-1
    m = A(i+1:n,i)/A(i,i);
    A(i+1:n,:) = A(i+1:n,:) - m*A(i,:); 
    b(i+1:n,:) = b(i+1:n,:) - m*b(i,:); 
end

% Backward Substitution
sols(n,:) = b(n,:)/A(n,n); 
for j = n-1:-1:1
    sols(j,:) = (b(j,:) - A(j,j+1:n)*sols(j+1:n,:))/A(j,j);
end
