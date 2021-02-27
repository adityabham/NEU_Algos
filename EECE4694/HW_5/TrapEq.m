function [Trap] = TrapEq(func, n, a, b)
if n == 1
    h = (b-a)/n;
    Trap = h *(func(a)+func(b))/2; 
else
    points = linspace(a, b, n+1);
    h = abs(points(2) - points(1));
    Trap = (h/2) * (func(points(1)) + 2*sum(func(points(2:n))) + func(points(n+1)));
end
end

