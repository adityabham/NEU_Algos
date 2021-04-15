clear;clc; 
load  Noise_Samples

N=1000000;      
A=5;                     
p=0.55;        
X1=rand(1,N);
index=(X1<=p);   
X=A*index;  
X(X==0)=-5;

figure(1)
nbins=100;
Hz=histogram(Z_samples,nbins, 'normalization', 'CDF', 'Edgecolor',[0.4 0.4  0.4]);
Fz=Hz.Values;
Z_values=Hz.BinEdges(1:end-1)+Hz.BinWidth/2;
xlabel('Z', 'interpreter', 'latex')
ylabel('$$F_Z(z)$$', 'interpreter', 'latex')
Z=myRVSampleValues(Fz, Z_values, N);

Y = X+Z; 
Y_H1=Y(index);  
Y_Ho=Y(~index); 
figure(2)
nbins=100;
ho=histogram(Y_Ho,nbins, 'normalization', 'pdf', 'Edgecolor',[0.4 0.4  0.4]);
fy_Ho=ho.Values;
y_values_Ho=ho.BinEdges(1:end-1)+ho.BinWidth/2;
hold on
h1=histogram(Y_H1,nbins, 'normalization', 'pdf', 'Edgecolor',[0.4 0.4  0.4]);
fy_H1=h1.Values;
y_values_H1=h1.BinEdges(1:end-1)+h1.BinWidth/2;
xlabel('y', 'interpreter', 'latex')
legend([h1,ho],{'$f_{Y|H_1}(y)$ '  '$f_{Y|H_o}(y)$'},'interpreter', 'latex')
figure(3)
plot(y_values_H1,p*fy_H1,y_values_Ho,(1-p)*fy_Ho)
xlabel('y', 'interpreter', 'latex')
legend({'$P[H_1]f_{Y|H_1}(y)$ '  '$P[H_0] f_{Y|H_o}(y)$'},'interpreter', 'latex')

X_recovered=(Y>0); 
X_recovered=X_recovered*A;
X_recovered(X_recovered==0)=-5; 
n_bits_error=sum(X~=X_recovered);
Pe=n_bits_error/N;
fprintf('Computed probability of error:');
disp(Pe) 

function SampleValues = myRVSampleValues(CDF, Values, Ns)
SampleValues=zeros(1,Ns);
 for k=1:Ns
  r=rand(1,1);      
  check=r>CDF;      
  idx=nnz(check)+1; 
  SampleValues(k)=Values(idx);       
 end
end


