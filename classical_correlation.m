% Define probabilities and biases
% Problem Statement : lambda is my hidden variable that takes value H or T 
% All are uniformly distributed but B has some biasness in his measurement 
% that's create weak correlation.

% Define measurement outcomes and probabilities
A = [1, -1; 1, -1; 1, -1; 1, -1]; % Alice's outcomes for different settings
B = [0.8, 0.2; 0.4, 0.6]; % Bob's probabilities matrix
p = 0.7; % Probability of lambda being H

function E = compute_correlations(A, B, p)
    % Computes the correlation E(A, B)
    % A: Measurement outcome vector for Alice (length 2)
    % B: Measurement probabilities matrix for Bob (2x2)
    % p: Probability of lambda being H

    % Validate inputs
    if length(A) ~= 2 || size(B,1) ~= 2 || size(B,2) ~= 2
        error('Invalid dimensions for inputs.');
    end

    % Hidden variable outcomes
    A_H = A(1); % Outcome when lambda = H
    A_T = A(2); % Outcome when lambda = T

    % Bob's outcomes given lambda
    E_B_given_H = B(1,1) * 1 + B(2,1) * (-1); % E[B | lambda = H]
    E_B_given_T = B(1,2) * 1 + B(2,2) * (-1); % E[B | lambda = T]

    % Compute correlation
    E = p * A_H * E_B_given_H + (1 - p) * A_T * E_B_given_T;
end

function S = compute_bell_inequality(A, B, p)
    % Computes the Bell inequality value S
    % A: 4x2 matrix of Alice's outcomes
    % B: 2x2 matrix of Bob's probabilities
    % p: Probability of lambda being H
    
    % Validate input dimensions
    if size(A,1) ~= 4 || size(A,2) ~= 2 || size(B,1) ~= 2 || size(B,2) ~= 2
        error('Invalid dimensions for inputs.');
    end
    
    % Compute correlations for all pairs
    E_A1_B1 = compute_correlations(A(1,:), B, p); % E(A1, B1)
    E_A1_B2 = compute_correlations(A(2,:), B, p); % E(A1, B2)
    E_A2_B1 = compute_correlations(A(3,:), B, p); % E(A2, B1)
    E_A2_B2 = compute_correlations(A(4,:), B, p); % E(A2, B2)
    
    % Compute Bell inequality value
    S = abs(E_A1_B1 + E_A1_B2 + E_A2_B1 - E_A2_B2);
end

% Call the Bell inequality function
S = compute_bell_inequality(A, B, p);

% Display the result
fprintf('Bell inequality value S: %.2f\n', S);

% Check if it satisfies Bell's inequality
if S <= 2
    disp('The Bell inequality is satisfied.');
else
    disp('The Bell inequality is violated.');
end

