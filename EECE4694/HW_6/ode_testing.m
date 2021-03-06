clear; 
tspan = 0:.01*10^-6:10*10^-6; %tspan param 
i=[0 0 0]'; % initial conditions 

[t,x]=ode45(@homework,tspan,[0 0 0]'); % ode45 function 

% ode45 outputs
vc1 = x(:,1); 
vc2 = x(:,2);
il = x(:,3);

% plotting 
subplot(2,2,1)
plot(t,vc1)
xlabel('t')
ylabel('Vc1(t)')
title('Subplot 1: Voltage accross capacitor C1');

subplot(2,2,2)
plot(t,vc2)
xlabel('t')
ylabel('Vc2(t)')
title('Subplot 2: Voltage accross capacitor C2');

subplot(2,2,3)
plot(t,il)
xlabel('t')
ylabel('iL(t)')
title('Subplot 3: Current through inductor');


function RLC=homework(t,x)
C1= 10^(-6);
C2= 10^(-9);
R= 10^(5);
L= 10^(-5);
vs = ((5*10^7*t).*((t < 10^-7)) + (5).*((10^-7 < t) & (t < 0.9*10^-6)) + (50-(5*10^7*t)).*((0.9*10^-6 < t) & (t < 10^-6)));
RLC(1) = (x(3)./C1)-((x(1)-vs-x(2)).*(1./(R*C1))); 
RLC(2) = (x(1)-vs-x(2)).*(1./(R.*C2)); 
RLC(3) = (vs-x(1)).*(1./L); 
RLC = RLC'; 
end

