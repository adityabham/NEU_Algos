format long 

func_i1a = @(t) (10.*exp(-t).*sin(2.*pi.*t)).^2; 
func_i2a = @(t) 0^2; 

[I_1a] = adaptive_quadrature(func_i1a, 0, 0.5, 1e-9); 
[I_2a] = adaptive_quadrature(func_i2a, 0.5, 1, 1e-9); 
rms_a = sqrt(I_1a+I_2a);
disp(rms_a)

func_i1b = @(t) (5.*exp(-1.25.*t).*sin(2.*pi.*t)).^2; 
func_i2b = @(t) 0^2; 

[I_1b] = adaptive_quadrature(func_i1b, 0, 0.5, 1e-9); 
[I_2b] = adaptive_quadrature(func_i2b, 0.5, 1, 1e-9); 
rms_b = sqrt(I_1b+I_2b);
disp(rms_b)