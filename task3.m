N = 2^10; %Number of samples
x = randn(1,N); %Gaussian noise
fc = .5;
f = linspace(0,1,N);
[b,a] = butter(20, fc, 'low');
y2 = filter(b,a,x);
Y2 = fft(y2);

y_alt = repmat([1 -1], 1, N/2);
y_alt = y2.*y_alt;

y_dec = repmat([0 1], 1, N/2);
y_dec = y2.*y_dec;
%%
figure
plot(f, periodogram(y_dec), 'b', f, windowing(y_dec, 100, 'hanning'), 'r');
legend('PSD', 'smoothed PSD')
title('PSD of decimated signal')
xlabel('relative frequency')
ylabel('energy')
axis([0,1,0,1])

figure
plot(f,periodogram(y_alt), 'b', f,windowing(y_alt, 100, 'hanning'), 'r');
legend('PSD', 'smoothed PSD')
title('PSD of alternating signal')
xlabel('relative frequency')
ylabel('energy')
axis([0,1,0,1])

%%
figure;
ry_alt = bartlett(y_alt);
plot(ry_alt)
title('Bartlett''s estimate (ACF, alternating)')
xlabel('tau')
axis([0,2000,-.5,.5])
figure;
ry_dec = bartlett(y_dec);
plot(ry_dec)
title('Bartlett''s estimate (ACF, decimated)')
xlabel('tau')
axis([0,2000,-.5,.5])