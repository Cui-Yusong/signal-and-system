a1=[1 -0.8];
b1=1;
a2=[1 0.8];
b2=1;
[H1 Omega] = freqz(b1, a1, 1024, 'whole');
[H2 Omega] = freqz(b2, a2, 1024, 'whole');
subplot(2,1,1);
%这是一个低通滤波器
plot(Omega, abs(H1),'r');
xlabel('\omega');
ylabel('H1(e^{j\omega} )');
title('frequency responses of Systems 1');
subplot(2,1,2);
%这是一个高通滤波器
plot(Omega, abs(H2),'g');
xlabel('\omega');
ylabel('H2(e^{j\omega} )');
title('frequency responses of Systems 2');

saveas(gcf, "plots/P3_8_b_out.png");
%close;
