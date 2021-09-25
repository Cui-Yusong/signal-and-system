%因果性分析,x[n]超前了
n=-5:1:5;
x1=[zeros(1,7) 1 zeros(1,3)];
y1=[zeros(1,6) 1 zeros(1,4)];

subplot(2,1,1);
stem(n,x1);
title('1,4(g)-5');
xlabel('x[n]=δ[n-2]')

subplot(2,1,2);
stem(n,y1);
title('1.4(g)-6');
xlabel('y[n]=x[2n]=δ[n-1]')

saveas(gcf, "LAB1/P1_5_g2_out.png")