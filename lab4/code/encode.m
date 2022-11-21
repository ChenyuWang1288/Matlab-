I = imread('test.bmp');
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
imwrite(d, 'difference.bmp');
imwrite(s, 's.bmp');
save('d.mat', "d");
save('s.mat', "s");