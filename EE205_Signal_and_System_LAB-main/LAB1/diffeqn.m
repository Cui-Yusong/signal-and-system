function y=diffeqn(a,x,yn1)
    y=zeros(length(x));
    y(1)=a*yn1+x(1);
    if length(x)>=2
        for i=2:length(x)
            y(i)=a*y(i-1)+x(i);
        end
    end
end
