% 2.5(d) -------------------------------

a = [1 -3/5];
b = 1;
x = [1 zeros(1,19)];


h1 = filter(b, a, x);
h2 = zeros(1,21);



nh = 0:19;

for i = 2:21
    h2(i) = ((3/5)^(i-2)) * h2(i-1) + x(i-1)
end

h2 = h2(2:end);

figure;
subplot(2, 1, 1);
stem(nh, h1);
title('y_1[n]=(3/5)y_1[n-1]+x[n]');
xlabel('n');
ylabel('h_1[n]');

subplot(2, 1, 2);
stem(nh, h2);
title('y_2[n]=(3/5)^ny_1[n-1]+x[n]');
xlabel('n');
ylabel('h_2[n]');

saveas(gcf, "plots/P2_5_d_out.png");

close;

% 2.5(e) -------------------------------
u = ones(1, 20);
s1 = filter(b, a, u);
s2 = zeros(1,21);

ns = 0:19;

for i = 2:21
    s2(i) = ((3/5)^(i-2)) * s2(i-1) + u(i-1)
end

s2 = s2(2:end);

figure;
subplot(2, 1, 1);
stem(ns, s1);
title('y_1[n]=(3/5)y_1[n-1]+x[n]');
xlabel('n');
ylabel('s_1[n]');

subplot(2, 1, 2);
stem(ns, s2);
title('y_2[n]=(3/5)^ny_1[n-1]+x[n]');
xlabel('n');
ylabel('s_2[n]');

saveas(gcf, "plots/P2_5_e_out.png");
close;

% 2.5(f) -------------------------------
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

saveas(gcf, "plots/P2_5_f_out.png");
close;
% 2.5(g) -------------------------------

figure;
subplot(3, 1, 1);
hold on;
stem(nz, s1, 'm--s');
stem(nz, z1, 'r--p');
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

saveas(gcf, "plots/P2_5_g_out.png");
close;




