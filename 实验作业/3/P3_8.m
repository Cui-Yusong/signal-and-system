% 3_8_a
a1=[1 -0.8];
b1=1;
a2=[1 0.8];
b2=1;


% 3_8_b
[H1, ~] = freqz(b1, a1, 1024, 'whole');
[H2, Omega] = freqz(b2, a2, 1024, 'whole');
subplot(2,1,1);
%这是一个低通滤波器
plot(Omega, abs(H1));
xlabel('\omega');
ylabel('H1(e^{j\omega} )');
title('frequency responses of Systems 1');
subplot(2,1,2);
%这是一个高通滤波器
plot(Omega, abs(H2));
xlabel('\omega');
ylabel('H2(e^{j\omega} )');
title('frequency responses of Systems 2');

saveas(gcf, "./P3_8_b.png");
close;

% 3_8_c
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
[H1, ~] = freqz(b1, a1, 1024, 'whole');
[H2, Omega] = freqz(b2, a2, 1024, 'whole');
subplot(3,1,2);
%这是一个低通滤波器
plot(Omega, abs(H1));
xlabel('\omega');
ylabel('H1(e^{j\omega} )');
title('frequency responses of Systems 1');
subplot(3,1,3);
%这是一个高通滤波器
plot(Omega, abs(H2));
xlabel('\omega');
ylabel('H2(e^{j\omega} )');
title('frequency responses of Systems 2');


saveas(gcf, "./P3_8_c.png");
close;



% 3_8_d
x=0:1:19; 
a_x=[0 0.75 zeros(1,7) -0.5 0 -0.5 zeros(1,7) 0.75];
Wk=(pi/10).*x;
N=20;
x_20=N*ifft(a_x);
n=-20:1:99;
x_6t=[x_20 x_20 x_20 x_20 x_20 x_20];
figure (1);
stem(n,x_6t);
xlabel('n');
ylabel('x[n]');

saveas(gcf, "./P3_8_d.png");
close;


% 3_8_e
a1=[1 -0.8];
b1=1;
a2=[1 0.8];
b2=1;
y1=filter(b1,a1,x_6t);
y2=filter(b2,a2,x_6t);
figure (2);
subplot(2,1,1);
stem(n(21:120),y1(21:120));
xlabel('n');
ylabel('y_1[n]');
subplot(2,1,2);
stem(n(21:120),y2(21:120));
xlabel('n');
ylabel('y_2[n]');


saveas(gcf, "./P3_8_e.png");
close;


% 3_8_f
a_y1=(1/20)*fft(y1(1:20));
a_y2=(1/20)*fft(y2(1:20));
figure(3);
subplot(2,1,1);
stem(x,abs(a_y1));
xlabel('n');
ylabel('a_y1');
title('coefficient of yl');
subplot(2,1,2);
stem(x,abs(a_y2));
xlabel('n');
ylabel('a_y2');
title('coefficient of y2');

saveas(gcf, "./P3_8_f.png");
close;

