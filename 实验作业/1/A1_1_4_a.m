clear
clc

n = -10 : 1 : 10;

x1 = [zeros(1, 10) 1 zeros(1, 10)];
x2 = 2 .* x1;

y1 = sin((pi / 2) * x1);
y2 = sin((pi / 2) * x2);

stem(n, y1,'b--o');
hold on;

stem(n, y2,'r--*');

title('A1.1.4.a');
xlabel('n');
ylabel('y[n])');
legend('y_1=sin((\pi/2) x_1[n]','y_2=sin((\pi/2) x_2[n]')

saveas(gcf, "A1_1_4_a.png")