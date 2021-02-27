format long

fun1 = @(x) 1./((5.*exp(3.*x))+(2.*exp(-3.*x))); 
I1 = integral(fun1,0,3); 
disp(I1) 

fun2 = @(x) sinh(x)-cos(x);
I2 = integral(fun2,0,pi); 
disp(I2) 

fun3 = @(x) log(x)./(1-x.^2); 
I3 = integral(fun3,0,1); 
disp(I3) 

fun4 = @(x) (3.*exp(x))./((1-x.^2).^0.5); 
I4 = integral(fun4,0,1); 
disp(I4) 