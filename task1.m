%Simple low-pass filter
N = 2^10; %Number of samples
x = randn(1,N); %Gaussian noise
close all
f = linspace(0,1,N);
fc = 0.5; %cutoff frequency
a = .5;
H1 = 1./(1+1i*f/fc);
%H1 = (.5-.5*f)./(1+a*exp(-2*pi*1i*f));
H1 = (.5+.5*exp(-1i*2*pi*f));
X = fftshift(fft(x));
Y1 = X.*H1;
%y1 = ifft(Y1,'symmetric');
y1 = ifft(Y1);
[b,a] = butter(1,fc,'low')
y1 = filter(b,a,x);

ry1 = bartlett(y1);
Ry1 = periodogram(y1);
%plot(abs(Y1));
%figure(1);plot(f,abs(H1).^2);

%High degree low-pass filter
[b,a] = butter(20, fc, 'low');
y2 = filter(b,a,x);
y2 = y1;
Y2 = fft(y2);
%plot(abs(Y).^2);

ry2 = bartlett(y2);
%figure(2);plot(rx);

%Ry2 = periodogram(x);
%figure(3);plot(f,Ry2);
%axis([0,1,0,5])
%xlabel('relative frequency')
%ylabel('energy')
%title('periodogram')
%acf = xcorr(x);
%psd = ifft(acf);
%plot(abs(psd))

%%
%Ry2_avg = averaged(y2, 8);
Ry2_avg = periodogram(y2);
%average over intervals
steps = 8;
k=N/steps;
for ii=[0:steps-1]
Ry2_avg(ii*k+1:k*ii+k) = mean(Ry2_avg(ii*k+1:k*ii+k));
end
figure;plot(f,Ry2_avg);
xlabel('relative frequency')
ylabel('energy')
title('averaged periodogram')
axis([0,1,0,2])

%%
figure;
plot(f,windowing(y2,100, 'square'));
xlabel('relative frequency')
ylabel('energy')
title('square windowed periodogram')
axis([0,1,0,2])
figure;
plot(f,periodogram(y2));
xlabel('relative frequency')
ylabel('energy')
title('periodogram')
axis([0,1,0,2])
figure;
plot(f,windowing(y2,100,'hanning'));
axis([0,1,0,2])
xlabel('relative frequency')
ylabel('energy')
title('hanning windowed periodogram')