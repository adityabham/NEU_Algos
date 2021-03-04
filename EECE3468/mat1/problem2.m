
num_transmissions = 100; 

correct_packets = 0; 
iter = 0; 
while (iter<num_transmissions)
    [num_bits_correct] = packet_transmission(100);
    if num_bits_correct >= 95 
        correct_packets = correct_packets + 1; 
    end
    iter = iter + 1; 
end

disp(correct_packets) 


function [num_bits_correct] = packet_transmission(num_bits)

sent_packet = randsample([0,1], num_bits, true); 
sent_packet_prob = rand(1,num_bits);
received_packet = zeros(num_bits,1)'; 

for bit = 1:num_bits
    if sent_packet(bit) == 1
        if sent_packet_prob(bit) < 0.01
            received_packet(bit) = 0; 
        else
            received_packet(bit) = sent_packet(bit); 
        end
    else
        if sent_packet_prob(bit) < 0.03
            received_packet(bit) = 1; 
        else
            received_packet(bit) = sent_packet(bit); 
        end
        
    end
end

num_bits_correct = sum(sent_packet==received_packet); 

end 


