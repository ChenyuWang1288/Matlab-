function [T] = Trans_M(A, m, n)
%TRANS_M 此处显示有关此函数的摘要
%   此处显示详细说明
T = zeros(n,m);
for i = 1:m
    for j = 1:n
        T(j, i) = A(i, j);
    end
end
end

