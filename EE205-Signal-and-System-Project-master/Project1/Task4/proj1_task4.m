clear;  
clc;  
  
fc = input('Please input cutoff frequency:');% cutoff frequency  
N = input('Please input number of bands:');% number of band  
wavename = input('Please input filename of speech:','s');%get wavename  
[sig, fs] = audioread(wavename);% read wave file  
sig = sig.';  
  
%generate SSN  
noise = 1-2.*rand(1,length(sig));  
[Pxx,w]=pwelch(sig,[],[],512,fs);  
plot(w,Pxx);  
b_SSN = fir2(3000,w/(fs/2),sqrt(Pxx/max(Pxx)));  
[h,wh] = freqz(b_SSN,1,128);  
SSN = filter(b_SSN,1,noise);  
  
%Adjust SNR to -5dB  
norm_SSN = norm(SSN);  
new_norm_SSN = norm(sig)./(10^(-5./20));  
adjuster = new_norm_SSN ./ norm_SSN;  
SSN = SSN .* adjuster;  
SNR = 20*log10(norm(sig)/norm(SSN));  
SSN = SSN;  
  
sig = sig + SSN;%noisy signal is the sum of clean sentence and SSN  
  
%set whole frequency range  
f_start = 200; f_end = 7000;  
  
[b_lpf,a_lpf] = butter(2,fc./(fs./2));% Set LPF cutoff frequency to 50Hz  
  
%find out length of cocheal  
length_start = (1./0.06).*log10((f_start./165.4)+1);  
length_end = (1./0.06).*log10((f_end./165.4)+1);  
length_cocheal =length_end - length_start;  
  
% Implement tone-vocoder for N  
s = 0;  
for k = 1:N  
    d = length_cocheal ./ N; % Equally divide the cochlea length  
    fk_start = 165.4.*(10.^(0.06.*(length_start + (k-1).*d))-1);% start frequency of kth band  
    fk_end = 165.4.*(10^(0.06.*(length_start + k.*d))-1);% end frequency of kth band  
    [b,a]=butter(4,[fk_start fk_end]/(fs./2));% kth band pass filter  
    y_bp = filter(b,a,sig);% sig is speech signal, y_bp is the band-passed signal st kth band  
    y_lpf = filter(b_lpf,a_lpf,abs(y_bp));%y_lpf is the low band passed signal which is the envelope of y_bp  
    f_sine = (fk_start + fk_end)./2;%f_sine is the frequency of sine-wave  
    t = (1:length(sig))/fs;%为什么这个length老是报错  
    yk = y_lpf .* sin(2.*pi.*f_sine.*t);%multiply  
    s = s + yk;  
    subplot(3,1,2),plot(y_lpf),title(['Envelope Signal of ' wavename]),hold on;  
end  
s = s./norm(s').*norm(sig);%energy normalization  
  
filename = ['N=' , num2str(N) ,'_cutoff_frequency=' ,num2str(fc),'_',wavename];  
audiowrite(filename,s,fs);%save wavefile  
  
subplot(3,1,1),plot(sig),title(['Speech Signal ' wavename]);;  
%subplot(3,1,2),plot(y_lpf),title(['Envelope Signal of ' wavename]),legend([num2str(fc) 'Hz' '  N=' num2str(N)]);  
subplot(3,1,3),plot(s),title(['Vocode Sound Signal of ' wavename]),legend([num2str(fc) 'Hz' '  N=' num2str(N)]);
