% Problem 2.4(d)

x1 = [1 1 1 1 0 0 0 0 0 0];
nx1 = 0:1:9;

h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
nh1 = 0:1:4;

y1 = conv(conv(x1, h1), h2);
y2 = conv(x1, conv(h1, h2));

ny = nh1(1)+nx1(1):1:nh1(end)+nh1(end)+nx1(end)

subplot(2,1,1), stem(ny, y1), title("yd1[n]=(x_1[n]*h_1[n])*h_2[n]");
subplot(2,1,2), stem(ny, y2), title("yd2[n]=x_1[n]*(h_1[n]*h_2[n])");

saveas(gcf, "plots/P2_4_d_out.png");
close;
