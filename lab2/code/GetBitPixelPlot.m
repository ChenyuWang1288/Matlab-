function [] = GetBitPixelPlot(image, f)
%GETBITPIXELPLOT 此处显示有关此函数的摘要
%   此处显示详细说明
m = size(image,1);
n = size(image,2);
X = zeros(1,2);
X(1) = 0;
X(2) = 1;
Array = zeros(1,2);
for i = 1:m
    for j = 1:n
        if image(i,j) == 0
            Array(1) = Array(1)+1;
        else
            Array(2) = Array(2)+1;
        end
    end
end
figure(f);
bar(X, Array);

end

