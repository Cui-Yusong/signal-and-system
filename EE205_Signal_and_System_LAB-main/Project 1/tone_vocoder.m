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