[sample, Freq_sample] = audioread('C_01_01.wav');

lpf = 20;
Freq_low = 200;
Freq_high = 7000;

% Set the number of bands N=4
N = 4;
yn = tone_vocoder(N, Freq_low, Freq_high, Freq_sample, lpf, sample.');

yn_fft = fftshift(fft(yn));
yn_abs = abs(yn_fft);

yn_sample = fftshift(fft(sample));
yn_sample = abs(yn_sample);

figure();
hold on
f = linspace(-Freq_sample/2, Freq_sample, length(sample))
subplot(2, 1, 1);
plot(f, yn_sample);
subplot(2, 1, 2);
plot(f, yn_abs);

