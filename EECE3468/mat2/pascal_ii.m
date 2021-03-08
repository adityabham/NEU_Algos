Nx = 1000;
k1 = 10; 
p = 0.1; 

[Y1,~]=myGeometric(Nx,p,k1); 
[Y2,~]=myGeometric(Nx,p,k1); 
[Y3,~]=myGeometric(Nx,p,k1); 
[Y4,~]=myGeometric(Nx,p,k1); 

Z = Y1 + Y2 + Y3 + Y4; 
P_k1=sum(Z==k1)/Nx;

h=histogram(Z,max(Z),'Normalization','Probability');  
PMF_est=h.Values; % estimated PMF using the histogram function 
X_values=h.BinEdges(1:end-1)+h.BinWidth/2;  % evaluating bin centers as values for X
stem(X_values,PMF_est,'fill','Linewidth',2); % plot the discrete estimated PMF 
xlabel('z','interpreter','Latex')
ylabel('Estimated $P_Z[z]$','interpreter','Latex')

