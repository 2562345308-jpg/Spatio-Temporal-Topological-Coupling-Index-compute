clear;
clc;
% 源文件夹路径
sourceFolder = 'E:\processed_data\T3_part\H';%%%%%%%%
subdirs = dir(sourceFolder);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'
% 目标文件夹路径
targetFolder = 'E:\processed_data\S_part\H';%%%%%%%%%%%

% 子文件夹名称列表
subfolders = {'Sleep stage N1_', 'Sleep stage N2_', 'Sleep stage N3_', 'Sleep stage R_', 'Sleep stage W_'};

% 创建目标文件夹

for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder, 'results');
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pathlength.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepathlength];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pathlength1.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
disp('数据合并完成！');
