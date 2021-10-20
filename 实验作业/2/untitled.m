% Problem 2.10(a)

load lineup.mat

%sound(y, 8192); 



% 2.10(a) -------------------------------
x = [1 zeros(1, 1000)];
nx = 0:1000;

he = zeros(1, 1001);
nhe = 0:1000;

for i = 1:1001
    if i < 1001
        he(i) = x(i);
    else
        he(i) = x(i) + 0.5*x(i-1000);
    end    
end



A = [1 zeros(1, 999) 0.5];
B = [1];
z = filter(B, A, y);

figure;
stem(conv(z,he),'*');
hold on;
stem(y,'g')
title('y[n] , z[n]*he[n]');
xlabel('n');

saveas(gcf, "plots/P2_10_b.png");
close;
