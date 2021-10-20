% Problem 2.10(f)

load lineup.mat
A = [1 zeros(1, 999) 0.5];
B = [1];
z = filter(B, A, y);
z=z';
rxx=conv(z, fliplr(z));


% For y1
ryy1 = conv(y, flip(y));
nryy1 = -(length(y)-1):(length(y)-1);
figure;
plot(nryy1, ryy1);
title('y[n]*y[-n]');
saveas(gcf, "plots/P2_10_f1_1.png");
close;

a1=rxx(7000);b1=2*rxx(8000);c1=rxx(7000)-ryy1(7000);
d1=b1^2-4*a1*c1;
x1=(-b1+d1^0.5)/(2*a1);

N = 1000;
yo1 = filter(1, [1 zeros(1, N-1) x1], y);
sound(yo1, 8192); 

% For y2
ryy2 = conv(y2, flip(y2));
nryy2 = -(length(y2)-1):(length(y2)-1);

figure;
plot(nryy2, ryy2);
title('y_2[n]*y_2[-n]');
saveas(gcf, "plots/P2_10_f1_2.png");
close;

a2=rxx(7000);b2=2*rxx(7501);c2=rxx(7000)-ryy2(7000);
d2=b2^2-4*a2*c2;
x2=(-b2+d2^0.5)/(2*a2);

N = 501;
yo2 = filter(1, [1 zeros(1, N-1) x2], y2);
sound(yo2, 8192);

% For y3 
ryy3 = conv(y3, flip(y3));
nryy3 = -(length(y3)-1):(length(y3)-1);

figure;
plot(nryy3, ryy3);
title('y_3[n]*y_3[-n]');
saveas(gcf, "plots/P2_10_f1_3.png");
close;

N = 751;
N1 = 2252;
alpha = 0.5;
alpha1 = 0.28;
b = [1 zeros(1, N-1) alpha zeros(1, N1-1)] + [1 zeros(1, N1-1) alpha1 zeros(1, N-1)];
yo3 = filter(1, b, y3);
sound(yo3, 8192);