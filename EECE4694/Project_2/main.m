clear; clc;

% Objective function 
fx= @(x) -(12*x(1)+10*x(2)+15*x(3)+10*x(4));
% initial guesses
x0=[10; 10; 10; 10];
% Linear inequality constraints
A = [15 12 18 13; 10 8 12 9; 8 10 12 4; 15 12 17 13];
B = [1440; 1440; 1440; 1440];
% Lower bound
lb=[10; 10; 10; 10];

% fmincon function
[xmax,~] = fmincon(fx,x0,A,B,[],[],lb,[]);
xmax = round(xmax); 

fileID = fopen('output.txt','w');

% A
fprintf(fileID,'Part A\n');
fprintf(fileID,'-------\n');
fprintf(fileID,'Optimal Number of type A Circuit Boards: %6.2f\n',xmax(1));
fprintf(fileID,'Optimal Number of type B Circuit Boards: %6.2f\n',xmax(2));
fprintf(fileID,'Optimal Number of type C Circuit Boards: %6.2f\n',xmax(3));
fprintf(fileID,'Optimal Number of type D Circuit Boards: %6.2f\n',xmax(4));
fprintf(fileID,'\n');

% B
fprintf(fileID,'Part B\n');
fprintf(fileID,'-------\n');
fprintf(fileID,'Total Profit for the week: %6.2f\n',-fx(xmax));
fprintf(fileID,'\n');

% C
S = sum(A);
A_minutes = xmax(1)*S(1); 
B_minutes = xmax(2)*S(2); 
C_minutes = xmax(3)*S(3); 
D_minutes = xmax(4)*S(4); 
fprintf(fileID,'Part C\n');
fprintf(fileID,'-------\n');
fprintf(fileID,'Total # of minutes to produce all the type A Circuit Boards: %6.2f\n',A_minutes);
fprintf(fileID,'Total # of minutes to produce all the type B Circuit Boards: %6.2f\n',B_minutes);
fprintf(fileID,'Total # of minutes to produce all the type C Circuit Boards: %6.2f\n',C_minutes);
fprintf(fileID,'Total # of minutes to produce all the type D Circuit Boards: %6.2f\n',D_minutes);
fprintf(fileID,'\n');

% D 
etch_and_lam_minutes = sum(A(1,:)' .* xmax);
drilling_minutes = sum(A(2,:)' .* xmax);
assembly_minutes = sum(A(3,:)' .* xmax);
testing_minutes = sum(A(4,:)' .* xmax);
fprintf(fileID,'Part D\n');
fprintf(fileID,'-------\n');
fprintf(fileID,'Total # of minutes spent in Etching and Lamination: %6.2f\n',etch_and_lam_minutes);
fprintf(fileID,'Total # of minutes spent in Drilling: %6.2f\n',drilling_minutes);
fprintf(fileID,'Total # of minutes spent in Assembly: %6.2f\n',assembly_minutes);
fprintf(fileID,'Total # of minutes spent in Testing: %6.2f\n',testing_minutes);
fprintf(fileID,'\n');

