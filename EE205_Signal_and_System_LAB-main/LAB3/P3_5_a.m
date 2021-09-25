% 3.5(a)通过变换可以得到x[n]=1+2cos(4pi/5 n+pi/4)+4cos(8pi/5 n+pi/3),所以是实的。
% 3.5(b)因为N=5,所以
% a0=1,a1=a-4=2*exp(-j*pi/3),a2=exp(j*pi/4),a3=a-2=exp(-j*pi/4),a4=2*exp(j*pi/3);

% 3.5(b)
a=[1 2*exp(-j*pi/3) exp(j*pi/4) exp(-j*pi/4) 2*exp(j*pi/3)];

% 3.5(c)
n=0:1:4;
x=5*ifft(a);
subplot(2,1,1);
stem(n,real(x));
xlabel('n');
title('real x[n]');
subplot(2,1,2);
stem(n,imag(x));
xlabel('n');
title('image x[n]');

saveas(gcf, "plots/P3_5_c_out.png");
close;

% 3.5(d)
n=0:1:63;
n1=0:1:7;
n2=0:1:15;
n3=0:1:31;
x1=ones(1,8);
x2=[ones(1,8) zeros(1,8)];
x3=[ones(1,8) zeros(1,24)];
x_1=[x1 x1 x1 x1 x1 x1 x1 x1];
x_2=[x2 x2 x2 x2];
x_3=[x3 x3];
subplot(3,1,1);
stem(n,x_1)
xlabel('n');
title('x_1[n]');
subplot(3,1,2);
stem(n,x_2)
xlabel('n');
title('x_2[n]');
subplot(3,1,3);
stem(n,x_3)
xlabel('n');
title('x_3[n]');

saveas(gcf, "plots/P3_5_d_out.png");
close;

% 3.5(e)
a1=1/8*fft(x1);
a2=1/16*fft(x2);
a3=1/32*fft(x3);
subplot(3,1,1);
stem(n1,abs(a1));
xlabel('k');
title('a_k1');
subplot(3,1,2);
stem(n2,abs(a2));
xlabel('k');
title('a_k2');
subplot(3,1,3);
stem(n3,abs(a3));
xlabel('k');
title('a_k3');

saveas(gcf, "plots/P3_5_e_out.png");
close;

% 3.5(f)
m=0:1:31;
a3_2=[a3(1:3) zeros(1,27) a3(31:32)];
a3_8=[a3(1:9) zeros(1,15) a3(25:32)];
a3_12=[a3(1:13) zeros(1,7) a3(21:32)];
a3_all=a3;

x3_2=32*ifft(a3_2);
x3_8=32*ifft(a3_8);
x3_12=32*ifft(a3_12);
x3_all=32*ifft(a3_all);

subplot(2,2,1);
stem(m,x3_2,'y');
xlabel('n');
title('x3 2[n]');

subplot(2,2,2);
stem(m,x3_8,'m');
xlabel('n');
title('x3 8[n]');

subplot(2,2,3);
stem(m,x3_12,'r');
xlabel('n');
title('x3 12[n]');

subplot(2,2,4);
stem(m,x3_all,'b');
xlabel('n');
title('x3 all[n]');

saveas(gcf, "plots/P3_5_f_out.png");
close;

% 3.5(g)
subplot(2,1,1);
stem(m,real(x3_all),'r');
xlabel('n');
title('real(x3 all[n])');

subplot(2,1,2);
stem(m,imag(x3_all),'g');
xlabel('n');
title('imag(x3 all[n])');

saveas(gcf, "plots/P3_5_g_out.png");
close;

% 3,5(h)
a3_5=[a3(1:3) zeros(1,27) a3(31:32)];
a3_15=[a3(1:8) zeros(1,17) a3(26:32)];
a3_25=[a3(1:13) zeros(1,7) a3(21:32)];
a3_29=[a3(1:15) zeros(1,3) a3(19:32)];
a3_32=a3;

x3_5=32*ifft(a3_5);
x3_15=32*ifft(a3_15);
x3_25=32*ifft(a3_25);
x3_29=32*ifft(a3_29);
x3_32=32*ifft(a3_32);

subplot(3,2,1);
stem(m,x3_5,'y');
xlabel('n');
title('use 5 series');

subplot(3,2,2);
stem(m,x3_15,'m');
xlabel('n');
title('use 15 series');

subplot(3,2,3);
stem(m,x3_25,'r');
xlabel('n');
title('use 25 series');

subplot(3,2,4);
stem(m,x3_29,'b');
xlabel('n');
title('use 29 series');

subplot(3,2,5);
stem(m,x3_32,'b');
xlabel('n');
title('use 32 series');

saveas(gcf, "plots/P3_5_h_out.png");
close;

