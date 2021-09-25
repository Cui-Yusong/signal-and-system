clear
clc

n = -5 : 1 : 5;

x1 = [zeros(1,5) 1 zeros(1,5)];
x2 = 5 .* [zeros(1,5) 1 zeros(1,5)];

y1 = sin((pi/2) * x1);
y2 = sin((pi/2) * x2);

subplot(3, 1, 1);
stem(n, x1);
title('A1.1.4.d.1');
xlabel('n');
ylabel('x_1[n]');

subplot(3, 1, 2);
stem(n, x2);
title('A1.1.4.d.2');
xlabel('n');
ylabel('x_2[n]');

subplot(3, 1, 3);
stem(n, y1, 'b--o');
hold on;
stem(n, y2, 'r--*');
legend('(sin(\pi/2) x_1[n])','(sin(\pi/2) x_2[n])');
title('A1.1.4.d.3');
xlabel('n');
ylabel('y[n]');

saveas(gcf, "A1_1_4_d.png")