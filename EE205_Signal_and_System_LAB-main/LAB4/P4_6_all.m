load ctftmod.mat

% 4.6(a)
z = [dash dash dot dot];

% 4.6(b)
figure;
freqs(bf, af)
title('Frequency response of bf and af');
saveas(gcf, "plots/P4_6_b_out.png")
close

% 4.6(c)

ydash = lsim(bf, af, dash, t(1:length(dash)))
ydot = lsim(bf, af, dot, t(1:length(dot)))

figure;
subplot(2,1,1)
hold on;
plot(t(1:length(dash)), dash);
plot(t(1:length(dash)), ydash);
legend('dash', 'dash after lowpass filter', 'Location', 'northeast');
title('dash and dash after lowpass filter');
xlabel('t');
subplot(2,1,2)
hold on;
plot(t(1:length(dot)), dot);
plot(t(1:length(dot)), ydot);
title('dot and dot after lowpass filter');
legend('dot', 'dot after lowpass filter', 'Location', 'northeast');
xlabel('t');
saveas(gcf, 'plots/P4_6_c_out.png')
close

% 4.6(d)
y = dash .* cos(2*pi*f1*t(1:length(dash)))
yo = lsim(bf, af, y, t(1:length(y)))

figure;
subplot(2,1,1)
hold on;
plot(t(1:length(dash)), y);
title('y');
subplot(2,1,2)
plot(t(1:length(y)), yo);
title('After being filtered');

saveas(gcf, 'plots/P4_6_d_out.png')
close

% 4.6(e)

% 4.6(f)

% 4.6(g)
% x1 = x .* sin(2*pi*f1*t(1:length(x)))
% m1 = lsim(bf, af, x1, t(1:length(x1)))

% x2 = x .* sin(2*pi*f2*t(1:length(x)))
% m2 = lsim(bf, af, x2, t(1:length(x2)))

% x3 = x .* cos(2*pi*f1*t(1:length(x)))
% m3 = lsim(bf, af, x3, t(1:length(x3)))

x1 = x .* cos(2*pi*f1*t(1:length(x)))
m1 = lsim(bf, af, x1, t(1:length(x1)))

x2 = x .* sin(2*pi*f2*t(1:length(x)))
m2 = lsim(bf, af, x2, t(1:length(x2)))

x3 = x .* sin(2*pi*f1*t(1:length(x)))
m3 = lsim(bf, af, x3, t(1:length(x3)))

figure;
subplot(3,1,1)
plot(t, m1);
title('m1');
xlabel('t');
ylabel('m1');
subplot(3,1,2)
plot(t, m2);
title('m2');
xlabel('t');
ylabel('m2');
subplot(3,1,3)
plot(t, m3);
title('m3');
xlabel('t');
ylabel('m3');

saveas(gcf, "plots/P4_6_g_out.png")
close


% _ . .   D
% . . .   S
% . _ _ . P

