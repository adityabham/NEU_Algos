clc; clear;
% parameters
q = 1.6e-19; 
Nd = 1e16; 
Na = 0.3e16;
xn = 0.15e-6;
xp = 0.5e-6;
h = 0.005e-6;
epsilon = 1.04e-12; 
x_plot = -xp:h:xn; 

% p-type region 
xp_range = -xp:h:0; 
Np = round(xp/h); 

Ap = -2 * eye(Np+1);
Ap(1,1) = 1;
Ap(1,2) = -1;
Ap(Np+1,Np+1) = 1;  

for i=1:Np-1
    Ap(i+1,i) = 1;
    Ap(i+1,i+2) = 1;
end

bp = (h^2)*(q*Na)/epsilon .* ones(1,Np+1);
bp(1) = (-(h^2)/2)*(q*Na)/epsilon; 
bp(Np+1) = 0;

phi_p = Ap\bp'; 

% bvp4c
bvpfcn_p = @(x,phi) [phi(2); (q*Na)/epsilon];
bcfcn_p = @(phia,phib) [phia(2); phib(1)];
solinit_p = bvpinit(xp_range, [1 0]);
sol_p = bvp4c(bvpfcn_p, bcfcn_p, solinit_p);
phi_test_p = sol_p.y(1,:);

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

% bvp4c
bvpfcn_n = @(x,phi) [phi(2); (-q*Nd)/epsilon];
bcfcn_n = @(phia,phib) [phia(1); phib(2)];
solinit_n = bvpinit(xn_range, [1 0]);
sol_n = bvp4c(bvpfcn_n, bcfcn_n, solinit_n);
phi_test_n = sol_n.y(1,:);

% plotting 
subplot(2,1,1);
plot(xp_range,phi_p,'b','LineWidth',1.5)
hold on;
plot(xn_range,phi_n,'g','LineWidth',1.5)
xlabel('x (meters)','FontSize', 14)
ylabel('Electric Potential Φ (V)','FontSize', 14)
title('Subplot 1: Electric Potential Φ vs x (using the finite difference equations)','FontSize', 14)
legend('p-type region','n-type region','Location','southeast','FontSize', 14)

subplot(2,1,2); 
plot(xp_range,phi_test_p,'bx-','LineWidth',1.5)
hold on;
plot(xn_range,phi_test_n,'gx-','LineWidth',1.5)
xlabel('x (meters)','FontSize', 14)
ylabel('Electric Potential Φ (V)','FontSize', 14)
title('Subplot 2: Electric Potential Φ vs x (using the bvp4c function)','FontSize', 14)
legend('p-type region','n-type region','Location','southeast','FontSize', 14)

