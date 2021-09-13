function result = judge_note(f)
% 2021-9-2 luke
% 信号与系统音乐合成大作业9
% 判断一个频率是否是一个乐音的频率

result = 0;
error = 2.3; % 允许的最大频率误差
if f>100 && f<1500
    l = floor(12*log2(f/110)) - 1; % 1倍频
    h = ceil(12*log2(f/110)) + 1;
    for i = max(0,l):1:min(24,h)
        f0 = 110*2^(i/12);
        if(abs(f0-f) < error)
            result = f0;
            break;
        end
    end
    
    if result == 0 % 2倍频
        l = floor(12*log2(f/220)) - 1;
        h = ceil(12*log2(f/220)) + 1;
        for i = max(0,l):1:min(24,h)
            f0 = 220*2^(i/12);
            if(abs(f0-f) < 2*error)
                result = f0;
                break;
            end
        end
    end
    
    if result == 0 % 3倍频
        l = floor(12*log2(f/330)) - 1;
        h = ceil(12*log2(f/330)) + 1;
        for i = max(0,l):1:min(24,h)
            f0 = 330*2^(i/12);
            if(abs(f0-f) < 3*error)
                result = f0;
                break;
            end
        end
    end
    
    if result == 0 % 4倍频
        l = floor(12*log2(f/440)) - 1;
        h = ceil(12*log2(f/440)) + 1;
        for i = max(0,l):1:min(24,h)
            f0 = 440*2^(i/12);
            if(abs(f0-f) < 4*error)
                result = f0;
                break;
            end
        end
    end
    
end

end

