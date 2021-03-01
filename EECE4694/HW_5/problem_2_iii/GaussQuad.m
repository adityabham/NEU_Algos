function [I] = GaussQuad(func, a, b, n)

c = (b-a)/2; 
[x, w] = GaussLegendre_2(n); 

I = 0;  
for i=1:n
    xd = c+c*x(i); 
    f = w(i)*func(xd); 
    I = I + f; 
end
I = c * I; 
end

