clear;
clc;
% 定义根目录路径
rootDir = 'G:\Meanparameter\G8';%%%%%%%%%%%
outputDir = 'G:\nettp\G8';%%%%%%%%%%%

% 获取G2下的所有文件夹
folders = dir(rootDir);
folders = folders([folders.isdir] & ~ismember({folders.name}, {'.', '..'}));

% 初始化空数组，用于存储所有average_betweenness_1的数据
allData = [];
% 遍历每一个文件夹
for i = 1:length(folders)
    % 获取当前文件夹路径
    currentFolder = fullfile(rootDir, folders(i).name, 'Sleep stage N1_');%%%%%%%%
    
    % 检查average_betweenness_1.mat文件是否存在
    matFile = fullfile(currentFolder, 'average_P-P.mat');
    
    
        % 读取mat文件中的数据
    data = load(matFile);
        
        % 如果数据存储在一个特定的变量中，比如betweenness
        % 假设.mat文件中存储的变量名是betweenness
        
    allData = [allData; data.averageinf]; % 将数据拼接到一起%%%%%%
 
end
outputFile = fullfile(outputDir, 'N1_PP.mat');%%%%%%
save(outputFile, 'allData');

allData = [];
for i = 1:length(folders)
    % 获取当前文件夹路径
    currentFolder = fullfile(rootDir, folders(i).name, 'Sleep stage N2_');%%%%%%%%
    
    % 检查average_betweenness_1.mat文件是否存在
    matFile = fullfile(currentFolder, 'average_P-P.mat');
    
    
        % 读取mat文件中的数据
    data = load(matFile);
        
        % 如果数据存储在一个特定的变量中，比如betweenness
        % 假设.mat文件中存储的变量名是betweenness
        
    allData = [allData; data.averageinf]; % 将数据拼接到一起%%%%%%
 
end
outputFile = fullfile(outputDir, 'N2_PP.mat');%%%%%%
save(outputFile, 'allData');

allData = [];
for i = 1:length(folders)
    % 获取当前文件夹路径
    currentFolder = fullfile(rootDir, folders(i).name, 'Sleep stage N3_');%%%%%%%%
    
    % 检查average_betweenness_1.mat文件是否存在
    matFile = fullfile(currentFolder, 'average_P-P.mat');
    
    
        % 读取mat文件中的数据
    data = load(matFile);
        
        % 如果数据存储在一个特定的变量中，比如betweenness
        % 假设.mat文件中存储的变量名是betweenness
        
    allData = [allData; data.averageinf]; % 将数据拼接到一起%%%%%%
 
end
outputFile = fullfile(outputDir, 'N3_PP.mat');%%%%%%
save(outputFile, 'allData');

allData = [];
for i = 1:length(folders)
    % 获取当前文件夹路径
    currentFolder = fullfile(rootDir, folders(i).name, 'Sleep stage R_');%%%%%%%%
    
    % 检查average_betweenness_1.mat文件是否存在
    matFile = fullfile(currentFolder, 'average_P-P.mat');
    
    
        % 读取mat文件中的数据
    data = load(matFile);
        
        % 如果数据存储在一个特定的变量中，比如betweenness
        % 假设.mat文件中存储的变量名是betweenness
        
    allData = [allData; data.averageinf]; % 将数据拼接到一起%%%%%%
 
end
% 保存拼接好的数据到新的.mat文件中
outputFile = fullfile(outputDir, 'R_PP.mat');%%%%%%
save(outputFile, 'allData');

allData = [];
for i = 1:length(folders)
    % 获取当前文件夹路径
    currentFolder = fullfile(rootDir, folders(i).name, 'Sleep stage W_');%%%%%%%%
    
    % 检查average_betweenness_1.mat文件是否存在
    matFile = fullfile(currentFolder, 'average_P-P.mat');
    
    
        % 读取mat文件中的数据
    data = load(matFile);
        
        % 如果数据存储在一个特定的变量中，比如betweenness
        % 假设.mat文件中存储的变量名是betweenness
        
    allData = [allData; data.averageinf]; % 将数据拼接到一起%%%%%%
 
end
% 保存拼接好的数据到新的.mat文件中
outputFile = fullfile(outputDir, 'W_PP.mat');%%%%%%
save(outputFile, 'allData');