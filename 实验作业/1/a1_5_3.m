close all;
clc;

t = [0:30];
x1 = t>=0;
x2 = 2 * x1;

y1 = diffeqn(1,x1,-1);
y2 = diffeqn(1,x2,-1);

subplot(3,1,1);
stem(t,y1,'r--');
title('1.5 c y1');

subplot(3,1,2);
stem(t,y2,'g--');
title('1.5 c y2');

y3 = 2 * y1-y2;
subplot(3,1,3);
stem(t,y3,'b--');
title('1.5 c y3');

saveas(gcf,'1_5_c.png');