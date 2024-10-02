% Define the joint PMF table for X and Y
joint_pmf = [3/16, 1/4; 1/8, 4/16; 0, 3/16];

% Sum the joint PMF over Y to get the marginal PMF of X
p_X = sum(joint_pmf, 2);  % Sum across the columns

% Define the possible values of X
x_values = [0, 1, 2];

% Plot the marginal PMF using a bar plot
figure;
bar(x_values, p_X, 'FaceColor', [0.2, 0.7, 0.9]);  % Create a bar plot
xlabel('X values');
ylabel('p_X(x)');
title('Marginal PMF of X');
grid on;