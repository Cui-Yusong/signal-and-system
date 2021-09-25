%不满足时不变性、因果性、可逆性
%时不变性分析,由3，4图的对比可知.
n=-5:1:5;
x1=[zeros(1,7) 1 zeros(1,3)];
x2=[zeros(1,6) 1 zeros(1,4)];
x3=[zeros(1,8) 1 zeros(1,2)];
x4=[zeros(1,7) 1 zeros(1,3)];

subplot(2,2,1);
stem(n,x1);
title('1.4(g)-1');
xlabel('n')
ylabel('x[n]=δ[n-2]');
subplot(2,2,2);
stem(n,x2);
title('1.4(g)-2');
xlabel('n')
ylabel('x[2n]=δ[n-1]');
subplot(2,2,3);
stem(n,x3);
title('1.4(g)-3');
xlabel('n')
ylabel('y[n-2]=x[2(n-2)]=δ[n-3]');
subplot(2,2,4);
stem(n,x4);
title('1.4(g)-4');
xlabel('n')
ylabel('x[2n-2]=δ[n-2]');

saveas(gcf, "LAB1/P1_5_g1_out.png")