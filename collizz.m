N = 11;
M = 500;
p = [];
x = 0;

%%вероятностu
for i=1:N-1
    p(i) = x;
    x = x+0.005;
    i = i+1;    
end

time = [];
for i =1:N-1
   
    c = 0;
    all = 0;
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
        if sumMsg > 1
            c = c +sumMsg
        end
        all = sumMsg + all;
    end
        
    time(i) = c/all;
    
end
plot(p,time);

