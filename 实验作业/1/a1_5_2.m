close all;
clc;
t = [0:30];

impulse = t==0;
unitstep = t>=0;

out1 = diffeqn(1,impulse,0);
out2 = diffeqn(1,unitstep,0);

subplot(2,1,1);
stem(t,out1,'r--');
title('1.5 b impulse');
xlabel('x1[n]=δ[n]');

subplot(2,1,2);
stem(t,out2,'g--');
title('1.5 b unitstep');
xlabel('x2[n]=u[n]');

saveas(gcf,'1_5_b.png');