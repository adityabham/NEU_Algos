clear
clc
format long

% a

disp('a')
disp('---------------')
func_1a = @(t) (10.*exp(-t).*sin(2.*pi.*t)).^2; 
func_2a = @(t) (0.*t).^2; 

n1 = 0; 
while(1)
    I1a = integral(func_1a,0,0.5);
    I2a = integral(func_2a,0.5,1);
    rmsa = sqrt(I1a+I2a);

    [I_1a] = GaussQuad(func_1a, 0, 0.5, n1); 
    [I_2a] = GaussQuad(func_2a, 0.5, 1, n1); 
    rms_a = sqrt(I_1a+I_2a);
    
    if rms_a == rmsa
        disp('RMS determined using the Integral function:')
        disp(rmsa) 
        disp('RMS determined using the Gaussian quadrature function:')
        disp(rms_a)
        disp('number of points:')
        disp(n1) 
        break
    end
    n1 = n1+1;
end

% b

disp('b')
disp('---------------')
func_1b = @(t) (5.*exp(-1.25.*t).*sin(2.*pi.*t)).^2; 
func_2b = @(t) (0.*t).^2; 

n2 = 0; 
while(1)
    I1b = integral(func_1b,0,0.5);
    I2b = integral(func_2b,0.5,1);
    rmsb = sqrt(I1b+I2b);

    [I_1b] = GaussQuad(func_1b, 0, 0.5, n2); 
    [I_2b] = GaussQuad(func_2b, 0.5, 1, n2); 
    rms_b = sqrt(I_1b+I_2b);
    
    if rms_b == rmsb
        disp('RMS determined using the Integral function:')
        disp(rmsb) 
        disp('RMS determined using the Gaussian quadrature function:')
        disp(rms_b)
        disp('number of points:')
        disp(n2) 
        break
    end
    n2 = n2+1;
end
