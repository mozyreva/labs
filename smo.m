N = 11;
M = 10000;
p = [];
x = 0;

%%вероятностu
for i=1:N-1
    p(i) = x;
    x = x+0.01;
    i = i+1;    
end

time = [];
for i =1:N-1
    Q = [];
    for j=1:M
        Msg = [];
        for k=1:N
            if rand(1) <= p(i)
                Msg(k) = 1;
            else
                Msg(k) = 0;
            end  
        end
        sumMsg = sum(Msg);
        if length(Q) == 0
            Q(j) = 0;
        elseif Q(j-1) <= 0
            Q(j) = sumMsg;
        else
            Q(j) = Q(j-1) - 1 + sumMsg;
        end
    end
    if p(i) == 0 
        time(i) = 0;
    else
        time(i) = sum(Q)/p(i);
    end
end
plot(p,time);

