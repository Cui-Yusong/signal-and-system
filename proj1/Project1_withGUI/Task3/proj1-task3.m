clear;
[x,fs]=audioread('C_01_01.wav');
N=length(x);
noise=1-2*rand(1,N);
sig=repmat(x',1,10);
[Pxx,w]=periodogram(sig,[],512,fs);
b=fir2(3000,w/(fs/2),sqrt(Pxx/max(Pxx)));
ssn=filter(b,1,noise);
ssn1=ssn*norm(x')/(10^(-5/20)*norm(ssn));
y=x'+ssn1;
y1=y*norm(x')/norm(y);
N=[2 4 6 8 16];
cutfreq=50;
for i=1:5;
sign=equal_distance(N(i),y1,fs,cutfreq);
fft_sign=fftshift(fft(sign));
t=linspace(0,length(sign)/fs,length(sign));
w=linspace(-fs/2,fs/2,length(y1));
figure(i);
subplot(2,1,1)
plot(t,sign)
xlabel('t')
ylabel('magnitude')
title(['C-01-01, N=',num2str(N(i)), ', cut-off frequency=50Hz']);
subplot(2,1,2)
plot(w,abs(fft_sign));
xlabel('w')
ylabel('magnitude')
audiowrite(['proj_1_task3_1_ N=',num2str(N(i)),'.wav'],sign,fs)
end
