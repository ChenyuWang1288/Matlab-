clear;clc;
scale = input('请输入缩放倍数：');
After = my_imresize('new.jpg', scale);
Pre = imread('new.jpg');
figure;imshow(Pre);

xlabel(['(a)原始图像: ',num2str(size(Pre,1)),'*', num2str(size(Pre,2))]);
figure;imshow(After);
xlabel(['(b)缩放后图像: ',num2str(size(After,1)),'*', num2str(size(After,2))]);