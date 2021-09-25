clear
clc

n = 1 : 1 : 10;
x1 = 1 : 1 : 10;
x2 = 3 .* x1;
y1 = x1 .^ 3;
y2 = x2 .^ 3;


stem (n, y1, 'b--o');
hold on
stem (n, y2, 'r--*');

title('A1.1.4.e');
xlabel('x[n]');
ylabel('y[n] = x^3[n]');
legend({'x[n]=u[n]','x[n]=3u[n]'});

saveas(gcf, 'A1_1_4_e.png');