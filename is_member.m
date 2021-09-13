function result = is_member(a,b)
% 判读一个数是否存在于一个数组，差<0.1就算
result = 0;
for i = 1:1:length(b)
    if(abs(a-b(i)) < 1.5)
        result = 1;
        break;
    end
end

