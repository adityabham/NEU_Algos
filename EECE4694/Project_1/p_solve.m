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
