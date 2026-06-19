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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_1.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness1];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness1.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_2.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness2];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness2.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_3.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness3];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness3.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_4.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness4];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness4.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_5.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness5];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness5.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_6.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness6];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness6.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_7.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness7];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness7.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_8.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness8];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness8.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_9.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness9];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness9.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_10.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness10];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness10.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_11.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness11];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness11.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_12.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness12];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness12.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_13.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness13];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness13.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_betweenness_14.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averagebetweenness14];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_betweenness14.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
disp('数据合并完成！');
