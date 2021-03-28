clc; 
clear;
N=1000; % length of the array of random variables 
nbins=100;

% Y2=2*X2
% X2=Gaussian(Normal)(mu=2,sigma=1)

pd_x2 = makedist('Normal','mu',2,'sigma',1); 
X2=random(pd_x2,N,1);
Y2 = 2*X2; 
Y2 = sort(Y2); 

h2=histogram(Y2,nbins, 'normalization', 'probability');
fy2=h2.Values/h2.BinWidth;
y2_values=h2.BinEdges(1:end-1)+0.5*h2.BinWidth;
figure(1) 
plot(y2_values,fy2,'b', 'LineWidth', 1.5);