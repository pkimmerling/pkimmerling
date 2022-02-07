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

%% The CTMC version %%
clear all
close all
P0vec = [0.0637; 0; 0.9363]; % Initial population of R;C;L nodes for vector version
P0mat = eye(3); % Initial matrix for matrix version
Q = zeros(3,3); % Initializing generation matrix Q

%%%% Initializing the coefficients of 2
alpha1 = 2.5;
alpha2 = 1.5;
beta1 = 4;
beta2 = 4.5;
gamma1 = 1;
gamma2 = 1.75;

%%%% Defining Q in terms of the transition rates
Q = [-(alpha1 + alpha2) beta1 gamma2;alpha2 -(beta1+beta2) gamma1;alpha1 beta2 -(gamma1+gamma2)];
lambda = zeros(3,1);
% [D,V] = eig(Q)
% D
% V
lambda = sort(eig(Q)) % Finding eigenvalues of Q, needed to sort
% We know that lambda(1) is the most negative which corresponds with
% lambda3 in the paper, so lambda(2) corresponds to lambda2,lambda(3)=0


%%%% 1960 corresponds with n=0 and each ten years after is 0.2 more. Each
%%%% year is 0.02 more, with 2010 lining up with 1 and 2030 with 1.4
n = 1.4; %Ending time
t=[0:.01:n]; %Running time from 0 to n in 0.01 increments

one = ones(length(t),1);
%%%% Computing x2(t) and x3(t)
x2 = ((lambda(1)^2).*(one-exp(lambda(2).*t)) - (lambda(2)^2).*(one-exp(lambda(1).*t)))./((lambda(2)^2)*lambda(1) - (lambda(1)^2)*lambda(2));
x3 = (lambda(2).*(one+exp(lambda(1).*t)) - lambda(1).*(one+exp(lambda(2).*t)))./((lambda(2)^2)*lambda(1) - (lambda(1)^2)*lambda(2));

%%%% x2 and x3 turned out to be matrices in the end but we want vectors so
%%%% take first row (all rows were identical)
x2actual = x2(1,:);
x3actual = x3(1,:);

%%%% Computing and plotting P(t) vector
hold on
for i=1:length(t)
    Pvec = (eye(3)+x2actual(i).*Q + x3actual(i).*Q*Q)*P0vec; %%%% P(t) is now defined
    plot(t(i),Pvec(1),'+'); %Recycling
    plot(t(i),Pvec(2),'.'); %Combustion
    plot(t(i),Pvec(3),'o'); %Landfill
end
Pvec
xlabel('Time: 1 corresponds to 50 years');ylabel('P_i(t)'); title('RCL Percentages CTMC');
axis([0,n,0,1]);

hold off

legend('P_1(t): Recycling','P_2(t): Combustion','P_3(t): Landfill')
%%%% Computing P(t) matrix
for i=1:length(t)
    Pmat = (eye(3)+x2actual(i).*Q + x3actual(i).*Q*Q)*P0mat; %%%% P(t) is now defined
end
Pmat

%%%% Calculating stationary distribution

pivec = (eye(3) + ((lambda(1)^2-lambda(2)^2)/(lambda(1)*lambda(2)^2 - lambda(2)*lambda(1)^2)).*Q+((lambda(2)-lambda(1))/(lambda(1)*lambda(2)^2 - lambda(2)*lambda(1)^2)).*Q*Q)*[1;0;0]
Q*pivec

%%%% Associated transition matrix of EMC

T = zeros(3);
for i = 1:3
    for j = 1:3
        if i ~= j
            T(j,i) = -Q(j,i)/Q(i,i);
        end    
    end
end
T