function [] = TransToGrey(Before,f)
%TRANSTOGREY 此处显示有关此函数的摘要
%   此处显示详细说明
R = Before(:,:,1);
G = Before(:,:,2);
B = Before(:,:,3);
gray = 0.3*R+0.59*G+0.11*B;
figure(f);
imshow(gray);
imwrite(gray, 'result.png');
end

