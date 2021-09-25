[s,fs]=audioread('C_01_01.wav');
%fs=16000
cutf=50;
s=s';
w=linspace(-fs/2,fs/2,length(s));
a0=fft(s,length(s));
a0=fftshift(a0);
t=1/fs:1/fs:length(s)/fs;

%N=1,2,4,6,8
[s1,a1]=chebyshev(s,fs,1,cutf);
[s2,a2]=chebyshev(s,fs,2,cutf);
[s4,a4]=chebyshev(s,fs,4,cutf);
[s6,a6]=chebyshev(s,fs,6,cutf);
[s8,a8]=chebyshev(s,fs,8,cutf);
[s16,a16]=chebyshev(s,fs,16,cutf);
[s32,a32]=chebyshev(s,fs,32,cutf);
[s64,a64]=chebyshev(s,fs,64,cutf);
[s128,a128]=chebyshev(s,fs,128,cutf);

[s70,a70]=chebyshev(s,fs,70,cutf);
[s80,a80]=chebyshev(s,fs,80,cutf);
[s90,a90]=chebyshev(s,fs,90,cutf);
[s100,a100]=chebyshev(s,fs,100,cutf);

audiowrite('ctask1_s1.wav',s1,fs); 
audiowrite('ctask1_s2.wav',s2,fs);
audiowrite('ctask1_s4.wav',s4,fs);
audiowrite('ctask1_s6.wav',s6,fs);
audiowrite('ctask1_s8.wav',s8,fs);
audiowrite('ctask1_s16.wav',s16,fs);
audiowrite('ctask1_s32.wav',s32,fs);
audiowrite('ctask1_s64.wav',s64,fs);
audiowrite('ctask1_s128.wav',s128,fs);

audiowrite('ctask1_s70.wav',s70,fs);
audiowrite('ctask1_s80.wav',s80,fs);
audiowrite('ctask1_s90.wav',s90,fs);
audiowrite('ctask1_s100.wav',s100,fs);

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
subplot(4,1,1);
plot(t,s16);
xlabel('signal(N=16) in time field');
subplot(4,1,2);
plot(t,s32);
xlabel('signal(N=32) in time field');
subplot(4,1,3);
plot(t,s64);
xlabel('signal(N=64) in time field');
subplot(4,1,4);
plot(t,s128);
xlabel('signal(N=128) in time field');

figure(3);
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

figure(4);
subplot(4,1,1);
plot(w,abs(a16));
xlabel('signal(N=16) in frequency field');
subplot(4,1,2);
plot(w,abs(a32));
xlabel('signal(N=32) in frequency field');
subplot(4,1,3);
plot(w,abs(a64));
xlabel('signal(N=64) in frequency field');
subplot(4,1,4);
plot(w,abs(a128));
xlabel('signal(N=128) in frequency field');