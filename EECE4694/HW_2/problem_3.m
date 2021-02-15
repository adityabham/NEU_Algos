% a 
A1 = [25 5 1; 64 8 1; 144 12 1];
b1 = [106.8; 177.2; 279.2]; 
[val1] = doSolnsExist(A1,b1); 

% b
A2 = [25 5 1; 64 8 1; 89 13 2];
b2 = [106.8; 177.2; 284.0]; 
[val2] = doSolnsExist(A2,b2); 

% c
A3 = [25 5 1; 64 8 1; 89 13 2];
b3 = [106.8; 177.2; 280.0]; 
[val3] = doSolnsExist(A3,b3); 

% d 
syms x y z 
eqns4 = [1*x+1*y+1*z == 1, 1*x+1*y-1*z == 0, 1*x+1*y+0*z == 0];
[A4,b4] = equationsToMatrix(eqns4); 
[val4] = doSolnsExist(A4,b4); 

% e 
syms x1 x2 x3
eqns5 = [25*x1+5*x2+1*x3 == 106.8, 64*x1+8*x2+1*x3 == 177.2, 
    144*x1+12*x2+1*x3 == 279.2 ,89*x1+13*x2+2*x3 == 284.0];
[A5,b5] = equationsToMatrix(eqns5); 
[val5] = doSolnsExist(A5,b5); 