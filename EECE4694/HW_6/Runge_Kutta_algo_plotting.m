clear; 
% circuit parameters
C1= 10^(-6);
C2= 10^(-9);
R= 10^(5);
L= 10^(-5);

% functions 
func_VC1 = @(t,vc1,vc2,il,vs) (il./C1)-((vc1-vs-vc2).*(1./(R*C1)));   
func_VC2 = @(t,vc1,vc2,vs) (vc1-vs-vc2).*(1./(R.*C2));
func_IL = @(t,vc1,vs) (vs-vc1).*(1./L);
func_vs = @(t) ((5*10^7*t).*((t < 10^-7)) + (5).*((10^-7 < t) & (t < 0.9*10^-6)) + (50-(5*10^7*t)).*((0.9*10^-6 < t) & (t < 10^-6)));

h=0.01*10^-6; % Step size
final_time=10*10^-6;
num_steps=final_time/h;

% initial conditions
ctr = 1; 
t(ctr)=0;
vc1(ctr)=0;
vc2(ctr)=0;
il(ctr)=0;
vs_value(ctr)=func_vs(t(ctr));

% Runge-Kutta 4th order method
while(ctr<=num_steps) 
    
%   k1
    k1_VC1=func_VC1(t(ctr),vc1(ctr),vc2(ctr),il(ctr),func_vs(t(ctr)));
    k1_VC2=func_VC2(t(ctr),vc1(ctr),vc2(ctr),func_vs(t(ctr)));
    k1_IL=func_IL(t(ctr),vc1(ctr),func_vs(t(ctr)));
    
%   k2 
    k2_VC1=func_VC1(t(ctr)+h/2,vc1(ctr)+h/2*k1_VC1,vc2(ctr)+h/2*k1_VC2,il(ctr)+h/2*k1_IL,func_vs(t(ctr)+h/2));
    k2_VC2=func_VC2(t(ctr)+h/2,vc1(ctr)+h/2*k1_VC1,vc2(ctr)+h/2*k1_VC2,func_vs(t(ctr)+h/2));
    k2_IL=func_IL(t(ctr)+h/2,vc1(ctr)+h/2*k1_VC1,func_vs(t(ctr)+h/2));
    
%   k3
    k3_VC1=func_VC1(t(ctr)+h/2,vc1(ctr)+h/2*k2_VC1,vc2(ctr)+h/2*k2_VC2,il(ctr)+h/2*k2_IL,func_vs(t(ctr)+h/2));
    k3_VC2=func_VC2(t(ctr)+h/2,vc1(ctr)+h/2*k2_VC1,vc2(ctr)+h/2*k2_VC2,func_vs(t(ctr)+h/2));
    k3_IL=func_IL(t(ctr)+h/2,vc1(ctr)+h/2*k2_VC1,func_vs(t(ctr)+h/2));
    
%   k4 
    k4_VC1=func_VC1(t(ctr)+h,vc1(ctr)+h*k3_VC1,vc2(ctr)+h*k3_VC2,il(ctr)+h*k3_IL,func_vs(t(ctr)+h));
    k4_VC2=func_VC2(t(ctr)+h,vc1(ctr)+h*k3_VC1,vc2(ctr)+h*k3_VC2,func_vs(t(ctr)+h));
    k4_IL=func_IL(t(ctr)+h,vc1(ctr)+h*k3_VC1,func_vs(t(ctr)+h));
    
%   outputs
    vc1(ctr+1)=vc1(ctr)+h/6*(k1_VC1+2*k2_VC1+2*k3_VC1+k4_VC1);
    vc2(ctr+1)=vc2(ctr)+h/6*(k1_VC2+2*k2_VC2+2*k3_VC2+k4_VC2);
    il(ctr+1)= il(ctr)+h/6*(k1_IL+2*k2_IL+2*k3_IL+k4_IL);
    t(ctr+1) = t(ctr)+h;
    vs_value(ctr+1)=func_vs(t(ctr+1));
    
    ctr = ctr + 1; 
end

% Plotting 
subplot(2,2,1)
plot(t,vc1)
xlabel('t')
ylabel('Vc1(t)')
title('Subplot 1: Voltage accross capacitor C1')

subplot(2,2,2)
plot(t,vc2)
xlabel('t')
ylabel('Vc2(t)')
title('Subplot 2: Voltage accross capacitor C2')

subplot(2,2,3)
plot(t,il)
xlabel('t')
ylabel('iL(t)')
title('Subplot 3: Current through inductor')

subplot(2,2,4)
plot(t,vs_value)
xlabel('t')
ylabel('Vs(t)')
title('Subplot 4: Vs over time')

