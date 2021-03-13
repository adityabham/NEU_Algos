clc; 
clear; 
Nx = 1000;
k1 = 10; 
p = 0.1; 

[Y1,~]=myGeometric(Nx,p,k1); 
[Y2,~]=myGeometric(Nx,p,k1); 
[Y3,~]=myGeometric(Nx,p,k1); 
[Y4,~]=myGeometric(Nx,p,k1); 

Z = Y1 + Y2 + Y3 + Y4; % sum of four independent geometric RVs
P_k1=sum(Z==k1)/Nx;
str=['Probability [Z=',num2str(k1),']',' ','Simulation:',num2str(P_k1)]; 
disp(str)

h=histogram(Z,max(Z),'Normalization','Probability');  
% estimated PMF using the histogram function 
PMF_est=h.Values; 
% evaluating bin centers as values for Z
Z_values=h.BinEdges(1:end-1)+h.BinWidth/2;  
% plot the discrete estimated PMF 
stem(round(Z_values),PMF_est,'fill','Linewidth',2); 
xlabel('z','interpreter','Latex')
ylabel('Estimated $P_Z[z]$','interpreter','Latex')

