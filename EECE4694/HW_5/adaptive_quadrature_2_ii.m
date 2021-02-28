format long 

func_1a = @(t) (10.*exp(-t).*sin(2.*pi.*t)).^2; 
func_2a = @(t) 0^2; 

I_1a = QuadAdapt(func_1a, 0, 0.5, 1e-9); 
I_2a = QuadAdapt(func_2a, 0.5, 1, 1e-9); 
rms_a = sqrt(I_1a+I_2a);
disp(rms_a)

func_1b = @(t) (5.*exp(-1.25.*t).*sin(2.*pi.*t)).^2; 
func_2b = @(t) 0^2; 

I_1b = QuadAdapt(func_1b, 0, 0.5, 1e-9); 
I_2b = QuadAdapt(func_2b, 0.5, 1, 1e-9); 
rms_b = sqrt(I_1b+I_2b);
disp(rms_b)