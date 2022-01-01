lpf = 50;
[sound, samples] = audioread('C_01_01.wav');
N = [1 2 4 6 8 20 50 100 500 1000];

Flow = 200;
Fhigh = 7000;

figure0 = figure;
[Pxx,fttt]=pwelch(sound',[],[],[],samples);
plot(fttt,10*log10(Pxx));
title(sprintf('PSD of original sound'));
xlabel('Frequency/Hz');ylabel('PSD(db/Hz)');
saveas(figure0,sprintf('./fig/task1/PSD_original.jpg'));
close;
for n=1:length(N)
    PassBPF = tone_vocoder(N(n),Flow,Fhigh,samples,lpf,sound);
    FPassBPF = fftshift(fft(PassBPF));
    FPassBPF_Abs = abs(FPassBPF);
    f=linspace(-samples/2,samples/2,length(sound));
    figure1 = figure;
    plot(f,FPassBPF_Abs);
    grid on;title(sprintf('Spectrum at N=%d,cut off frequency=50Hz',N(n)));
    xlabel('Frequency/Hz');ylabel('Magnitude');
    audiowrite(sprintf('./audio/task1/N=%d-Cut-Frequency=50Hz_task1_wave1.wav',N(n)),PassBPF,samples);
    saveas(figure1,sprintf('./fig/task1/n=%d_spectrogram_wave1.jpg',N(n)));
    close;
    figure2 = figure;
    [Pxx1,f1]=pwelch(PassBPF,[],[],[],samples);
    plot(f1,10*log10(Pxx1));
    title(sprintf('PSD at N=%d, cut off frequency=50Hz',N(n)));
    xlabel('Frequency/Hz');ylabel('PSD(db/Hz)');
    saveas(figure2,sprintf('./fig/task1/n=%d_PSDwave1.jpg',N(n)));
    close;
    y = xcorr(sound,PassBPF);
    figure3 = figure;
    x = linspace(-1/2 * length(y),1/2 * length(y),length(y));
    plot(x,y);
    title(sprintf('Correlation at N=%d, cut off frequency=50Hz',N(n)));
    xlabel('Time/s');ylabel('Correlation degree');
    saveas(figure3,sprintf('./fig/task1/n=%d_correlation_wave1.jpg',N(n)));
    close;

end

