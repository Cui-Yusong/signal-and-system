lpf = 50; %Set the Low-pass Frequency.
[sound, samples] = audioread('C_01_01.wav');
<<<<<<< HEAD
%  N = [1 2 4 6 8 20 40 60 80 100 200 300 400 500 1000 1200 2000]; %Define the bands.
  N = [ 4 6 8 ]; %Define the bands.
=======
% N = [1 2 4 6 8 20 40 60 80 100 200 300 400 500 1000 1200 2000]; %Define the bands.
%N = [4 8 20 40 100 200 300 500 1000]; %Define the bands.
N = [1 2 4 6 8];
>>>>>>> 49bbcca42ac2e0f0e5ecf77106131f434788f723
Flow = 200; %Start Frequency
Fhigh = 7000; %End Frequecy
[Pxx,fttt]=pwelch(sound',[],[],[],samples);

for n=1:length(N)
    PassBPF = tone_vocoder(N(n),Flow,Fhigh,samples,lpf,sound); %Pass the tone_vocoder
    FPassBPF = fftshift(fft(PassBPF)); %fft
    FPassBPF_Abs = abs(FPassBPF);
    f=linspace(-samples/2,samples/2,length(sound)); %Generate the Independent variable of the graph
    figure1 = figure;
%     plot(f,FPassBPF_Abs); %Plot the figure
    plot(f,FPassBPF_Abs); %Plot the figure
    grid on;title(sprintf('N=%d f_{lpf}=50Hz Tone Vocoder',N(n)));
    xlabel('Frequency/Hz');ylabel('Magnitude');
<<<<<<< HEAD
    audiowrite(sprintf('/Users/cuiyusong/learning/signal-and-system/proj1/project1_noGUI/audio/task1/task1-N=%d-Cut-Frequency=50Hz-tone-vocoder.wav' ...
        ,N(n)),PassBPF,samples);
    saveas(figure1,sprintf('/Users/cuiyusong/learning/signal-and-system/proj1/project1_noGUI/fig/task1/n=%d.jpg' ...
        ,N(n)));
    close;
=======
    audiowrite(sprintf('../audio/task1/task1-N=%d-Cut-Frequency=50Hz-tone-vocoder.wav',N(n)),PassBPF,samples);
    saveas(figure1,sprintf('../fig/task1/n=%d.jpg',N(n)));

    figure(n)
    [Pxx1,f1]=pwelch(PassBPF,[],[],[],samples);
    subplot(2,1,1),plot(fttt,10*log10(Pxx));
    subplot(2,1,2),plot(f1,10*log10(Pxx1));
>>>>>>> 49bbcca42ac2e0f0e5ecf77106131f434788f723
end

