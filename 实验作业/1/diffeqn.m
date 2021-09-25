function y = diffeqn(a,x,yn1)
    x_len = length(x);
    y = zeros(x_len,1);
    y(1) = a*yn1 + x(1);
    if x_len >= 2
        for i=2:x_len
            y(i) = a*y(i-1)+x(i)
        end
    end
end

