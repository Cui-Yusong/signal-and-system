%3.9(a)
t=linspace(0,20,1000);
x=cos(t);
b=1;
a=[1 1]; % RC=1
y1=lsim(b,a,x,t);
plot(t,x,'r');
hold on;
plot(t,y1,'g');
xlabel('t');
ylabel('x(t) and y(t)');
xlim([10,20]);
legend('x(t)','y(t)');

saveas(gcf, "plots/P3_9_a_out.png");
close;

%3.9(b)
x2=cos(t); 
x2(x2>0)=ones(size(x2(x2>0))); 
x2(x2<0)=-ones(size(x2(x2<0)));
y2=lsim(b,a,x2,t);
plot(t,y2,'g');
xlim([10,20]);
xlabel('t');
ylabel('y_2(t)');

saveas(gcf, "plots/P3_9_b_out.png");
close;

%3.9(c)
plot(t,x2,'g');
hold on;
apos_k=[2/pi -2/(3*pi) 2/(5*pi) -2/(7*pi) 2/(9*pi)];
aneg_k=[2/pi -2/(3*pi) 2/(5*pi) -2/(7*pi) 2/(9*pi)];
s1=apos_k(1)*exp(j*t)+aneg_k(1)*exp(-j*t);
s2=apos_k(2)*exp(3j*t)+aneg_k(2)*exp(-3j*t);
s3=apos_k(3)*exp(5j*t)+aneg_k(3)*exp(-5j*t);
s4=apos_k(4)*exp(7i*t)+aneg_k(4)*exp(-7j*t);
s5=apos_k(5)*exp(9j*t)+aneg_k(5)*exp(-9j*t);
sn=s1+s2+s3+s4+s5;
plot(t,sn,'r');
xlabel('t');
legend('x_2(t)','sum');

saveas(gcf, "plots/P3_9_c_out.png");
close;

%3.9(d)
ys1=lsim(b,a,s1,t);
ys2=lsim(b,a,s2,t);
ys3=lsim(b,a,s3,t);
ys4=lsim(b,a,s4,t);
ys5=lsim(b,a,s5,t);
ysn=lsim(b,a,sn,t);
ysum=ys1+ys2+ys3+ys4+ys5;
subplot(2,1,1);
plot(t,ysum);
xlabel('t');
title('response to sum of y1 to y5');
subplot(2,1,2);
plot(t,ysn);
xlabel('t');
title('response to ssum');

saveas(gcf, "plots/P3_9_d_out.png");
close;

%3.9(e)
ysn=lsim(b,a,sn,t);
y2=lsim(b,a,x2,t);
plot(t,ysn,'r--');
hold on;
plot(t,y2,'g-');
xlabel('t');
title('response to ssum and x_2(t)');
legend('y_ssum(t)','y_2(t)');

saveas(gcf, "plots/P3_9_e_out.png");
close;

%3.9(f)

% y1
y1=(1/(1+j))*apos_k(1)*exp(j*t)+(1/(1+j))*aneg_k(1)*exp(-j*t);
ys1=lsim(b,a,s1,t);
subplot(5,2,1);
plot(t,y1)
xlim([10,20]);
xlabel('t');
title('analytically determined y1');
subplot(5,2,2);
plot(t,ys1)
xlim([10,20]);
xlabel('t');
title('simulated y1');

% y2
y2=(1/(1+3j))*apos_k(2)*exp(3j*t)+(1/(1-3j))*aneg_k(2)*exp(-3j*t);
ys2=lsim(b,a,s2,t);
subplot(5,2,3);
plot(t,y2)
xlim([10,20]);
xlabel('t');
title('analytically determined y2');
subplot(5,2,4);
plot(t,ys2)
xlim([10,20]);
xlabel('t');
title('simulated y2');

% y3
y3=(1/(1+5j))*apos_k(3)*exp(5j*t)+(1/(1-5j))*aneg_k(3)*exp(-5j*t);
ys3=lsim(b,a,s3,t);
subplot(5,2,5);
plot(t,y3)
xlim([10,20]);
xlabel('t');
title('analytically determined y3');
subplot(5,2,6);
plot(t,ys3)
xlim([10,20]);
xlabel('t');
title('simulated y3');

% y4
y4=(1/(1+7j))*apos_k(4)*exp(7j*t)+(1/(1-7j))*aneg_k(4)*exp(-7j*t);
ys4=lsim(b,a,s4,t);
subplot(5,2,7);
plot(t,y4)
xlim([10,20]);
xlabel('t');
title('analytically determined y4');
subplot(5,2,8);
plot(t,ys4)
xlim([10,20]);
xlabel('t');
title('simulated y4');

% y5
y5=(1/(1+9j))*apos_k(5)*exp(9j*t)+(1/(1-9j))*aneg_k(5)*exp(-9j*t);
ys5=lsim(b,a,s5,t);
subplot(5,2,9);
plot(t,y5)
xlim([10,20]);
xlabel('t');
title('analytically determined y5');
subplot(5,2,10);
plot(t,ys5)
xlim([10,20]);
xlabel('t');
title('simulated y5');

saveas(gcf, "plots/P3_9_f_out.png");
close;
