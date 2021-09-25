x=0:0.03:2;
y=log(x);

stem(x,y,'m--h');
title('1.4(c)');
xlabel('x');
ylabel('y[n]=log(x[n])');

saveas(gcf, "LAB1/P1_4_c_out.png")