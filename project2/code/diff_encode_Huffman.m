I = imread('test3.png');
d = zeros(size(I, 1), size(I, 2));
s = zeros(size(I, 1), size(I, 2));
d = im2uint8(d);
s = im2uint8(s);
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        if i == 1
            d(i, j) = I(i, j);
        
        else
            if I(i, j) - I(i - 1, j) > 0
                d(i, j) = I(i, j) - I(i - 1, j);
                s(i, j) = 1;
            else
                d(i, j) = I(i - 1, j)- I(i, j);
                s(i, j) = 0;
            end
        end
    end
end
% imwrite(d, 'difference.bmp');
% imwrite(s, 's.bmp');
% save('d.mat', "d");
% save('s.mat', "s");
I = int16(I);
[m, n] = size(I);
%P = zeros(1:512);
img_vector = I(:);
k = -256:255;
k = int16(k);
for i = 1:length(k)
    P(i) = length(find(img_vector == k(i))) / (m*n);
end
dict = huffmandict(k, P);
encode = huffmanenco(img_vector, dict);
decode = huffmandeco(encode, dict);
diff_img_decode = col2im(decode, [m,n], [m,n], 'distinct');
