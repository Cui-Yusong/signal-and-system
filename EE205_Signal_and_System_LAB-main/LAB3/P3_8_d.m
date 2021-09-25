% d部分
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

saveas(gcf, "plots/P3_8_d_out.png");
close;


% e部分
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


saveas(gcf, "plots/P3_8_e_out.png");
close;


% f部分
a_y1=(1/20)*fft(y1(1:20));
a_y2=(1/20)*fft(y2(1:20));
figure(3);
subplot(2,1,1);
stem(x,abs(a_y1));
xlabel('n');
ylabel('a_y1');
title('the DTFS coefficient of yl');
subplot(2,1,2);
stem(x,abs(a_y2));
xlabel('n');
ylabel('a_y2');
title('the DTFS coefficient of y2');

saveas(gcf, "plots/P3_8_f_out.png");
close;

