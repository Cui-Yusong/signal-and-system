% 3.5最后一问

function a=dtfs(x,n_init);
a=[];
w=2*pi/length(x);  %fundamental frequency
    for k=n_init:n_init+length(x)-1  %period from 0+n0 to N-1+n0
        a_k=0;
            for n=1:length(x)
             a_k=a_k+x(n)*exp(-j*k*w*(n+n_init-1));
            end
        a=[a a_k/length(x)];
    end
    
    if n_init<0
        for i=1:-n_init
            a=[a a(i)];
        end
        a=a(1-n_init:length(a));
    else if n_init>0
        for i=i:n_init
            a=[a(length(a)-i+1) a];
        end
        a=a(1:length(x));
    end
end