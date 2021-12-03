%5.1
[y1,fs]=audioread('C_01_01.wav');
y1=y1';
%sound(y,fs);
sig=repmat(y1,1,10);
N = length(y1);
noise=1-2*rand(1,N);
[Pxx,w]=pwelch(sig,[],[],512,fs);
figure(1);
plot(w,Pxx);
title('The power spectral density of the speech signal');
xlabel('w');
ylabel('Pxx');
% saveas(gcf, "plots/P5_1_out1.png");
% close;

b=fir2(3000,w/(fs/2),sqrt(Pxx/max(Pxx)));
[h,wh]=freqz(b,1,128);
ssn=filter(b,1,noise);
[Pxx1,w1]=pwelch(ssn,[],[],512,fs);
figure(2);
plot(w1,Pxx1);
title('The power spectral density of the speech-shaped noise');
xlabel('w1');
ylabel('Pxx1');
% saveas(gcf, "plots/P5_1_out2.png");
% close;


%5.2
ssn=norm(y1)*ssn/10^(-5/20)/norm(ssn);
snr=20*log10(norm(y1)/norm(ssn));
disp(snr);
y=y1+ssn;
y=y*norm(y1)/norm(y);

%5.3
y=abs(y);
figure(3);
[b,a]=butter(2,100/(fs/2));
envelop3=filter(b,a,y);
subplot(3,1,1);
plot(envelop3);
title('f_{cut}=100 Hz');
xlim([0,6000]);



[b,a]=butter(2,200/(fs/2));
envelop2=filter(b,a,y);
subplot(3,1,2);
plot(envelop2);
title('f_{cut}=200 Hz');
xlim([0,6000]);


[b,a]=butter(2,300/(fs/2));
envelop3=filter(b,a,y);
subplot(3,1,3);
plot(envelop3);
title('f_{cut}=300 Hz');
xlim([0,6000]);
% saveas(gcf, "plots/P5_3_out1.png");
% close;

figure(4);
[b,a]=butter(2,200/(fs/2));
envelop=filter(b,a,y);
subplot(2,1,1);
plot(envelop);
title('2nd order');
xlim([0,6000]);

[b,a]=butter(6,200/(fs/2));
envelop=filter(b,a,y);
subplot(2,1,2);
plot(envelop);
title('6th order');
xlim([0,6000]);
% saveas(gcf, "plots/P5_3_out2.png");
% close;