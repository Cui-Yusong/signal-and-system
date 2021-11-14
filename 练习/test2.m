A = [1 -0.8];
B = [2 0 -1];

[H omega] = freqz(B, A, 40, 'whole');
subplot(211);plot(omega, abs(H), '*-');
xlabel('\omega');
ylabel('|H(e^{j\omega} )|'); grid;
subplot(212);plot(omega, angle(H), '*-');
xlabel ('\omega');
ylabel('phase'); grid;

