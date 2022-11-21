clear;clc;
L = input('请输入拉普拉斯算子：');
I = imread('1.png');
I = rgb2gray(I);
subplot(2,2,1);imshow(I);title('(a)原图');
I = double(I);
[m, n] = size(I);
After = zeros(m, n);
for i = 1:m
    for j = 1:n
        if i == 1 || j == 1  || i == m || j == n || i == 2 || j == 2 || i == m-1 || j == n-1
            After(i, j) = 0;
        else
            After(i, j) = L(1, 1)*I(i-1, j-1)+L(1,2)*I(i-1, j)+L(1,3)*I(i-1, j+1)...
                +L(2,1)*I(i,j-1)+L(2,2)*I(i,j)+L(2,3)*I(i,j+1)...
                +L(3,1)*I(i+1,j-1)+L(3,2)*I(i+1,j)+L(3,3)*I(i+1,j+1);
        end
    end
end
T = After;
T = uint8(T);
subplot(2,2,2);imshow(T);title('(b)拉普拉斯图像');
% 规约化
After(After < 0) = 0;
After(After > 255) = 255;
%After = uint8(After);
subplot(2,2,3);imshow(After);title('(c)规约化后的拉普拉斯图像');

if L(2,2) < 0
    Result = I - After;
else
    Result = I + After;
end
Result = uint8(Result);
subplot(2,2,4);imshow(Result);title('(d)增强了的图像');