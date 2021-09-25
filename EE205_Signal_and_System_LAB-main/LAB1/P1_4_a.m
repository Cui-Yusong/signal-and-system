n = -5:1:5; 
x1=[zeros(1,5) 1 zeros(1,5)];
x2=2*x1;

y1=sin((pi/2)*x1);
y2=sin((pi/2)*x2);

%Plot

stem(n,y1,'g--*');
hold on;
stem(n,y2,'r--s');
legend('y_1=sin((\pi/2) x_1[n]','y_2=sin((\pi/2) x_2[n]')
title('1.4 (a)');
xlabel('n');
ylabel('y[n])');

saveas(gcf, "LAB1/P1_4_a_out.png")