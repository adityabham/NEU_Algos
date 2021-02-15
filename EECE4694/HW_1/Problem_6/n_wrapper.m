function step_array = n_wrapper(n_range)
% ------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 1/25/2020
% Purpose: Second function of EECE 4694 HW1 Problem 6 
% Output Parameter: step_array (vector of recorded steps for each value of n)
% Input Parameter: n_range (array of n value range)
% Usage: step_array = n_wrapper(n_range)
% ------------------------------------------------------------------
    ctr=1;  % initializing a counter to record steps value of each n 
    % initlizing an array of all zeros that is the same size as n_range
    step_array = zeros(1,numel(n_range)); 
    for n=n_range
        n_vector = n_function(n); % first function called for each n 
        step_array(ctr) = numel(n_vector); % number of steps recorded 
        ctr=ctr+1;
    end 
end
