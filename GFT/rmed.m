clc;
clear;
% 定义文件夹路径
inputFolder = 'G:\gft\situation2\R06';
outputFolder = 'G:\gft\situation2\rmed';
sgwtFolder = 'G:\gft\R06';

% 创建保存结果的文件夹（如果不存在）
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% 获取输入文件夹下所有.mat文件
matFiles = dir(fullfile(inputFolder, '*.mat'));

% 遍历每个.mat文件
for i = 1:length(matFiles)
    % 获取原文件名和路径
    originalFile = matFiles(i).name;
    originalFilePath = fullfile(inputFolder, originalFile);

    % 修改文件名中的 'rmed1' 为 'ratio'
    newFileName = strrep(originalFile, 'rmed', 'ratio');

    % 读取 SGWT1 文件夹下对应的新文件
    sgwtFilePath = fullfile(sgwtFolder, newFileName);
    if ~isfile(sgwtFilePath)
        fprintf('文件 %s 不存在于 %s\n', newFileName, sgwtFolder);
        continue;
    end

    % 加载数据
    originalData = load(originalFilePath);
    sgwtData = load(sgwtFilePath);

    % 计算 SGWT 数据的中位数
    if isstruct(sgwtData)
        fields = fieldnames(sgwtData);
        sgwtValues = sgwtData.(fields{1}); % 假设数据存储在第一个字段中
    else
        sgwtValues = sgwtData; % 如果是直接数组
    end
    medianValue = median(sgwtValues(:)); % 计算所有数据的中位数

    % 保存中位数结果到新的文件
    outputFilePath = fullfile(outputFolder, newFileName);
    save(outputFilePath, 'medianValue');
end

disp('处理完成！');
