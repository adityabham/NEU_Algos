clc; 
clear;
N=1000; % length of the array of random variables 
nbins=100;

% Y1=2*X1-1
% X1=Uniform(2,4)

a=2; b=4; 
pd_x1 = makedist('uniform','lower',a,'upper',b); 
X1=random(pd_x1,N,1);
Y1 = 2*X1-1; 
Y1 = sort(Y1); 

h1=histogram(Y1,nbins, 'normalization', 'probability');
fy1=h1.Values/h1.BinWidth;
y1_values=h1.BinEdges(1:end-1)+0.5*h1.BinWidth;
figure(1) 
plot(y1_values,fy1,'b', 'LineWidth', 1.5);


