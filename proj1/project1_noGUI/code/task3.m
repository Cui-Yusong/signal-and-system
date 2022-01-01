clear;
[x,fs]=audioread('C_01_01.wav');
w=linspace(-fs/2,fs/2,length(x));
spectrum0=fftshift(fft(x))/length(x);
figure;
plot(w,abs(spectrum0));
title('Original signal'); 
xlabel('w');
ylabel('magnitude');
N=length(x);
noise=1-2*rand(1,N);
sig=repmat(x,1,10);
[Pxx,w0]=pwelch(sig,[],[],512,fs);
b=fir2(3000,w0/(fs/2),sqrt(Pxx/max(Pxx)));
SSN=filter(b,1,noise);
SSN=SSN/norm(SSN)*norm(x)*10^(5/20);
SNR=20*log10(norm(x)/norm(SSN));
sum=x+SSN';
sum=sum/norm(sum)*norm(x);
spectrum1=fftshift(fft(sum))/length(x);
figure0 = figure;
plot(w,abs(spectrum1));
title('Original signal + noise'); 
xlabel('w');
ylabel('magnitude');
audiowrite('../audio/task3/addingNoise_01_original.wav',sum,fs);
saveas(figure0,'../fig/task3/original.jpg');
N=[2 4 6 8 16 32 64 128];
LPFfreq=50;
for n=1:8
    result=tone_vocoder(N(n),200,7000,fs,LPFfreq,sum);
    spectrum2=fftshift(fft(result))/length(x);
    figure1 = figure;
    plot(w,abs(spectrum2));
    title(sprintf('LPFfreq=50Hz  N=%d  tone vocoder',N(n))); 
    xlabel('w');
    ylabel('magnitude');
    %image = figure;
    audiowrite(sprintf('../audio/task3/Task3_addingNoise_01_50Hz_N=%d_tone_vocoder.wav',N(n)),result,fs);
    saveas(figure1,sprintf('../fig/task3/n=%d.jpg',N(n)));
end