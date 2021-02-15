function [root, relative_true_error_perc] = divide_and_average(a) 
% -------------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 2/1/2020
% Purpose: Divide and average function for EECE 4694 HW2 Problem 2
% Output Parameter: root (square root of any positive number input), 
% relative_true_error_perc (% relative true error of the final approximation)
% Input Parameter: a (positive number input)
% Usage: [root, relative_true_error_perc] = divide_and_average(a) 
% -------------------------------------------------------------------------
x = a; % initialization of x for first iteration of the while loop  
while(1)
    format long
    % divide and average method
    x_n = (x+(a/x))/2; 
    % Approximate Error
    ea = x_n-x; 
    % Relative Approximate Error as a percentage
    relative_approximate_error_perc = (ea/x_n)*100; 
    % stopping criterion (6 significant digits)
    if abs(relative_approximate_error_perc) <= 0.5*10^-4 
        % True Error of the final approximation
        et = sqrt(a)-x_n; 
        % Relative True Error as a percentage
        relative_true_error_perc = (et/a)*100; 
        break;
    else 
        % update x value each iteration 
        x = x_n; 
    end
end
root = x_n; 
end 