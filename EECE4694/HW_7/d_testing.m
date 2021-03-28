clear;clc;
format long

v1 = xlsread('diode_data.xlsx','A3:A22');
v2 = xlsread('diode_data.xlsx','B3:B22');
[n,~] = size(v2);
r1 = 10e3; 
Id=zeros(1,n);

% part a
for i=1:n
     Id(i) = (v1(i)-v2(i))/r1; 
end
Id = Id';

% part b 
z = log(Id);
p = polyfit(v2,z,1); 
Is = exp(p(2));
Vt = 1/p(1); 
yfit = Is*exp(v2/Vt); 
plot(v2,Id,'*'); grid on;
hold on;
plot(v2,yfit)

% part c 
k = 1.38e-23; 
q = 1.6e-19;
T_calc = Vt*q/k; 
disp(T_calc); 

% part d 
nVt = 1/p(1);
n = (q*nVt)/(k*300); 
disp(n) 

