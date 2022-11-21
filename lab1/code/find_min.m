function [min] = find_min(A, m, n)
%FIND_MIN 此处显示有关此函数的摘要
%   此处显示详细说明
min = A(1, 1);
for i = 1:m
    for j = 1:n
        if A(i, j) < min
            min = A(i ,j);
        end
    end
end
end

