## Task1

### Process

* Set the cut-off frequency of the Low-pass Filter to 50*Hz*

* Define different N for the tone-vocoder, let N equals to 1,2,4,6,8 and let the signal passes the tone-vocoder

* Save the proceed signal as audio wave and analyze the output audio by listening it

​	From the output audio files, it could be found that when N is less than 4, the output audio cannot distinguish any information. When N equals 6 and 8, what the audio files said could be understood . However, the output sound is still unnatural, which has a strong metallic sound. 

​	To get a more natural sound, we also tried the results for other values of N. And we find that as N goes up to 100, the sound sounds more natural.

### Code

```matlab
% set the initial value, read audio file
lpf = 50; 
[sound, samples] = audioread('C_01_01.wav');
N = [1 2 4 6 8 20 50 100];
Flow = 200; 
Fhigh = 7000; 
% get results of different N (number of bands)
for n=1:length(N)
		% use tone vocoder to get the answer
    PassBPF = tone_vocoder(N(n),Flow,Fhigh,samples,lpf,sound);
    FPassBPF = fftshift(fft(PassBPF)); 
    FPassBPF_Abs = abs(FPassBPF);
    f=linspace(-samples/2,samples/2,length(sound)); 
    % plot the spectrogram and PSD
    figure1 = figure;
    plot(f,FPassBPF_Abs); 
    grid on;title(sprintf('N=%d f_{lpf}=50Hz Tone Vocoder',N(n)));
    xlabel('Frequency/Hz');ylabel('Magnitude');
    audiowrite(sprintf('./audio/task1/N=%d-Cut-Frequency=50Hz_task1_wave1.wav',N(n)),PassBPF,samples);
    saveas(figure1,sprintf('./fig/task1/n=%d_spectrogram_wave1.jpg',N(n)));
    close;
    figure2 = figure;
    [Pxx1,f1]=pwelch(PassBPF,[],[],[],samples);
    plot(f1,10*log10(Pxx1));
    title(sprintf('PSD at N=%d, cut_off frequency=50Hz',N(n)));
    xlabel('Frequency/Hz');ylabel('PSD(db/Hz)');
    saveas(figure2,sprintf('./fig/task1/n=%d_PSDwave1.jpg',N(n)));
    close;
    y = xcorr(sound,PassBPF);
    figure3 = figure;
    x = linspace(-1/2 * length(y),1/2 * length(y),length(y));
    plot(x,y);
    title(sprintf('Correlation at N=%d, cut_off frequency=50Hz',N(n)));
    xlabel('Frequency/Hz');ylabel('Correlation degree');
    saveas(figure3,sprintf('./fig/task1/n=%d_correlation_wave1.jpg',N(n)));
    close;
end
```

### Output results

* The spectrum of different bands

![Spectrum of original sound](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/figures of Proj1task4/Spectrum of original sound.jpg)

![n=1_spectrogram_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=1_spectrogram_wave1.jpg)

![n=2_spectrogram_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=2_spectrogram_wave1.jpg)

![n=4_spectrogram_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=4_spectrogram_wave1.jpg)

![n=8_spectrogram_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=8_spectrogram_wave1.jpg)

![n=100_spectrogram_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=100_spectrogram_wave1.jpg)

![n=500_spectrogram_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=500_spectrogram_wave1.jpg)

* The power spectral density (PSD) of different bands

![n=1_PSDwave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=1_PSDwave1.jpg)

![n=2_PSDwave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=2_PSDwave1.jpg)

![n=4_PSDwave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=4_PSDwave1.jpg)

![n=8_PSDwave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=8_PSDwave1.jpg)

![n=100_PSDwave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=100_PSDwave1.jpg)

![n=500_PSDwave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=500_PSDwave1.jpg)



From the figure above, we can see that with the LPF bands becoming larger (bands < 100), the spectrum diagram and PSD of the synthesized signal are more similar to the original sound signal, which means that the intelligibility of synthesized sentence is better.



![n=1_correlation_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=1_correlation_wave1.jpg)

![n=2_correlation_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=2_correlation_wave1.jpg)

![n=4_correlation_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=4_correlation_wave1.jpg)

![n=8_correlation_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=8_correlation_wave1.jpg)

![n=100_correlation_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=100_correlation_wave1.jpg)

![n=500_correlation_wave1](/Users/cuiyusong/learning/signal-and-system/proj1/code/fig/task1/n=500_correlation_wave1.jpg)

However, when bands is larger than 100, the correlation degree becomes lower. And output sound has also become blurred.

So the result is that when the number of bands is about 100, the processed sound is most similar to the original input.

