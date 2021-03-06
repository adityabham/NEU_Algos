clear
Sx=[ -2 -1 0 1 2]; % Sample space of X
Px=[0.2 0.25 0.1 0.25 0.2]; % PMF of X
Fx=cumsum(Px); % CDF of X
Nt = 10000; % Number of trials
for k=1:Nt 
    r=rand(1,1); 
    check=r>Fx; 
    idx=nnz(check)+1;
    x(k)=Sx(idx);
end

% Generating histogram to plot PMF of X  
h=histogram(x,50,'Normalization','Probability');
PMF_est=h.Values;
X_values=h.BinEdges(1:end-1)+h.BinWidth/2;
stem(X_values,PMF_est,'fill','Linewidth',2);
xlabel('x','interpreter','Latex')
ylabel('Estimated $P_X[x]$','interpreter','Latex')

