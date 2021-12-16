lpf = [20 50 100 400 800 1600 3200 7000]; %Define the Low-pass Frequency.
[sound, fs] = audioread('C_01_01.wav');
N = 6;%Define the bands.
Flow = 200;%Start Frequency
Fhigh = 7000;%End Frequecy
 lengths=length(sound);
noise=1-2*rand(1,lengths);
sig=repmat(sound,1,10);
[Pxx,w0]=pwelch(sig,[],[],512,fs);
b=fir2(3000,w0/(fs/2),sqrt(Pxx/max(Pxx)));
SSN=filter(b,1,noise);
SSN=SSN/norm(SSN)*norm(sound)*10^(5/20);
SNR=20*log10(norm(sound)/norm(SSN));
sumsound=sound+SSN';
for n=1:length(lpf)
    PassBPF = tone_vocoder(N,Flow,Fhigh,fs,lpf(n),sumsound);
    audiowrite(sprintf('Task4_N=4-Cut-Frequency=%d Hz-tone-vocoder.wav',lpf(n)),PassBPF,fs);
    %saveas(figure1,sprintf('../fig/task2/lpf%d.jpg',lpf(n)));
end
figure(1)
yn1=tone_vocoder(N,200,7000,fs,20,sumsound);
yn2=tone_vocoder(N,200,7000,fs,50,sumsound);
yn3=tone_vocoder(N,200,7000,fs,100,sumsound);
yn4=tone_vocoder(N,200,7000,fs,400,sumsound);
[Pxx,f]=pwelch(sumsound',[],[],[],fs);
[Pxx1,f1]=pwelch(yn1,[],[],[],fs);
subplot(2,1,1),plot(f,10*log10(Pxx));
subplot(2,1,2),plot(f1,10*log10(Pxx1));

figure(2)
[Pxx2,f2]=pwelch(yn2,[],[],[],fs);
subplot(2,1,1),plot(f,10*log10(Pxx));
subplot(2,1,2),plot(f2,10*log10(Pxx2));

figure(3)
[Pxx3,f3]=pwelch(yn3,[],[],[],fs);
subplot(2,1,1),plot(f,10*log10(Pxx));
subplot(2,1,2),plot(f3,10*log10(Pxx3));

figure(4)
[Pxx4,f4]=pwelch(yn4,[],[],[],fs);
subplot(2,1,1),plot(f,10*log10(Pxx));
subplot(2,1,2),plot(f4,10*log10(Pxx4));