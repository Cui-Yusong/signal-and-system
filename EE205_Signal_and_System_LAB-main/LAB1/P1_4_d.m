n= -5:1:5;
x1=[zeros(1,5) 1 zeros(1,5)];
x2=5*[zeros(1,5) 1 zeros(1,5)];
y1=sin((pi/2)*x1);
y2=sin((pi/2)*x2);

subplot(3,1,1);
stem(n,x1);
title('1.4 (d)-1');
xlabel('n');
ylabel('x_1[n]');

subplot(3,1,2);
stem(n,x2);
title('1.4 (d)-2');
xlabel('n');
ylabel('x_2[n]');

subplot(3,1,3);
stem(n,y1,'b--s');
hold on;
stem(n,y2,'r--h');
legend('(sin(\pi/2) x_1[n])','(sin(\pi/2) x_2[n])');
title('1.4 (d)-3');
xlabel('n');
ylabel('y[n]');

saveas(gcf, "LAB1/P1_4_d_out.png")