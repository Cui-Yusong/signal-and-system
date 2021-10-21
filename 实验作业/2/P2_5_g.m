nz = 0:19;
figure;
subplot(3, 1, 1);
hold on;
stem(nz, s1, 'm');
stem(nz, z1);
legend('s_1[n]', 'z_1[n]', 'Location', 'northeast');
title('s_1[n] & z_1[n]');
xlabel('n');
ylabel('s_1[n] / z_1[n]');

subplot(3, 1, 2);
stem(ns, s2);
title('s_2[n]');

subplot(3, 1, 3);
stem(nz, z2);
title('z_2[n]');

saveas(gcf, "P2_5_g.png");