format long 

func_i1a = @(t) (10.*exp(-t).*sin(2.*pi.*t)).^2; 
func_i2a = @(t) 0^2; 

[Int_est_1a] = romberg(func_i1a, 0, 0.5, 10, 1e-9); 
[Int_est_2a] = romberg(func_i2a, 0.5, 1, 10, 1e-9); 
rms_a = sqrt(Int_est_1a+Int_est_2a);
disp(rms_a)

func_i1b = @(t) (5.*exp(-1.25.*t).*sin(2.*pi.*t)).^2; 
func_i2b = @(t) 0^2; 

[Int_est_1b] = romberg(func_i1b, 0, 0.5, 10, 1e-9); 
[Int_est_2b] = romberg(func_i2b, 0.5, 1, 10, 1e-9);
rms_b = sqrt(Int_est_1b+Int_est_2b);
disp(rms_b)