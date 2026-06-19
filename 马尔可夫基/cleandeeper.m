clear;
clc;
% 1. 读取文件夹E:\processed_data\V_part\G0下所有.mat文件
fileFolder = 'G:\Markov\R06';
matFiles = dir(fullfile(fileFolder, '*.mat'));

% 2. 对于每一个文件，读取变量selected_data下的description的每一个数据
for i = 1:length(matFiles)
    % 读取.mat文件
    currentFile = fullfile(fileFolder, matFiles(i).name);
    load(currentFile);  % 假设.mat文件中有一个变量selected_data
    
    % 读取description的每一个数据
    descriptions = selected_data.description;
    
    % 初始化新的数组，用于存储去重后的数据
    unique_descriptions = {descriptions{1}};
    
    % 3. 如果当前数据跟上一个数据一样，则删除上一个数据
    for j = 2:length(descriptions)
        if ~strcmp(descriptions{j}, descriptions{j-1})
            unique_descriptions = [unique_descriptions, descriptions{j}];
        end
    end
    
    % 更新selected_data中的description
    selected_data = unique_descriptions;
    
    % 4. 数据保存为.mat文件，保存在E:\processed_data\X_part\G0下
    saveFolder = 'G:\Markov\re\R06';
    [~, fileName, ~] = fileparts(matFiles(i).name);

    % 转置selected_data，确保保存为列向量
    selected_data = selected_data';

    % 保存.mat文件
    save(fullfile(saveFolder, [fileName '_processed.mat']), 'selected_data');
end
