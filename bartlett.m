function [ rx ] = bartlett( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
rx = zeros(1,N);

for k = [1:N]
    for n = [1:N-k-1],
        rx(k) = rx(k) + x(n+k-1).*x(n);
    end
end
rx = (1/N)*rx;
rx_flip = fliplr(rx);
rx = [rx_flip(1:end-1) rx];
end


