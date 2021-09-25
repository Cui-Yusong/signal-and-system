u=randn(1,40);
nu = 1:40;
v=u(end:-1:1);
nv=-40:-1;
w=conv(u,v);
nw=nu(1)+nv(1):nu(end)+nv(end);
stem(nw,w)