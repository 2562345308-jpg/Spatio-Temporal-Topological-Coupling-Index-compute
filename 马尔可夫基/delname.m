% 设置要遍历的目录
rootDir = 'G:\sleep_data\G9';

% 获取所有子文件夹
subFolders = dir(rootDir);
subFolders = subFolders([subFolders.isdir]);
subFolders = subFolders(~ismember({subFolders.name}, {'.', '..'}));

% 遍历每个子文件夹
for i = 1:length(subFolders)
    currentFolder = fullfile(rootDir, subFolders(i).name);
    
    % 获取当前文件夹下的所有.mat文件
    matFiles = dir(fullfile(currentFolder, '*.mat'));
    
    % 遍历每个.mat文件
    for j = 1:length(matFiles)
        matFilePath = fullfile(currentFolder, matFiles(j).name);
        
        % 判断文件名中是否包含关键词并进行相应操作
        if ~contains(matFiles(j).name, 'Sleep stage')
            % 文件名不包含关键词，删除该文件
            delete(matFilePath);
        end
    end
end
