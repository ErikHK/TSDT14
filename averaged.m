function [ Rx_avg ] = averaged(x,k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
L = length(x);
for i = 1:k
    tmp = periodogram(x((((i-1)*L/k)+1):i*L/k));
    tmp = mean(tmp);
    Rx_avg((i-1)*L/k+1:i*L/k) = tmp;
end

    %Rx_avg = reshape(Rx_avg', 1, k*(2*L/k-1));
    %Rx_avg = reshape(Rx_avg', 1, L);
    %Rx_avg = abs(fft(Rx_avg));
    %Rx_avg = repmat(Rx_avg, L/k, 1);
    %Rx_avg = reshape(Rx_avg, 1, L);
    %Rx_avg = abs(fft((Rx_avg')));
    

end

