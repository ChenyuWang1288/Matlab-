function [result] = Cut(binPicture)
binPicture = imresize(binPicture, [370, 370]);
result = zeros(1, 9); % cut into 3x3 pieces
for i = 1:123
    for j = 1:123
        if binPicture(i, j) == 0
            result(1) = result(1) + 1;
        end
    end
end

for i = 1:123
    for j = 124:247
        if binPicture(i, j) == 0
            result(2) = result(2) + 1;
        end
    end
end

for i = 1:123
    for j = 248:370
        if binPicture(i, j) == 0
            result(3) = result(3) + 1;
        end
    end
end

for i = 124:247
    for j = 1:123
        if binPicture(i, j) == 0
            result(4) = result(4) + 1;
        end
    end
end

for i = 124:247
    for j = 124:247
        if binPicture(i, j) == 0
            result(5) = result(5) + 1;
        end
    end
end

for i = 124:247
    for j = 248:370
        if binPicture(i, j) == 0
            result(6) = result(6) + 1;
        end
    end
end

for i = 248:370
    for j = 1:123
        if binPicture(i, j) == 0
            result(7) = result(7) + 1;
        end
    end
end

for i = 248:370
    for j = 124:247
        if binPicture(i, j) == 0
            result(8) = result(8) + 1;
        end
    end
end

for i = 248:370
    for j = 248:370
        if binPicture(i, j) == 0
            result(9) = result(9) + 1;
        end
    end
end
end

