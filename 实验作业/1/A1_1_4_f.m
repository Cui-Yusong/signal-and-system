clc
clear

n = -10 : 1 : 10;

% demonstrate the system is not stable:
x1 = (ones(1, 21));
y1 = x1 .* n;


subplot(3, 1, 1);
stem(n, y1, 'b--o');
title('A1.1.4.f.1');
xlabel('x[n] = u[n]');
ylabel('y[n] = nx[n]');

% demonstrate the system is not invertible:
subplot(3, 1, 2);
x2 = [zeros(1, 10) 1 zeros(1, 10)];
x3 = [zeros(1, 10) 10 zeros(1, 10)];
y2 = x2 .* n;
y3 = x3 .* n;
stem(n, y2, 'g--o');
hold on
stem(n, y3, 'r--*');
title('A1.1.4.f.2');
xlabel('x[n] = k\delta[n]');
ylabel('y[n] = nx[n]');

% demonstrate the system is not time-invariant:
subplot(3, 1, 3);
y4=(n + 1) .* x2;
stem(n,y4,'r--h');
title('A1.1.4.f.3');
xlabel('x_4[n]');
ylabel('y_4[n]');

saveas(gcf, "A1_1_4_f.png");
