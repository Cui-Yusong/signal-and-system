x1 = [1 1 1 1 0 0 0 0 0 0];
nx1 = 0:1:9;

h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
nh1 = 0:1:4;

subplot(3, 1, 1), stem(nx1, x1), title("x_1[n]");
subplot(3, 1, 2), stem(nh1, h1), title("h_1[n]");
subplot(3, 1, 3), stem(nh1, h2), title("h_2[n]");

saveas(gcf, "plots/P2_4_a_out.png");

close;