%不满足时不变性、因果性、可逆性
%时不变性分析,由3，4图的对比可知.
% Time invariant
n=-5:1:5;
x1=n>=-2;
y1=n>=-1;
x2=n>=-4;
y2=n>=-2;
y3=n>=-3;


subplot(3,2,1);
stem(n,x1);
title('1.4(g1)-1');
xlabel('n')
ylabel('x_1[n]=u[n+2]');

subplot(3,2,2);
stem(n,y1);
title('1.4(g1)-2');
xlabel('n')
ylabel('y_1[n]=u[n+1]');

subplot(3,2,3);
stem(n,x2);
title('1.4(g1)-3');
xlabel('n')
ylabel('x_2[n]=x_1[n+2]=u[n+4]');

subplot(3,2,4);
stem(n,y2);
title('1.4(g1)-4');
xlabel('n')
ylabel('y_2[n]=x_2[2n]=u[n+2]');

subplot(3,2,5);
stem(n,y3);
title('1.4(g1)-5');
xlabel('n')
ylabel('y_1[n+2]');

saveas(gcf, "LAB1/P1_4_g1_out2.png")