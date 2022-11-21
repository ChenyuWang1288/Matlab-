function [] = TransToBit(Before, f)
%TRANSTOBIT 此处显示有关此函数的摘要
%   此处显示详细说明
m = size(Before,1);
n = size(Before,2);
After = zeros(m, n);
for i = 1:m
    for j = 1:n
        if Before(i,j) < 127
            After(i,j) = 0;
        else
            After(i,j) = 255;
        end
    end
end
figure(f);
imshow(After);

imwrite(After, 'bitResult.tif');
end

