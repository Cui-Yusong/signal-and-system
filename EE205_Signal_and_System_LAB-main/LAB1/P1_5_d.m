n=0:1:30;
x=n>=0;
a=0.5;

yn1=0;
y1=diffeqn(a,x,yn1);
yn1=0.5;
y2=diffeqn(a,x,yn1);

stem(n,y1,'r--p');
legend('y[-1]=0');

hold on;
stem(n,y2,'b--s');
legend('y[-1]=0.5');
title('1.5(d)');

saveas(gcf, "P1_5_d_out.png")