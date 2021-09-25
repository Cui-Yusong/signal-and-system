function [s_out,a_out] = chebyshev(s,fs,N,fcutoff)

d200 = log10(200/165.4+1)/0.06;
d7000 = log10(7000/165.4+1)/0.06;

% dmid=(d200+d7000)/1;
% fpassbands = 165.4*(10.^(0.06*dmid)-1); % 计算出对应的passbands sets

dsets = linspace(d200,d7000,N+1); % 计算出耳蜗距离vector sets
fpassbands = 165.4*(10.^(0.06*dsets)-1); % 计算出对应的passbands sets
s_out = zeros(1,length(s));
for i=1:N
    flow=fpassbands(i);
    fhigh=fpassbands(i+1);
    fmid=(flow+fhigh)/2
    n = 4; Rp = 0.5;
    Wn = [flow fhigh]/(fs/2);
    [b,a] = cheby1(n,Rp,Wn);
    y=filter(b,a,s);
    yabs=abs(y); 
    [h,f]=freqz(b,a,128,fs);
    [b_lowpass,a_lowpass]=butter(4,fcutoff/(fs/2));
    yenv=filter(b_lowpass,a_lowpass,yabs); 
    dt=1/fs:1/fs:length(s)/fs;
    sin_env = sin(2*pi*fmid*dt); 
    s_out=s_out+yenv.*sin_env;
end
a_out=fft(s_out,length(s_out));
a_out=fftshift(a_out);
s_out=s_out*(norm(s)/norm(s_out)); 
fprintf('>> checkpint final end');
