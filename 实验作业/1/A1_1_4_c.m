clear
clc

xn = 0 : 0.01 : 1;
y = log(xn);

stem (xn, y, 'b--o');

title('A1.1.4.c');
xlabel('n');
ylabel('y[n]');
legend('y[n] = log(x[n])');

saveas(gcf, "A1_1_4_c.png")