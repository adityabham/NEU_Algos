clc; clear;
% parameters
q = 1.6e-19; 
Nd = 1e16; 
Na = 0.3e16;
xn = 0.15e-6;
xp = 0.5e-6;
h = 0.005e-6;
epsilon = 1.04e-12; 

% n-type region 
xn_range = 0:h:xn; 
Nn = round(xn/h);

An = -2 * eye(Nn+1);
An(1,1)=1;
An(Nn+1,Nn)=1; 
An(Nn+1,Nn+1)=-1;  

for i=1:Nn-1
    An(i+1,i)=1;
    An(i+1,i+2)=1;
end

bn = (h^2)*(-q*Nd)/epsilon .* ones(1,Nn+1);
bn(1) = 0; 
bn(Nn+1) = ((h^2)/2)*(-q*Nd)/epsilon; 

phi_n = An\bn'; 

figure(1);
plot(xn_range,phi_n);

% bvp4c comp
bvpfcn_n = @(x,phi) [phi(2); (-q*Nd)/epsilon];
bcfcn_n = @(phia,phib) [phia(1); phib(2)];
solinit_n = bvpinit(xn_range, [1 0]);
sol_n = bvp4c(bvpfcn_n, bcfcn_n, solinit_n);
phi_test_n = sol_n.y(1,:);
figure(2);
plot(xn_range,phi_test_n);
