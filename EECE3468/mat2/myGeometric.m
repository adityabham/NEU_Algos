function [Y,P_k1]=myGeometric(Nx,p,k1)
Y = zeros(1,Nx); 
for i = 1:Nx
    nt = 1;
    while(1)
        x = rand(1); 
        if x < p
            yt = nt; 
            break 
        end
        nt = nt + 1; 
    end
    Y(i) = yt; 
end
P_k1=sum(Y==k1)/Nx;
end

