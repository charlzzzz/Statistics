% Marginal PMF of X
estimated_p_X = sum(estimated_joint_pmf, 2);

% Marginal PMF of Y
estimated_p_Y = sum(estimated_joint_pmf, 1);

disp(estimated_p_X);
disp(estimated_p_Y);
