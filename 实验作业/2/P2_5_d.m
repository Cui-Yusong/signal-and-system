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

saveas(gcf, "P2_5_d_out.png");