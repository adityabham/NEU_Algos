function [Y,P_k1]=myGeometric(Nx,p,k1)
Y = zeros(1,Nx); %pre-allocating Y vector 
for i = 1:Nx %conducting Nx experiments
    nt = 1;
    while(1)
        x = rand(1); 
        if x < p % if the condition is met
            yt = nt; % while loop terminated once a reject is found
            break 
        end
        nt = nt + 1; %incrementing number of trials until a reject is found
    end
    Y(i) = yt; 
end
P_k1=sum(Y==k1)/Nx; % probability at the given value k1 = 10
P_k1_theory=p*(1-p)^(k1-1); % theoretical value

% simulation results 
str=['Probability [Y=',num2str(k1),']',' ','Simulation:',num2str(P_k1),' ','Theory:',num2str(P_k1_theory)];
disp(str) 

% plotting
h=histogram(Y,max(Y),'Normalization','Probability');  
% estimated PMF using the histogram function 
PMF_est=h.Values; 
% evaluating bin centers as values for Y
Y_values=h.BinEdges(1:end-1)+h.BinWidth/2;  
% plot the discrete estimated PMF 
stem(round(Y_values),PMF_est,'fill','Linewidth',2); 
xlabel('y','interpreter','Latex')
ylabel('Estimated $P_Y[y]$','interpreter','Latex')
end

