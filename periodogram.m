function [ Rx ] = periodogram( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
%X = ifftshift(fft(x));
X = fft(x);

Rx = (1/N)*abs(X).^2;
Rx = Rx([N/2+1:N 1:N/2]);

%X = zeros(1,N);
% for k = -N/2:N/2-1
%     tmp = 0;
%     for n = 0:N-1
%         tmp = tmp + x(n+1)*exp(-1i*2*pi*k*n/N);
%     end
%     X(k+1+N/2) = tmp;   
% end
% Rx = (1/N)*abs(X).^2;
end


