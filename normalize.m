function vector = normalize(vector)
% 数组归一化;
n = length(vector);
l = 0;
for i=1:1:n
    l = l + vector(i)^2;
end

vector = vector/sqrt(l);
end

