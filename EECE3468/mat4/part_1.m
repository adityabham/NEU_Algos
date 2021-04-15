clear; clc;

N=1000000;    
A=5;         
sigma=2;       
VTh=0;         
p=0.5;        
X1=rand(1,N);
index=(X1<=p);   
X=A*index;  
X(X==0)=-5; 
Z=random('normal',0,sigma,1,N); 
Y=X+Z;      

X_recovered=(Y>VTh); 
X_recovered=X_recovered*A;
X_recovered(X_recovered==0)=-5; 
n_bits_error=sum(X~=X_recovered);
Pe=n_bits_error/N;
fprintf('Computed probability of error:');
disp(Pe) 
Pe_theory=qfunc(A/sigma); 
fprintf('Theoretical probability of error:');
disp(Pe_theory) 

rho=mean((Y-mean(Y)).*(X-mean(X)))/(std(X)*std(Y));
fprintf('Correlation Coefficient between X and Y:');
disp(rho)




