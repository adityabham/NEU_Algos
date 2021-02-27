function [Int_est] = romberg(func, a, b, maxit, es)
I = zeros(10,10);
n = 1; 
I(1,1) = TrapEq(func, n, a, b);
iter = 0;
while(1)
    iter = iter + 1; 
    n = 2^iter; 
    I(iter+1,1) = TrapEq(func, n, a, b); 
    for k = 2:iter+1
        j = 2 + iter - k;  
        I(j,k) = (4^(k-1) * I(j+1,k-1) - I(j,k-1)) / (4^(k-1) - 1); 
    end
    ea = abs((I(1,iter+1) - I(2,iter)) / I(1,iter+1)) * 100; 
    if iter >= maxit
        break
    elseif ea <= es
        break 
    end
    Int_est = I(1,iter+1); 
end
