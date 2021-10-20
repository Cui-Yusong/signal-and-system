% Problem 2.4(a)

x1 = [1 1 1 1 0 0 0 0 0 0];
nx1 = 0:1:9;

h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
nh1 = 0:1:4;

y11 = conv(x1,h1);
y12 = conv(x1,h2);
y1 = y11+y12;

h12 = h1+h2;
y2 = conv(x1,h12);

ny = nh1(1)+nx1(1):1:nh1(end)+nx1(end);

subplot(2, 1, 1), stem(ny, y1), title("y1 = (x[n]*h1[n]+x[n]*h2[n])");
subplot(2, 1, 2), stem(ny, y2), title("y2 = x[n]*(h1[n]+h2[n])");

saveas(gcf, "plots/P2_4_c.png");

close;