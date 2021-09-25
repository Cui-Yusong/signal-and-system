n= 0:1:10;
x1=n;
y1=sin((pi/2)*x1);

subplot(2,1,1);
stem(n,x1);
title('1.4 (d)-1');
xlabel('n');
ylabel('x[n]');

subplot(2,1,2);
stem(n,y,'m--s');
title('1.4 (d)-2');
xlabel('n');
ylabel('sin(\pi/2) x1[n]');

saveas(gcf, "LAB1/P1_4_d_out2.png")