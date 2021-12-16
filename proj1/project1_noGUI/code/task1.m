lpf = 50; %Set the Low-pass Frequency.
[sound, samples] = audioread('C_01_01.wav');
%  N = [1 2 4 6 8 20 40 60 80 100 200 300 400 500 1000 1200 2000]; %Define the bands.
  N = [ 4 6 8 ]; %Define the bands.
Flow = 200; %Start Frequency
Fhigh = 7000; %End Frequecy
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
    audiowrite(sprintf('/Users/cuiyusong/learning/signal-and-system/proj1/project1_noGUI/audio/task1/task1-N=%d-Cut-Frequency=50Hz-tone-vocoder.wav' ...
        ,N(n)),PassBPF,samples);
    saveas(figure1,sprintf('/Users/cuiyusong/learning/signal-and-system/proj1/project1_noGUI/fig/task1/n=%d.jpg' ...
        ,N(n)));
    close;
end

