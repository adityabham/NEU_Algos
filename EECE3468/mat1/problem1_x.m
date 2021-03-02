clear
Sx=[ -2 -1 0 1 2];
Px=[0.2 0.25 0.1 0.25 0.2]; 
Fx=cumsum(Px);
Nt = 10000; 
for k=1:Nt 
    r=rand(1,1); 
    check=r>Fx; 
    idx=nnz(check)+1;
    x(k)=Sx(idx);
end

h=histogram(x,50,'Normalization','Probability');
PMF_est=h.Values;
X_values=h.BinEdges(1:end-1)+h.BinWidth/2;
stem(X_values,PMF_est,'fill','Linewidth',2);
xlabel('x','interpreter','Latex')
ylabel('Estimated $P_X[x]$','interpreter','Latex')

