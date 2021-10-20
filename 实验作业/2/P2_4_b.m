% Problem 2.4(b)

x1 = [1 1 1 1 0 0 0 0 0 0];
nx1 = 0:1:9;

h1 = [1 -1 3 0 1];
nh1 = 0:1:4;

y1 = conv(x1, h1);
y2 = conv(h1, x1);
ny = nh1(1)+nx1(1):1:nh1(end)+nx1(end);

subplot(2,1,1), stem(ny, y1), title("y1[n]=x1[n]*h1[n]");
subplot(2,1,2), stem(ny, y2), title("y2[n]=h1[n]*x1[n]");

saveas(gcf, "plots/P2_4_b.png");
close;