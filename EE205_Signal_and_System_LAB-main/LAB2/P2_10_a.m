% Problem 2.10(a)

load inputs/lineup.mat

%sound(y, 8192); 

figure;
plot(y)
title('Sound befor filtering');

saveas(gcf, "plots/P2_10_ini_out.png");
close;

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

figure;
stem(nhe, he);
title('h_e[n]');
xlabel('n');

saveas(gcf, "plots/P2_10_a_out.png");
close;

% 2.10(b) -------------------------------

% This is not a problem that require to be verified by MATLAB
A = [1 zeros(1, 999) 0.5];
B = [1];
z = filter(B, A, y);

figure;
stem(conv(z,he),'*');
hold on;
stem(y,'p--g')
title('y[n] & z[n]*he[n]');
xlabel('n');

saveas(gcf, "plots/P2_10_b_out.png");
close;
% 2.10(c) -------------------------------
a = [1 zeros(1, 999) 0.5];
b = [1];
d = [1, zeros(1, 4000)];
nd = 0:4000;
her = filter(b, a, d);
nher = 0:4000;

figure;
stem(nd, her);
title('h_{er}[n]');
xlabel('n');

saveas(gcf, "plots/P2_10_c_out.png");
close;

% 2.10(d) -------------------------------
%  I feel that the given value 1000 and 0.5 are fine. 

a = [1 zeros(1, 999) 0.5]
z = filter(1, a, y);

figure;
plot(z);
title('Sound after filtering');

saveas(gcf, "plots/P2_10_d_out.png");
%close;
sound(z, 8192); 

% 2.10(e) -------------------------------
hoa = conv(her, he);
nhoa = (nher(1)+nhe(1)):(nher(end)+nhe(end));

figure;
stem(nhoa, hoa);
title('h_{oa}[n]');
xlabel('n');

saveas(gcf, "plots/P2_10_e_out.png");
close;