clear;
clc;
% 定义根目录路径
rootDir = 'G:\Meanparameter\R06'; %%%%%%%%%%%
outputDir = 'G:\nettp\R06'; %%%%%%%%%%%
% 检查输出目录是否存在，如果不存在则创建
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end
% 获取G2下的所有文件夹
folders = dir(rootDir);
folders = folders([folders.isdir] & ~ismember({folders.name}, {'.', '..'}));

% 定义要处理的文件数量 (从1到14)
numFiles = 14;

% 遍历每一个文件 (从average_betweenness_1到average_betweenness_14)
for n = 1:numFiles
    % 初始化空数组，用于存储所有average_betweenness_n的数据
    allData = [];

    % 遍历每一个文件夹
    for i = 1:length(folders)
        % 获取当前文件夹路径
        currentFolder = fullfile(rootDir, folders(i).name, 'Sleep stage W_'); %%%%%%%%

        % 构建当前要加载的.mat文件名 (例如：average_betweenness_1.mat)
        matFile = fullfile(currentFolder, ['average_betweenness_', num2str(n), '.mat']); 

        % 检查.mat文件是否存在
        if exist(matFile, 'file')
            % 读取mat文件中的数据
            data = load(matFile);

            % 假设.mat文件中存储的变量名是averagebetweenness1、averagebetweenness2等
            % 根据n来动态访问不同的变量名
            varName = ['averagebetweenness', num2str(n)];
            if isfield(data, varName)
                % 将数据拼接到allData中
                allData = [allData; data.(varName)]; 
            else
                warning('文件 %s 中找不到变量 %s', matFile, varName);
            end
        else
            warning('文件 %s 不存在', matFile);
        end
    end

    % 保存拼接好的数据到新的.mat文件中
    outputFile = fullfile(outputDir, ['W_betweenness', num2str(n), '.mat']); %%%%%%
    save(outputFile, 'allData');
end