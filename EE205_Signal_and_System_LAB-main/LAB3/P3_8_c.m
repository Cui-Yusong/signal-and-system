x=0:1:19; 
a_x=[0 0.75 zeros(1,7) -0.5 0 -0.5 zeros(1,7) 0.75];
Wk=(pi/10).*x;
subplot(3,1,1);
stem(Wk,a_x);
title('DTFS coefficients of x[n]');
xlabel('w_k=(2pi/20)k');
ylabel('a_k');
%以下与b部分相同
a1=[1 -0.8];
b1=1;
a2=[1 0.8];
b2=1;
[H1 Omega] = freqz(b1, a1, 1024, 'whole');
[H2 Omega] = freqz(b2, a2, 1024, 'whole');
subplot(3,1,2);
%这是一个低通滤波器
plot(Omega, abs(H1),'r');
xlabel('\omega');
ylabel('H1(e^{j\omega} )');
title('frequency responses of Systems 1');
subplot(3,1,3);
%这是一个高通滤波器
plot(Omega, abs(H2),'g');
xlabel('\omega');
ylabel('H2(e^{j\omega} )');
title('frequency responses of Systems 2');


saveas(gcf, "plots/P3_8_c_out.png");
close;
