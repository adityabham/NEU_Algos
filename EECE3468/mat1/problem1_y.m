clear
Sy=[0 0.5 2];
Py=[0.1 0.5 0.4]; 
Fy=cumsum(Py);
Nt = 10000; 
for k=1:Nt 
    r=rand(1,1); 
    check=r>Fy; 
    idx=nnz(check)+1;
    y(k)=Sy(idx);
end

h=histogram(y,50,'Normalization','Probability');
PMF_est=h.Values;
X_values=h.BinEdges(1:end-1)+h.BinWidth/2;
stem(X_values,PMF_est,'fill','Linewidth',2);
xlabel('y','interpreter','Latex')
ylabel('Estimated $P_Y[y]$','interpreter','Latex')