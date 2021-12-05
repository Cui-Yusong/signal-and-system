function [s1,a]=tone_vocoder(s,fs,N,cutf)
D_200=1/0.06*log10(200/165.4+1);
D_7000=1/0.06*log10(7000/165.4+1);
 
size=linspace(D_200,D_7000,N+1);
fbands=165.4*(10.^(0.06*size)-1);
s1=zeros(1,length(s));
for i=1:N
    f1=fbands(i);
    f2=fbands(i+1);
    %产生带通滤波器
    [b,a]=butter(4,[f1 f2]/(fs/2));
    y=filter(b,a,s);
    y1=abs(y);
    %产生低通滤波器
    [c,d]=butter(4,cutf/(fs/2));
    %产生包络
    yenv=filter(c,d,y1);
    %产生fine-structure
    fmid=(f1+f2)/2;
    t=1/fs:1/fs:length(s)/fs;
    sinewave=sin(2*pi*fmid*t);
    %multiply
    s1=s1+yenv.*sinewave;
end
a=fft(s1,length(s1));
%居中
a=fftshift(a);
%Do energy normalization
s1=s1*norm(s)/norm(s1);


[s,fs]=audioread('C_01_01.wav');
%fs=16000
cutf=50;
s=s';
w=linspace(-fs/2,fs/2,length(s));
a0=fft(s,length(s));
a0=fftshift(a0);
t=1/fs:1/fs:length(s)/fs;
 
%N=1,2,4,6,8
[s1,a1]=tone_vocoder(s,fs,1,cutf);
[s2,a2]=tone_vocoder(s,fs,2,cutf);
[s4,a4]=tone_vocoder(s,fs,4,cutf);
[s6,a6]=tone_vocoder(s,fs,6,cutf);
[s8,a8]=tone_vocoder(s,fs,8,cutf);
 
audiowrite('task1_s1.wav',s1,fs); 
audiowrite('task1_s2.wav',s2,fs);
audiowrite('task1_s4.wav',s4,fs);
audiowrite('task1_s6.wav',s6,fs);
audiowrite('task1_s8.wav',s8,fs);
 
figure(1);
subplot(6,1,1);
plot(t,s);
xlabel('orginal signal in time field');
subplot(6,1,2);
plot(t,s1);
xlabel('signal(N=1) in time field');
subplot(6,1,3);
plot(t,s2);
xlabel('signal(N=2) in time field');
subplot(6,1,4);
plot(t,s4);
xlabel('signal(N=4) in time field');
subplot(6,1,5);
plot(t,s6);
xlabel('signal(N=6) in time field');
subplot(6,1,6);
plot(t,s8);
xlabel('signal(N=8) in time field');
 
figure(2);
subplot(6,1,1);
plot(w,abs(a0));
xlabel('orginal signal in frequency field');
subplot(6,1,2);
plot(w,abs(a1));
xlabel('signal(N=1) in frequency field');
subplot(6,1,3);
plot(w,abs(a2));
xlabel('signal(N=2) in frequency field');
subplot(6,1,4);
plot(w,abs(a4));
xlabel('signal(N=4) in frequency field');
subplot(6,1,5);
plot(w,abs(a6));
xlabel('signal(N=6) in frequency field');
subplot(6,1,6);
plot(w,abs(a8));
xlabel('signal(N=8) in frequency field');
