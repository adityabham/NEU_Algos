% Algorithm to determine the machine epsilon
epsilon = 1;  % Set ε = 1
while(1)  
    if epsilon + 1 <= 1 % If 1+ε is <= 1 the loop terminates
        break
    else
        epsilon = epsilon/2; % Repeated until prior condition is met 
    end 
end
epsilon = 2*epsilon; 
disp(epsilon)

% Validating using eps function
disp(eps) 