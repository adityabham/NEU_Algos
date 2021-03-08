Nx = 1000;
k1 = 10; 
p = 0.1; 
[Y,P_k1]=myGeometric(Nx,p,k1); 

h=histogram(Y,max(Y),'Normalization','Probability');  
PMF_est=h.Values; % estimated PMF using the histogram function 
X_values=h.BinEdges(1:end-1)+h.BinWidth/2;  % evaluating bin centers as values for X
stem(X_values,PMF_est,'fill','Linewidth',2); % plot the discrete estimated PMF 
xlabel('y','interpreter','Latex')
ylabel('Estimated $P_Y[y]$','interpreter','Latex')

