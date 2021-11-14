% 3_5_b
a=[1 2*exp(-1i*pi/3) exp(1i*pi/4) exp(-1i*pi/4) 2*exp(1i*pi/3)];
plot(a);
saveas(gcf, "./P3_5_b.png");
close;

% 3_5_c
n=0:1:4;
x=5*ifft(a);
subplot(2,1,1);
stem(n,real(x));
xlabel('n');
title('real part');
subplot(2,1,2);
stem(n,imag(x));
xlabel('n');
title('imaginary part');

saveas(gcf, "./P3_5_c.png");
close;

% 3_5_d
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
subplot(3,1,3);
stem(n,x_1)
xlabel('n');
title('X_1[n]');
subplot(3,1,2);
stem(n,x_2)
xlabel('n');
title('X_2[n]');
subplot(3,1,1);
stem(n,x_3)
xlabel('n');
title('X_3[n]');

saveas(gcf, "./P3_5_d.png");
close;

% 3_5_e
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

saveas(gcf, "./P3_5_e.png");
close;

% 3_5_f
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
stem(m,x3_2);
xlabel('n');
title('X3 2[n]');

subplot(2,2,2);
stem(m,x3_8);
xlabel('n');
title('X3 8[n]');

subplot(2,2,3);
stem(m,x3_12);
xlabel('n');
title('X3 12[n]');

subplot(2,2,4);
stem(m,x3_all);
xlabel('n');
title('X3 all[n]');

saveas(gcf, "./P3_5_f.png");
close;

% 3_5_g
subplot(2,1,2);
stem(m,real(x3_all));
xlabel('n');
title('real x_3');

subplot(2,1,1);
stem(m,imag(x3_all));
xlabel('n');
title('imag x_3');

saveas(gcf, "./P3_5_g.png");
close;

% 3_5_h
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
stem(m,x3_5);
xlabel('n');
title('5');

subplot(3,2,2);
stem(m,x3_15);
xlabel('n');
title('15');

subplot(3,2,3);
stem(m,x3_25);
xlabel('n');
title('25');

subplot(3,2,4);
stem(m,x3_29);
xlabel('n');
title('29');

subplot(3,2,5);
stem(m,x3_32);
xlabel('n');
title('32');

saveas(gcf, "./P3_5_h.png");
close;

