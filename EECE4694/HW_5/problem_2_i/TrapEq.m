function [Trap] = TrapEq(func, n, a, b)
% -------------------------------------------------------------------
% Author: Aditya Bhamidipati  
% Date: 3/3/2020
% Purpose: Trapezoidal Rule
% Output Parameter: Trap (integral estimate)
% Input Parameters: func (function handle),
%                   n (number of segments), 
%                   a (lower limit),
%                   b (upper limit)
% Usage: [Trap] = TrapEq(func, n, a, b)
% -------------------------------------------------------------------

% single segment trapezoidal rule formula 
if n == 1
    h = (b-a)/n;
    Trap = h*(func(a)+func(b))/2; 
% multiple segment trapezoidal rule formula implementation 
else
    points = linspace(a, b, n+1);
    h = abs(points(2) - points(1));
    Trap = (h/2) * (func(points(1)) + 2*sum(func(points(2:n))) + func(points(n+1)));
end
end

