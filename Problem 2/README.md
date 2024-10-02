# Statistics Assignment - 1


Problem  2: Expected value and variance

|     | y=0  | y=1  |
|-----|------|------|
|x=0  | 3/16 | 1/4  |
|x=1  | 1/8  | 4/16 |
|x=2  | 0    | 3/16 |

(a) Calculating $p_X[x]$,

$$p_X(x) = \sum_{y=0}^1 pX,Y(x,y)$$

pX(0)= pX,Y(0,0)+pX,Y(0,1) = 3/16+1/4 = 7/16 

pX(1)= pX,Y(1,0)+pX,Y(1,1) = 1/8+4/16 = 6/16

pX(2)= pX,Y(2,0)+pX,Y(2,1) = 3/16

Code to sketch marginal PMF of X,

```
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
```
<img src="/Users/charles/GIT_local/Statistics/Problem 2/Marginal_PMF_X.fig" alt="Logo">


(b) Computing mean $\mu_x$,

$$\mu_x = Exp[X] = \sum_{x=0}^2 x.p_X(x)$$

$\mu_x$ = 0.pX(0)+1.pX(1)+2.pX(2) = 0+6/16+2.3/16 = 12/16 = 3/4 = 0.75

(c) Computing Variance of X, $\sigma_X^2$

$$\sigma_X^2 = Exp[X-\mu_x] = \sum_{x=0}^2 (X-\mu_x)^2.p_x(X)$$

$\sigma_X^2 = (-0.75)^2.p_x(0)+ (1-0.75)^2.p_x(1)+(2-0.75)^2.p_x(2)$ = 0.56 . 7/16 + 0.06 . 6/16 + 0.29 . 3/16= 0.24+0.02+0.29 = 0.56

(d) Write a MATLAB program to generate a set of M realizations of X, Y

```M = 100;  % Number of realizations

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
```
(e) Estimate the Normalized Joint PMF
```
% Count occurrences of each (x, y) pair
counts = histcounts2(X_realizations, Y_realizations, [0 1 2], [0 1]);

% Normalize to get the estimated joint PMF
estimated_joint_pmf = counts / M;
disp(estimated_joint_pmf);
```
(f) Estimate the Normalized Marginal PMFs 𝑝^𝑋[𝑥] and 𝑝^𝑌[𝑦]
```
% Marginal PMF of X
estimated_p_X = sum(estimated_joint_pmf, 2);

% Marginal PMF of Y
estimated_p_Y = sum(estimated_joint_pmf, 1);

disp(estimated_p_X);
disp(estimated_p_Y);
```

(g) calculating correlation coefficient,

 Calculating $p_Y[y]$,

$$p_Y(y) = \sum_{x=0}^2 pX,Y(x,y)$$

pY(0)= pY,X(0,0)+pY,X(0,1)+pY,X(0,2) = 3/16+1/8+0 = 5/16 

pY(1)= pY,X(1,0)+pY,X(1,1)+pY,X(1,2) = 1/4+4/16+ 3/16= 11/16

$$ E[X] = \sum_{x=0}^2 x.p_X(x) $$

$E[X]$=0.7/16+1.6/16+2.3/16=12/16 = 0.75

$$ E[X^2] = \sum_{x=0}^2 x^2.p_X(x) $$

$E[X^2]=0.7/16+1^2.6/16+2^2.3/16=18/16 = 1.125$

$$ E[Y] = \sum_{y=0}^2 y.p_Y(y) $$

$E[Y]$=0.5/16+1.11/16=11/16 = 0.6875

$$ E[Y^2] = \sum_{y=0}^2.y^2.p_Y(y) $$

$E[Y^2]=0.5/16+1^2.11/16=11/16 = 0.6875$

$$ E[XY] = \sum_{x=0}^2\sum_{y=0}^1 x.y.p_{X,Y}(x,y) $$

$E[XY] = (1.0).p_{xy}(1,0) + (1.1).p_{xy}(1,1) = 0+4/16 = 4/16$

$(2.0).p_{xy}(2,0) + (2.1).p_{xy}(2,1) = 0+(2.1.3/16) = 6/16$

$E[XY] = 4/16+6/16 = 10/16 = .625$

$var(Y)= E_Y[Y^2]-E_Y[Y]^2 = 0.6875 - (0.6875)^2 = 0.6875-0.4726 = 0.214$

$var(X)= E_X[X^2]-E_X[X]^2 = 1.125-0.5625 = 0.5625$

$cov(X,Y) = E[X,Y] - E[X].E[Y] = 0.625 - (.75.0.6875) = 0.109$

$$\rho_{X,Y}=Cov(X,Y)/\sigma_X.\sigma_Y$$

$\sigma_x = \sqrt{0.56} = .75$
$\sigma_y = \sqrt{0.2} = 0.46$

$\rho_{X,Y}=0.109/0.75.0.46 = 0.314$



