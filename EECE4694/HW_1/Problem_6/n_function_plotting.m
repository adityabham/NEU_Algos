n_value_range = (1:100); % array of n value range
% calling second function using n_value_range as the input argument 
step_array = n_wrapper(n_value_range);  

% Plot: “number of steps” on the y- axis, and “n” on the x-axis
figure('DefaultAxesFontSize',14)
plot(n_value_range,step_array, 'LineWidth', 1.5)
title('number of steps vs. n')
xlabel('n')
ylabel('number of steps')
legend('steps vs n', 'FontSize',12, 'Location','west')

% max: (97,119)
