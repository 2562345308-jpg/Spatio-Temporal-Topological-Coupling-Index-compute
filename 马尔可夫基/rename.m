% 设置要遍历的目录
rootDir = 'E:\sleep_data\H';

% 获取所有子文件夹
subFolders = dir(rootDir);
subFolders = subFolders([subFolders.isdir]);
subFolders = subFolders(~ismember({subFolders.name}, {'.', '..'}));

% 遍历每个子文件夹
for i = 1:length(subFolders)
    currentFolder = fullfile(rootDir, subFolders(i).name);
    
    % 获取当前文件夹下的所有.mat文件
    matFiles = dir(fullfile(currentFolder, '*.mat'));
    
    % 标记当前文件夹是否包含需要的文件
    hasSleepStageFiles = false;
    
    % 遍历每个.mat文件
    for j = 1:length(matFiles)
        matFilePath = fullfile(currentFolder, matFiles(j).name);
        
        % 判断文件名中是否包含关键词并进行相应操作
        if contains(matFiles(j).name, 'Sleep stage 1')
            newFileName = strrep(matFiles(j).name, 'Sleep stage 1', 'Sleep stage N1');
            newFilePath = fullfile(currentFolder, newFileName);
            movefile(matFilePath, newFilePath);
            hasSleepStageFiles = true;
        elseif contains(matFiles(j).name, 'Sleep stage 2')
            newFileName = strrep(matFiles(j).name, 'Sleep stage 2', 'Sleep stage N2');
            newFilePath = fullfile(currentFolder, newFileName);
            movefile(matFilePath, newFilePath);
            hasSleepStageFiles = true;
        elseif contains(matFiles(j).name, 'Sleep stage 3')
            newFileName = strrep(matFiles(j).name, 'Sleep stage 3', 'Sleep stage N3');
            newFilePath = fullfile(currentFolder, newFileName);
            movefile(matFilePath, newFilePath);
            hasSleepStageFiles = true;
        end
    end
    
    % 如果当前文件夹没有需要的文件，则跳过
    if ~hasSleepStageFiles
        continue;
    end
end

