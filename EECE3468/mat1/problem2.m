clear
num_transmissions = 100; % Number of packet transmissions 

correct_packets = 0; % Number of packets decoded correctly
iter = 0; 
while (iter<num_transmissions) % Simulate the transmission of 100 packets
    [num_bits_correct] = packet_transmission(100);
    if num_bits_correct >= 95 % check if packet is decoded correctly
        correct_packets = correct_packets + 1; 
    end
    iter = iter + 1; 
end

disp('Number of packets decoded correctly:') 
disp(correct_packets) 

function [num_bits_correct] = packet_transmission(num_bits)

sent_packet = randsample([0,1], num_bits, true); % packet containing 100 bits
sent_packet_prob = rand(1,num_bits); % 1xNt array of uniform random variable [0 1]
received_packet = sent_packet; % initialize received packet

for bit = 1:num_bits
    if sent_packet(bit) == 1
        if sent_packet_prob(bit) < 0.01 % P[Eb|1]=0.01
            received_packet(bit) = 0; 
        end
    else
        if sent_packet_prob(bit) < 0.03 % P[Eb|0]=0.03
            received_packet(bit) = 1; 
        end
        
    end
end

% number of bits correctly received 
num_bits_correct = sum(sent_packet==received_packet); 

end 


