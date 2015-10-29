close all;

N = 2^10;
x = randn(1,N);
rx = bartlett(x);
f = linspace(0,1,N);
n = 1:N;

fc = 0.5; %cutoff frequency
H1 = 1./(1+1i*f/fc);
X = fft(x)/N;
Y1 = X.*H1;
y1 = ifft(Y1,'symmetric');

[b,a] = butter(20, fc, 'low');
y2 = filter(b,a,x);
Y2 = fft(y2);

%theoretical ry
ry_sq_th = 2*rx.*rx + rx(1024)*rx(1024);
plot(ry_sq_th)
axis([0,2000,0,1])


figure;
ry_hw_th = rx./4 + rx(1024)/(2*pi) + rx.*rx/(4*pi*rx(1024));
plot(ry_hw_th)
axis([0,2000,0,1])
%%
figure;
%tau = 1:2*N-1;
tau = -N:N-2;
ry_am_sc_th = (rx/2).*cos(theta0*tau);
plot(ry_hw_th)
title('theoretical ACF (AM-SC)')
axis([0,2000,0,1])


%%


theta0 = 2*pi*.2; %hmmm

y_sq = y2.*y2;
y_hw = y2.*(y2>0);
y_amsc = y2.*cos(theta0*n);

ry_hw = bartlett(y_hw);
ry_sq = bartlett(y_sq);
ry_amsc = bartlett(y_amsc);
plot(ry_hw)
xlabel('tau')
%ylabel('energy')
title('Bartlett''s estimate of ACF (half-wave)')
axis([0,2000,0,1])

figure;
plot(ry_sq)
xlabel('tau')
%ylabel('energy')
title('Bartlett''s estimate of ACF (squarer)')
axis([0,2000,0,1])

figure;
plot(ry_amsc)
xlabel('tau')
%ylabel('energy')
title('Bartlett''s estimate of ACF (AM-SC)')
axis([0,2000,0,1])


%%
RY_hw = windowing(y_hw, 100, 'hanning');
figure;
plot(f,RY_hw)
xlabel('relative frequency')
ylabel('energy')
title('hanning windowed periodogram (half-wave)')
axis([0,1,0,1])
figure;
plot(f,windowing(y_sq, 100, 'hanning'))
xlabel('relative frequency')
ylabel('energy')
title('hannning windowed periodogram (squarer)')
axis([0,1,0,2])

figure;
plot(f,windowing(y_amsc, 100, 'hanning'))
xlabel('relative frequency')
ylabel('energy')
title('hannning windowed periodogram (AM-SC)')
axis([0,1,0,2])



figure;
RY_hw = windowing(y_hw, 100, 'square');
plot(f,RY_hw)
xlabel('relative frequency')
ylabel('energy')
title('hanning windowed periodogram (half-wave)')
axis([0,1,0,1])
figure;
plot(f,windowing(y_sq, 100, 'square'))
xlabel('relative frequency')
ylabel('energy')
title('square windowed periodogram (squarer)')
axis([0,1,0,2])

figure;
plot(f,windowing(y_amsc, 100, 'square'))
xlabel('relative frequency')
ylabel('energy')
title('square windowed periodogram (AM-SC)')
axis([0,1,0,2])

%% histograms
figure;
hist(y_amsc, 16); %laplace distr?
title('amplitude histogram (AM-SC)')
figure;
hist(y_sq, 16); 
title('amplitude histogram (squarer)')
figure;
hist(y_hw, 16);
title('amplitude histogram (half-wave)')
