clc; 
clear;
N=1000; % length of the array of random variables 

% Y1=2*X1-1
% X1=Uniform(2,4)

a=2; b=4; 
pd_x1 = makedist('uniform','lower',a,'upper',b); 
X1=random(pd_x1,N,1);
Y1 = 2*X1-1; 

% expected value & variance
calc_mean_1 = mean(Y1); 
calc_var_1 = var(Y1); 
theo_mean_1 = 2*((b+a)/2)-1;
theo_var_1 = 4*((b-a)^2/12);

% Y2=2*X2
% X2=Gaussian(Normal)(mu=2,sigma=1)

pd_x2 = makedist('Normal','mu',2,'sigma',1); 
X2=random(pd_x2,N,1);
Y2 = 2*X2; 

% expected value & variance
calc_mean_2 = mean(Y2); 
calc_var_2 = var(Y2); 
theo_mean_2 = 4;
theo_var_2 = 4;
