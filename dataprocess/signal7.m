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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_1.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc1];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc1.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_2.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc2];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc2.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_3.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc3];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc3.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_4.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc4];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc4.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_5.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc5];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc5.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_6.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc6];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc6.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_7.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc7];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc7.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_8.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc8];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc8.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_9.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc9];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc9.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_10.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc10];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc10.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_11.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc11];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc11.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_12.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc12];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc12.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_13.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc13];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc13.mat'));%%%%%%%%%%%
    
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
        matFilePath = fullfile(currentFolderPath, 'average_Eloc_14.mat');%%%%%%%%%
    
        % 加载.mat文件数据
        loadedData = load(matFilePath);
        combinedData = [combinedData, loadedData.averageEloc14];%%%%%%%%
      
    end
    % 构建保存目标文件的完整路径
    targetFolder1 = fullfile(targetFolder, subdirName);
    if ~exist(targetFolder1, 'dir')
        mkdir(targetFolder1);
    end
    targetFilePath = fullfile(targetFolder1, sprintf('signal_Eloc14.mat'));%%%%%%%%%%%
    
    % 保存结构体数据为.mat文件
    save(targetFilePath, 'combinedData');
    
end
disp('数据合并完成！');
