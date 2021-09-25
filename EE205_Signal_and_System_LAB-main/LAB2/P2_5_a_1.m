% Problem 2.5(a) - 1

x1 = [1 0 0 0 0 0];
x2 = [0 1 0 0 0 0];
x3 = [1 2 0 0 0 0];
nx = 0:5;

xe1 = [0 0 x1];
xe2 = [0 0 x2];
xe3 = [0 0 x3];

w1 = x1;
w2 = x2;
w3 = x3;

for i = 3:8
    w1(i-2) = xe1(i) - xe1(i-1) - xe1(i-2);
    w2(i-2) = xe2(i) - xe2(i-1) - xe2(i-2);
    w3(i-2) = xe3(i) - xe3(i-1) - xe3(i-2);
end

w4 = w1 + 2*w2;

subplot(3, 1, 1), stem(nx, w1), set(get(gca, 'Title'), 'String', 'w_1[n]');
subplot(3, 1, 2), stem(nx, w2), set(get(gca, 'Title'), 'String', 'w_2[n]');

subplot(3, 1, 3)
hold on
stem(nx, w3, 'm--s')
stem(nx, w4, 'r--p')
set(get(gca, 'Title'), 'String', 'w_3[n] & w_4[n]');
legend('w_3[n]', 'w_4[n]', 'Location', 'southeast');


saveas(gcf, "plots/P2_5_a_1_out.png");

close;
