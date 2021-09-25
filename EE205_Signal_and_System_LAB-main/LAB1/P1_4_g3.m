%可逆性分析
n=-10:1:10;
x1=[zeros(1,10) ones(1,11)];
x2=[zeros(1,11) 1 0 1 0 1 0 1 0 1 0];
x3=[zeros(1,10) 1 0 1 0 1 0 1 0 1 0 1];

subplot(3,1,1);
stem(n,x1);
title('1.4(g)-7');
xlabel('x[n]=u[n]');
subplot(3,1,2);
stem(n,x2);
title('1.4(g)-8');
xlabel('x[n]=u[2n-1]');
subplot(3,1,3);
stem(n,x3);
title('1.4(g)-9');
xlabel('y[n]=x[2n]=u[2n]');

saveas(gcf, "LAB1/P1_4_g3_out.png")