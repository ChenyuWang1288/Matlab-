function [result] = my_imresize(path,scale)
%[m, n, l] = imread(path);
image = imread(path);
[m, n, ~] = size(image);
result_m = floor(scale * m); % 取整
result_n = floor(scale * n);

for i = 1:result_m
    for j = 1:result_n
        x = floor((i-1) / scale);
        y = floor((j-1) / scale);
        if x == 0 || y == 0 || x == m - 1 || y == n - 1
            result(1, j, :) = image(1, y+1, :);
            result(i, 1, :) = image(x+1, 1, :);
        else
            a = (i - 1) / scale - x;
            b = (j - 1) / scale - y;
            x = x + 1;
            y = y + 1;
            result(i, j, :) = image(x, y,:)*(1-a)*(1-b)+image(x,y+1,:)*(1-a)*b+image(x+1,y,:)*a*(1-b)+image(x+1,y+1,:)*a*b;
        end
    end
end
end
