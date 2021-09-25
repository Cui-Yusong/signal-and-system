% Invertable analysis
n=-5:1:5;
x1=[zeros(1,4) 1 zeros(1,6)]
y1=[zeros(1,11)]
x2=[zeros(1,2) 1 zeros(1,8)]
y2=[zeros(1,11)]

subplot(2,2,1);
stem(n,x1);
title('1.4(g3)-1');
xlabel('x_1[n]=δ[n+1]');

subplot(2,2,2);
stem(n,y1);
title('1.4(g3)-2');
xlabel('y_1[n]');

subplot(2,2,3);
stem(n,x2);
title('1.4(g3)-3');
xlabel('x_2[n]=δ[n+3]');

subplot(2,2,4);
stem(n,y2);
title('1.4(g3)-4');
xlabel('y_2[n]');

saveas(gcf, "LAB1/P1_4_g3_out2.png")