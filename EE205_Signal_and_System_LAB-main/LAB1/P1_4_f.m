%不满足稳定性、可逆性
% Stability, invertability not satified
%（y趋近于无穷，不符合稳定性要求）
% Stability, causality analysis
n=-5:1:5;
x1=n;
y1=n.*x1;

subplot(3,1,1)
stem(n,y1,'g--s');
title('1.4(f)-1');
xlabel('x1');
ylabel('y1');

%可逆性分析(两个不同的x得到了相同的y，不满足可逆性)
x2=[zeros(1,5) 1 zeros(1,5)];
x3=5*[zeros(1,5) 1 zeros(1,5)];
y2=n.*x2;
y3=n.*x3;

subplot(3,1,2);
stem(n,y2,'r--h');
title('1.4(f)-2');
xlabel('x2');
ylabel('y2');

subplot(3,1,3);
stem(n,y3,'m--^');
title('1.4(f)-3');
xlabel('x3');
ylabel('y3');

saveas(gcf, "LAB1/P1_4_f_out.png")