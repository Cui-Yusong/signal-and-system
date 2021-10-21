z1 = conv(h1, u);
z1 = z1(1:20);
z2 = conv(h2, u);
z2 = z2(1:20);

nz = 0:19;
figure;
subplot(2, 1, 1);
stem(nz,z1);
title('z1[n]');
xlabel('n');
ylabel('z1[n]');

subplot(2, 1, 2);
stem(nz, z2);
title('z2[n]');
xlabel('n');
ylabel('z2[n]');

saveas(gcf, "P2_5_f_out.png");