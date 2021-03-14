clc; clear;
% parameters
q = 1.6e-19; 
Nd = 1e16; 
Na = 0.3e16;
xn = 0.15e-6;
xp = 0.5e-6;
h = 0.005e-6;
epsilon = 1.04e-12; 

% p-type region 
xp_range = -xp:h:0; 
bvpfcn_p = @(x,phi) [phi(2); (q*Na)/epsilon];
bcfcn_p = @(phia,phib) [phia(2); phib(1)];
solinit_p = bvpinit(xp_range, [1 0]);
sol_p = bvp4c(bvpfcn_p, bcfcn_p, solinit_p);
phi_test_p = sol_p.y(1,:);

% n-type region 
xn_range = 0:h:xn; 
bvpfcn_n = @(x,phi) [phi(2); (-q*Nd)/epsilon];
bcfcn_n = @(phia,phib) [phia(1); phib(2)];
solinit_n = bvpinit(xn_range, [1 0]);
sol_n = bvp4c(bvpfcn_n, bcfcn_n, solinit_n);
phi_test_n = sol_n.y(1,:);

plot(xp_range,phi_test_p,'b','LineWidth',1.5)
hold on;
plot(xn_range,phi_test_n,'g','LineWidth',1.5)


