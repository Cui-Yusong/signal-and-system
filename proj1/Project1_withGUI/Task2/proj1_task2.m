clc
close;

% Project 1, Task 2, Task 3
% load


[sample, Freq_sample] = audioread('C_01_01.wav');
sample = sample.';

% plot the smaple
figure;
sample_fft = fftshift(fft(sample));
sample_fft_abs = abs(sample_fft);
xn = linspace(-Freq_sample/2, Freq_sample/2, length(sample))
plot(xn, sample_fft_abs)
title('sample in frequency domain');
xlabel('Frequency(Hz)');ylabel('Magnitude');
saveas(gcf, 'plots/sample.png');
close;

% define
lpf = [20 50 100 400];
Freq_low = 200;
Freq_high = 7000;

% Set the number of bands N=4
N = 4;



for i = 1:length(lpf)
    yn = tone_vocoder(N, Freq_low, Freq_high, Freq_sample, lpf(i), sample);
    yn_shift = fftshift(fft(yn));
    yn_abs = abs(yn_shift);

    %plot yn_abs
    result_plot = figure;
    hold on
    xn = linspace(-Freq_sample/2, Freq_sample/2, length(sample))
    plot(xn, yn_abs);
    title(sprintf('Tone Vocoder:N = 4, f_{lpf}=%d Hz',lpf(i)))
    xlabel('Frequency(Hz)');ylabel('Magnitude');
    saveas(result_plot, sprintf('plots/task2_lpf%d.png',lpf(i)));
    close;
    audiowrite(sprintf('task2_N=4_lpf=%d.wav',lpf(i)),abs(yn),Freq_sample);
    

    grid on

end


