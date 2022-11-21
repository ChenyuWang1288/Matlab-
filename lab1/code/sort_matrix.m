function [tmp] = sort_matrix(A, m, n)
%SORT_MATRIX 此处显示有关此函数的摘要
%   此处显示详细说明
tmp = zeros(1, m+n);
for i = 1:(m+n)
    tmp(i) = A(i);
end
for i = 1:m+n
    for j = 2 : m+n-i+1
        if tmp(j-1) > tmp(j)
            temp = tmp(j-1);
            tmp(j-1) = tmp(j);
            tmp(j) = temp;
        end
    end
end
end

