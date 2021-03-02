format long

% a
func_1a = @(t) (10.*exp(-t).*sin(2.*pi.*t)).^2; 
func_2a = @(t) (0.*t).^2; 
[I_1a] = GaussQuad(func_1a, 0, 0.5, 8); 
[I_2a] = GaussQuad(func_2a, 0.5, 1, 8); 
rms_a = sqrt(I_1a+I_2a);
disp(rms_a)

% b
func_1b = @(t) (5.*exp(-1.25.*t).*sin(2.*pi.*t)).^2; 
func_2b = @(t) (0.*t).^2;  
[I_1b] = GaussQuad(func_1b, 0, 0.5, 5); 
[I_2b] = GaussQuad(func_2b, 0.5, 1, 5); 
rms_b = sqrt(I_1b+I_2b);
disp(rms_b)
