% 4.2(a)

% 4.2(b)
tau=0.01;
T=10;
N=T/tau;

t=(0:tau:T-tau);
y=exp(-2 * abs(t-5));

%4.2(c)
Y = fftshift(tau*fft(y));

%4.2(d
w = -(pi/tau)+(0:N-1)*(2*pi/(N*tau));

%4.2(e)
X = exp(1i*5*w).*Y;

%4.2(f)
magnitudeX_app = abs(X);
phaseX_app = angle(X);


X2 = 1 ./ (2 + 1j * w) + 1 ./ (2 - 1j * w);
magnitudeX = abs(X2);
phaseX = angle(X2);

figure;
subplot(2, 1, 1);
semilogy(w, magnitudeX_app , w, magnitudeX);
legend('|X| by approximation', '|X| ', 'Location', 'northeast');
title('magnitude of X and approximation of X');
subplot(2, 1, 2);
hold on;
semilogy(w, phaseX_app, w, phaseX);
legend('|X| by approximation', '|X|', 'Location', 'northeast');
title('phase of X and approximation of X');
saveas(gcf, "plots/P4_2_f_out1.png")
close;

%4.2(g)
magnitudeY = abs(Y);
phaseY = angle(Y);

figure;
subplot(2, 1, 1);
semilogy(w, magnitudeY , 'g--h',w, magnitudeX_app, 'b');
legend('Y', 'X', 'Location', 'northeast');
title('magnitude of X and Y');
subplot(2, 1, 2);
hold on;
semilogy(w, phaseY, 'g');
semilogy(w, phaseX, 'b');
legend('Y', 'X', 'Location', 'northeast');
title('phase of X and Y');
saveas(gcf, "plots/P4_2_f_out2.png")



