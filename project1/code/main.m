clear;clc;
directory = input('请输入存储图片的文件夹路径:','s');
s = input('请输入待检索图像文件名：','s');
top = input('请输入希望检索出的图像个数：','s');
top = str2double(top);
A = imread([directory, '/', s]);

if ndims(A) == 3
    binA = imbinarize(rgb2gray(A));
    subplot(3, 6, 1);
    imshow(imbinarize(rgb2gray(A)));
else
    binA = imbinarize(A);
    subplot(3, 6, 1);
    imshow(imbinarize(A));
end
PicturePath = FindDir(directory);
n = length(PicturePath);
result = zeros(1, n);
for i = 1:n
    if strcmp(imfinfo(PicturePath{i}).ColorType, 'indexed') || strcmp(imfinfo(PicturePath{i}).ColorType, 'grayscale')
        compare1 = Cut(binA);
        compare2 = Cut(imbinarize(imread(PicturePath{i})));
        result(i) = Similar(compare1, compare2);
    elseif strcmp(imfinfo(PicturePath{i}).ColorType, 'truecolor')
        compare1 = Cut(binA);
        tmpGray = rgb2gray(imread(PicturePath{i}));
        compare2 = Cut(imbinarize(tmpGray));
        result(i) = Similar(compare1, compare2);
    end
end
tmpmax = 0;
maxindex = 0;
for i = 1:n
    if result(i) > tmpmax
        tmpmax = result(i);
        maxindex = i;
    end
end
subplot(3, 6, 7);
if strcmp(imfinfo(PicturePath{maxindex}).ColorType, 'indexed') || strcmp(imfinfo(PicturePath{maxindex}).ColorType, 'grayscale')
    imshow(imbinarize(imread(PicturePath{maxindex})));
elseif strcmp(imfinfo(PicturePath{maxindex}).ColorType, 'truecolor')
    imshow(imbinarize(rgb2gray(imread(PicturePath{maxindex}))));
end
currentmax = tmpmax;
premax = currentmax;
currentmax = 0;
for i = 2:top
    for j = 1:n
        if result(j) > currentmax && result(j) < premax
            currentmax = result(j);
            maxindex = j;
        end
    end
    premax = currentmax;
    currentmax = 0;
    subplot(3, 6, 6+i);
    if strcmp(imfinfo(PicturePath{maxindex}).ColorType, 'indexed') || strcmp(imfinfo(PicturePath{maxindex}).ColorType, 'grayscale')
        imshow(imbinarize(imread(PicturePath{maxindex})));
    elseif strcmp(imfinfo(PicturePath{maxindex}).ColorType, 'truecolor')
        imshow(imbinarize(rgb2gray(imread(PicturePath{maxindex}))));
    end
    
end

    
