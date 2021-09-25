close all;
clc;

n=[0:30];
x=n>=0;
a=0.5;

yn1=0;
y1=diffeqn(a,x,yn1);
yn1=0.5;
y2=diffeqn(a,x,yn1);

subplot(2,1,1);
stem(n,y1,'r--')
title('1.5 (d) y[-1]=0');

subplot(2,1,2);
stem(n,y2,'b--');
title('1.5 (d) y[-1]=0.5');

saveas(gcf, "1_5_d.png")
