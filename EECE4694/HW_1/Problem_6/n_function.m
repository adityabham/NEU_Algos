function computed_n_vals = n_function(n)
% ------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 1/25/2020
% Purpose: First function of EECE 4694 HW1 Problem 6 
% Output Parameter: computed_n_vals (vector with all computed n values)
% Input Parameter: n (integer input)
% Usage: computed_n_vals = n_function(n)
% ------------------------------------------------------------------
    ctr = 1; % initializing a counter to record the value of n at each step  
    vals(ctr) = n; % add initial input to row vector 'vals'
    % while n is not equal to 1, the steps below are repeated indefinitely  
    while n ~= 1 
        if rem(n,2) == 0 % if n is an even integer 
            n = n/2;
            ctr = ctr + 1; 
            vals(ctr) = n; 
        elseif rem(n,2) == 1 % if n is an odd integer
            n = 3*n+1;
            ctr = ctr + 1; 
            vals(ctr) = n; 
        end
    end
    % when n=1, the while loop is terminated and the column vector output 
    % 'computed_n_vals' is returned
    computed_n_vals = transpose(vals);  
end