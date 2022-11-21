clear;clc;
I = imread('2.bmp');

subplot(131);
imshow(I);title('原始图像');
I = rgb2gray(I);
BW = imbinarize(I, graythresh(I));
subplot(132);imshow(BW);title('二值图像');
[B, L] = bwboundaries(BW, 'noholes');

subplot(133);
imshow(BW);
title('标记出最大的三块区域的面积的图片');
%imshow(label2rgb(L, @jet, [.5 .5 .5]));title('彩色标记图像');
hold on;

STATS = regionprops(L, 'Area');
top = zeros(3,1);
topindex = zeros(3,1);
for i = 1:length(STATS)
    min = top(1,1);
    index = 1;
    for j = 1:3
        if top(j, 1) < min
            min = top(j, 1);
            index = j;
        end
    end
    if min < STATS(i).Area
        top(index) = STATS(i).Area;
        topindex(index) = i;
    end
end


for k = 1:length(B)
   boundary = B{k};
   if k == topindex(1)
       plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth',2);
   elseif k == topindex(2)
       plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth',2);
   elseif k == topindex(3)
       plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth',2);
   end
end