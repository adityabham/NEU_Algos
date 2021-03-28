clc; clear;
% parameters
q = 1.6e-19; 
Nd = 1e16; 
Na = 0.3e16;
xn = 0.15e-6;
xp = 0.5e-6;
h = 0.005e-6;
epsilon = 1.04e-12; 

% n-type region region parameters 
xn_range = 0:h:xn; % range
Nn = round(xn/h); % step count

% Generating coefficent matrix from dervied algebraic expressions 
An = -2 * eye(Nn+1);
An(1,1)=1;
An(Nn+1,Nn)=1; 
An(Nn+1,Nn+1)=-1;  

for i=1:Nn-1
    An(i+1,i)=1;
    An(i+1,i+2)=1;
end

% Generating right-hand solutions vector 
bn = (h^2)*(-q*Nd)/epsilon .* ones(1,Nn+1);
bn(1) = 0; 
bn(Nn+1) = ((h^2)/2)*(-q*Nd)/epsilon; 

% Solving for Φ using in-built MATLAB linear system solver 
phi_n = An\bn'; 


