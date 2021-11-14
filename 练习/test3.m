A=[1 0.3];
B=3;

t=0:0.1:2*pi;
x=cos(t);
y=lsim(B,A,x,t)';
subplot(2,1,1), plot(t,x);
xlim([0 2*pi]);
subplot(2,1,2), plot(t,y);
xlim([0 2*pi]);