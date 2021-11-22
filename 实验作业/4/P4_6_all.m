load ctftmod.mat

% 4.6_a
z = [dash dash dot dot];


% 4.6_b
figure;
freqs(bf, af)
title('Frequency response of bf and af');
saveas(gcf, "./P4_6_b.png")
close

% 4.6_c

ydash = lsim(bf, af, dash, t(1:length(dash)));
ydot = lsim(bf, af, dot, t(1:length(dot)));

figure;
subplot(2,1,1)
hold on;
plot(t(1:length(dash)), dash);
plot(t(1:length(dash)), ydash);
legend('dash without lowpass filter', 'dash with lowpass filter', 'Location', 'northeast');
title('Dash');
xlabel('t');
subplot(2,1,2)
hold on;
plot(t(1:length(dot)), dot);
plot(t(1:length(dot)), ydot);
legend('dot without lowpass filter', 'dot with lowpass filter', 'Location', 'northeast');
title('Dot');
xlabel('t');
saveas(gcf, './P4_6_c.png')
close

% 4.6_d
y = dash .* cos(2*pi*f1*t(1:length(dash)));
yo = lsim(bf, af, y, t(1:length(y)));

figure;
subplot(2,1,1)
hold on;
plot(t(1:length(dash)), y);
title('Without filter');
subplot(2,1,2)
plot(t(1:length(y)), yo);
title('With filter');

saveas(gcf, './P4_6_d.png')
close

% 4.6_g
x1 = x .* cos(2*pi*f1*t(1:length(x)));
m1 = lsim(bf, af, x1, t(1:length(x1)));

x2 = x .* sin(2*pi*f2*t(1:length(x)));
m2 = lsim(bf, af, x2, t(1:length(x2)));

x3 = x .* sin(2*pi*f1*t(1:length(x)));
m3 = lsim(bf, af, x3, t(1:length(x3)));

figure;
subplot(3,1,1)
plot(t, m1);
title('m1');
xlabel('t');
subplot(3,1,2)
plot(t, m2);
title('m2');
xlabel('t');
subplot(3,1,3)
plot(t, m3);
title('m3');
xlabel('t');

saveas(gcf, "./P4_6_g.png")
close