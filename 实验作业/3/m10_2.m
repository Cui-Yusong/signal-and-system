
x1 = (0.9).^[0:7];
x2 = (0.9).^[0:31];
x3 = (0.9).^[0:63];
x4 = (0.9).^[0:127];
x5 = (0.9).^[0:255];


t1 = clock;
X1 = dtfs(x1,0);
dtfstime1 = etime(clock,t1);

t2 = clock;
X2 = dtfs(x2,0);
dtfstime2 = etime(clock,t2);

t3 = clock;
X3 = dtfs(x3,0);
dtfstime3 = etime(clock,t3);

t4 = clock;
X4 = dtfs(x4,0);
dtfstime4 = etime(clock,t4);

t5 = clock;
X5 = dtfs(x5,0);
dtfstime5 = etime(clock,t5);

dtfscomps = [dtfstime1,dtfstime2,dtfstime3,dtfstime4,dtfstime5];

t1 = clock;
X1 = fft(x1,0);
dtfstime1 = etime(clock,t1);

t2 = clock;
X2 = fft(x2,0);
dtfstime2 = etime(clock,t2);

t3 = clock;
X3 = fft(x3,0);
dtfstime3 = etime(clock,t3);

t4 = clock;
X4 = fft(x4,0);
dtfstime4 = etime(clock,t4);

t5 = clock;
X5 = fft(x5,0);
dtfstime5 = etime(clock,t5);

fftcomps = [dtfstime1,dtfstime2,dtfstime3,dtfstime4,dtfstime5];

x = [8 32 64 128 256];
loglog(x,dtfscomps);
hold on
loglog(x,fftcomps);
legend('dtfscomps','fftcomps');
xlabel('N');