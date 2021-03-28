clc; 
clear;
N=1000; % length of the array of random variables 

% X1=Uniform(2,4)

a=2; b=4; 
pd_x1 = makedist('uniform','lower',a,'upper',b); 
X1=random(pd_x1,N,1);
X1_sort=sort(X1); 
fX1=pdf(pd_x1,X1_sort); 
figure(1)
plot(X1_sort,fX1,'Color','r', 'LineWidth', 2); % pdf 
FX1=cdf(pd_x1,X1_sort);
figure(2)
plot(X1_sort,FX1,'Color','r', 'LineWidth', 2); % cdf

% expected value
calc_mean_1 = mean(X1_sort); 
calc_var_1 = var(X1_sort); 
% variance
theo_mean_1 = (b+a)/2;
theo_var_1 = (b-a)^2/12;

% X2=Gaussian(Normal)(mu=2,sigma=1) 

pd_x2 = makedist('Normal','mu',2,'sigma',1); 
X2=random(pd_x2,N,1);
X2_sort=sort(X2);
fX2=pdf(pd_x2,X2_sort); 
figure(3)
plot(X2_sort,fX2,'Color','r', 'LineWidth', 2); % pdf
FX2=cdf(pd_x2,X2_sort);
figure(4)
plot(X2_sort,FX2,'Color','r', 'LineWidth', 2); % cdf

% expected value
calc_mean_2 = mean(X2_sort); 
calc_var_2 = var(X2_sort); 
% variance
theo_mean_2 = 2;
theo_var_2 = 1;

% X3=Exponential(lambda=0.5)
lambda = 0.5; 
pd_x3 = makedist('Exponential','mu',1/lambda); 
X3=random(pd_x3,N,1);
X3_sort=sort(X3);
fX3=pdf(pd_x3,X3_sort); 
figure(5)
plot(X3_sort,fX3,'Color','r', 'LineWidth', 2); % pdf
FX3=cdf(pd_x3,X3_sort);
figure(6)
plot(X3_sort,FX3,'Color','r', 'LineWidth', 2); % cdf

% expected value
calc_mean_3 = mean(X3_sort); 
calc_var_3 = var(X3_sort); 
% variance
theo_mean_3 = 1/lambda;
theo_var_3 = 1/(lambda)^2;




