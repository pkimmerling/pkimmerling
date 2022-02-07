%% The DTMC Version 1 %%
P = zeros(3,3);
%%% Transition Matrix
P = [0.95 0.09 0.08; 0.03 0.89 0.03; 0.02 0.02 0.89];

x = [0.0637;0;0.9363];

P1 = P*x
P2 = P*P1
P3 = P*P2
P4 = P*P3
P5 = P*P4


P6 = P*P5 %2020
P7 = P*P6 %2030

%% The DTMC Version 2 %%
