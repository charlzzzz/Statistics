M = 100;  % Number of realizations

% Define the joint PMF table
joint_pmf = [3/16, 1/4; 1/8, 4/16; 0, 3/16];

% Possible values of X and Y
x_values = [0, 1, 2];
y_values = [0, 1];

% Flatten the joint PMF and corresponding (x, y) pairs
pmf_flat = joint_pmf(:);  % Convert to a single column
pairs = [repmat(x_values', 2, 1), repelem(y_values', 3)];

% Generate random indices based on the joint PMF
indices = randsample(1:length(pmf_flat), M, true, pmf_flat);

% Generate the realizations of X and Y
realizations = pairs(indices, :);
X_realizations = realizations(:, 1);
Y_realizations = realizations(:, 2);

% Display first few realizations
disp([X_realizations(1:10), Y_realizations(1:10)]);
