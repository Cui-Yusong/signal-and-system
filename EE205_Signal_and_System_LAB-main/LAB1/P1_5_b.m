n=0:1:30;
x1=n==0;
x2=n>=0;
a=1;
yn1=0;
y1=diffeqn(a,x1,yn1);
y2=diffeqn(a,x2,yn1);

subplot(2,1,1);
stem(n,y1,'r--p');
title('1.5(b)-1')
xlabel('x1[n]=δ[n]');

subplot(2,1,2);
stem(n,y2,'m--s');
title('1.5(b)-2')
xlabel('x2[n]=u[n]');

saveas(gcf, "LAB1/P1_5_b_out.png")