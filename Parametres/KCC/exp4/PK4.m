%EM initialization
%Expectation of initial state
filter::t_0 = 
[0	0]

%Initial state covariance matrix
filter::Q_0 = 
[1	0
0	1]

%Transition matrix
filter::F =
[0	0
1	0]

%Noise covariance matrix
filter::Q =
[1	0
0	3]

%Dimension of x
filter::size_x = 1

%Constant part of F
EM::F_0 =
[0	0
1	0]
%Constant part of Q
EM::Q_0 =
[1	0
0	3]
%Number of EM iterations
%Default : 0 (filtering and smoothing only!)
nb_iter_EM = 100

%Equivalence constraint
% 0 -> nothing
% 1 -> Deccorelation and known process noise covariance 
% 2 -> Known state equations
% 3 -> Known observation equations
EM::equivalence_type = 0

%Constraining F
%Block ids of the rows.
%Default: PKF estimation
F::block::sets =
[1	1]

%Block hypothesis
% "known_block" or 0 : known block
% "free_block" or 3 : free block (t1_block where M = I )
% "t1_block" or 1 : F = G M 
% "t2_block" or 2 : F = \sum_{i=1}^{n_{\lambda}} \lambda_i M_i
%Block transformation matrix
% - "I" or "Identity" for Identity
% - matrix if not
% I by default
F::block(1)::hypothesis = 2
F::block(1)::P = "I"
F::block(1)::t2_block::nb_lambda = 1
F::block(1)::t2_block::M(1) = 
[1	-2
-1	2]


%Constraining Q
%Block ids of the rows.
%Default: F::block::sets
Q::block::sets = [1	1]
Q::block(1)::hypothesis = "t2_block"

EM:first_state_estimation = 1
