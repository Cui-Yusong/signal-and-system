% Problem 2.4(g)

x1 = [1 1 1 1 0 0 0 0 0 0];
nx1 = 0:1:9;

h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
nh1 = 0:1:4;
nh2 = nh1;

xg = [2 0 0 0 0];
nxg = 0:1:4;
yga = xg.^2;
nyga = nxg;

hg2 = h2;
nhg2 = nh2;

ygb = conv(xg, hg2);
nygb = (nxg(1)+nhg2(1)):1:(nxg(end)+nhg2(end));

yg1 = [yga 0 0 0 0] + ygb;
nyg1 = nygb;

hg1 = [1 0 0 0 0].^2;
nhg1 = nxg;

hparallel = hg1 + hg2;

yg2 = conv(xg, hparallel);
nyg2 = nyg1;

figure;
hold on;
stem(nyg1, yg1, 'm--s');
stem(nyg2, yg2, 'r--p');
title('y_{g1}[n] & y_{g2}[n]');
legend('y_{g1}[n]', 'y_{g2}[n]', 'Location', 'northeast');

saveas(gcf, "plots/P2_4_g_out.png");
close;


