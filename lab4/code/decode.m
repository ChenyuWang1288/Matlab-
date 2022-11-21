d = load("d.mat");
d = cell2mat(struct2cell(d));
s = load("s.mat");
s = cell2mat(struct2cell(s));
restore = zeros(size(d, 1), size(d,2));
restore = im2uint8(restore);
for i = 1:size(d, 1)
    for j = 1:size(d, 2)
        if i == 1
            restore(i, j) = d(i, j);
        else
            if s(i, j) == 1
                restore(i, j) = restore(i-1, j) + d(i, j);
            else
                restore(i, j) = restore(i-1, j) - d(i, j);
            end
        end
    end 
end
imwrite(restore, 'restore.bmp');