% Linearity not satified
n=-5:1:5;
x1=n>=0;
x2=3*x1;

y1=x1.^3;
y2=x2.^3;

stem(n,y1);
hold on
stem(n,y2,'r');
title('1.4(e)');
legend({'x[n]=u[n]','x[n]=3u[n]'}, 'Location', 'northeast');
xlabel('x[n]');
ylabel('y[n]=x^3[n]');

saveas(gcf, "LAB1/P1_4_e_out1.png")