function [I] = adaptive_quadrature(func, a, b, abstol)

h1 = (b-a)/2;
h2 = h1/2;
c = (a+b)/2;
d = (a+c)/2; 
e = (c+b)/2; 

Ih1 = h1/3*(func(a) + 4*func(c) + func(b));
Ih2 = h2/3 * (func(a) + 4*func(d) + 2*func(c) + 4*func(e) + func(b));

Ea = abs(Ih2 - Ih1); 

if Ea <= abstol
    I = Ih2 + (1/15)*(Ih2 - Ih1); 
else
    Ia = adaptive_quadrature(func, a, c, abstol); 
    Ib = adaptive_quadrature(func, c, b, abstol); 
    I = Ia + Ib; 
end
end

