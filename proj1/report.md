## Task1

### Process

* Set the cut-off frequency of the Low-pass Filter to 50*Hz*

* Define different N for the tone-vocoder, let N equals to 1,2,4,6,8 and let the signal passes the tone-vocoder

* Save the proceed signal as audio wave and analyze the output audio by listening it

​	From the output audio files, we can find that when N is less than 4, the output audio cannot distinguish any information. When N equals 6 and 8, we could distinguish what the audio files said. However, the output sound is still unnatural, which has a strong metallic sound. 

​	To get a more natural sound, we also tried the results for other values of N. And we find that as N goes up to 100, the sound sounds more natural.

### Code

```matlab
lpf = 50; 
[sound, samples] = audioread('C_01_01.wav');
N = [1 2 4 6 8 20 50 100];
Flow = 200; 
Fhigh = 7000; 

figure0 = figure;
[Pxx,fttt]=pwelch(sound',[],[],[],samples);
plot(fttt,10*log10(Pxx));
title(sprintf('PSD of original sound'));
xlabel('Frequency/Hz');ylabel('PSD(db/Hz)');
saveas(figure0,sprintf('./fig/task1/PSD_original.jpg'));

for n=1:length(N)
    PassBPF = tone_vocoder(N(n),Flow,Fhigh,samples,lpf,sound);
    FPassBPF = fftshift(fft(PassBPF)); 
    FPassBPF_Abs = abs(FPassBPF);
    f=linspace(-samples/2,samples/2,length(sound)); 
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
end
```

