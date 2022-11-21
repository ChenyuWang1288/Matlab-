function [PicturePath] = FindDir(RootDir)
PicturePath = {};
RootDir = [RootDir, '/'];
fileList = dir(RootDir);
total = 0;
for i = 1:length(fileList)
    if strcmp(fileList(i).name, '.') || strcmp(fileList(i).name, '..')
        continue;
    end
    if fileList(i).isdir
        PicturePath = [PicturePath, FindDir([RootDir, fileList(i).name])];
    else
        fullPathName = [RootDir, fileList(i).name];
        total = total + 1;
        PicturePath(total) = {fullPathName};
    end
end
end

