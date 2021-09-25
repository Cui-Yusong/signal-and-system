clear
clc

n = -5 : 1 : 5;

% demonstrate the system is not time-invariant:
x1 = [zeros(1,5) 1 zeros(1,5)];
x2 = [zeros(1,6) 1 zeros(1,4)];
x3 = [zeros(1,7) 1 zeros(1,3)];

subplot(3,1,1);
stem(n,x1);
title('A1.1.4.g.1');
xlabel('n')
ylabel('x[n]=δ[n]');

subplot(3,1,2);
stem(n,x2);
title('A1.1.4.g.2');
xlabel('n')
ylabel('T[x[n-1]]=x[2n-1]=\delta[n-1]');

subplot(3,1,3);
stem(n,x3);
title('A1.1.4.g.3');
xlabel('n')
ylabel('y[n-1]=x[2(n-1)]=\delta[n-2]');

saveas(gcf, "A1_4_g_1.png");

% demonstrate the system is not causal:
figure(2)
n = -5:1:5;
x4= [zeros(1,7) 1 zeros(1,3)];
y4=[zeros(1,6) 1 zeros(1,4)];

subplot(2,1,1);
stem(n,x4);
title('A1.1.4.g.1');
xlabel('x[n]=δ[n-2]')

subplot(2,1,2);
stem(n,y4);
title('A1.1.4.g.2');
xlabel('y[n]=x[2n]=δ[n-1]')

saveas(gcf, "A1_4_g_2.png")

% demonstrate the system is not invertible:
figure(3);
y1 = (zeros(1,11));
y2 = (zeros(1,11));

subplot(2,1,1);
stem(n, y1,'r--o');
title('A1.1.4.g.1');
xlabel('x_1[n]=\delta[n+1]');
ylabel('y_1[n]=\delta[n+1/2]');

subplot(2,1,2);
stem(n, y1,'b--*');
title('A1.1.4.g.2');
xlabel('x_2[n]=\delta[n+3]');
ylabel('y_2[n]=\delta[n+3/2]');

saveas(gcf, "A1_4_g_3.png");