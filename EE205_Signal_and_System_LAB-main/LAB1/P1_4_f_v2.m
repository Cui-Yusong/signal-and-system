% Stability analysis
n=-5:1:5;
x1=n;
y1=n.*x1;

subplot(4,1,1)
stem(n,y1,'g--s');
title('1.4(f)-1');
xlabel('x_1[n]=n');
ylabel('y_1[n]=nx_1[n]');

% invertibility and time-invariant analysis
x2=[zeros(1,5) 1 zeros(1,5)];
x3=3 .* x2
y2=n .* x2;
y3=n .* x3;
y4=(n+1) .* x2;

subplot(4,1,2);
stem(n,y2,'r--h');
title('1.4(f)-2');
xlabel('x_2[n]');
ylabel('y_2[n]');

subplot(4,1,3);
stem(n,y3,'r--h');
title('1.4(f)-3');
xlabel('x_3[n]');
ylabel('y_3[n]');

subplot(4,1,4);
stem(n,y4,'m--^');
title('1.4(f)-4');
xlabel('x_2[n]');
ylabel('y_4[n]');

saveas(gcf, "LAB1/P1_4_f_out2.png")