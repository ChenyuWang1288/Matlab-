function [] = GetGreyPixelPlot(image, f)
%GETPIXELPLOT 此处显示有关此函数的摘要
%   此处显示详细说明
m = size(image,1);
n = size(image,2);
X = zeros(1, 256);
for i = 1:256
    X(i) = i - 1;
end
Array = zeros(1,256);

for i = 1:m
    for j = 1:n
        Array(image(i,j)+1) = Array(image(i,j)+1) + 1;
    end
end
%figure;
figure(f);
bar(X, Array);
end

