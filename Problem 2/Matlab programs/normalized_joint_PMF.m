% Count occurrences of each (x, y) pair
counts = histcounts2(X_realizations, Y_realizations, [0 1 2], [0 1]);

% Normalize to get the estimated joint PMF
estimated_joint_pmf = counts / M;
disp(estimated_joint_pmf);
