x1 = [1 0 0 0 0 0];
x2 = [0 1 0 0 0 0];
x3 = [1 2 0 0 0 0];
nx = 0:5;

w1 = cos(x1);
w2 = cos(x2);
w3 = cos(x3);

w4 = w1 + 2 * w2;

subplot(3, 1, 1), stem(nx, w1), set(get(gca, 'Title'), 'String', 'w_1[n]');
subplot(3, 1, 2), stem(nx, w2), set(get(gca, 'Title'), 'String', 'w_2[n]');

subplot(3, 1, 3)
stem(nx, w3)

hold on
stem(nx, w4, 'r')
set(get(gca, 'Title'), 'String', 'w_3[n] & w_4[n]');
legend('w_3[n]', 'w_4[n]', 'Location', 'southeast');

saveas(gcf, "P2_5_a_2.png");
