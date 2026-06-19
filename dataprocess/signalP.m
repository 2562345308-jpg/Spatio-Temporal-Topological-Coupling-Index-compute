clear;
clc;
% 源文件夹路径
sourceFolder = 'G:\Meanparameter\G1';%%%%%%%%
subdirs = dir(sourceFolder);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'
% 目标文件夹路径
targetFolder = 'G:\signal\G1';%%%%%%%%%%%

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
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_1.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness1];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness1.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_2.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness2];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness2.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_3.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness3];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness3.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_4.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness4];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness4.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_5.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness5];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness5.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_6.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness6];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness6.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_7.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness7];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness7.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_8.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness8];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness8.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_9.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness9];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness9.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_10.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness10];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness10.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_11.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness11];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness11.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_12.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness12];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness12.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_13.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness13];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness13.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
for j = 1:length(subdirs)
    subdirName = subdirs(j).name;
    inputSubdirPath = fullfile(sourceFolder, subdirName);
    combinedData = [];
% 遍历每个子文件夹
    for i = 1:length(subfolders)
        currentSubfolder = subfolders{i};
    
        % 构建当前子文件夹的完整路径
        currentFolderPath = fullfile(inputSubdirPath, currentSubfolder);
    
        % 构建.mat文件的完整路径
        matFilePath = fullfile(currentFolderPath, 'average_pagerankness_14.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagepagerankness14];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_pagerankness14.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
disp('数据合并完成！');
