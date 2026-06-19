clear;
clc;
% 输入和输出的基本路径
inputBasePath = 'G:\Matrixparameter\G1\1846_19132';%%%%%



    inputSubdirPath = fullfile(inputBasePath);
    
    % 查找"Sleep stage N1_"文件夹和"results"文件夹
    sleepStageN1Path = fullfile(inputSubdirPath, 'Sleep stage W_');%%%%%
    resultsPath = fullfile(sleepStageN1Path, 'results');
    
    if exist(resultsPath, 'dir')
        % 查找以"assortativity"结尾的.mat文件
        matFiles = dir(fullfile(resultsPath, '*efficiency.mat'));
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            efficiencyValues = [];
            for j = 1:length(matFiles)
                matFilePath = fullfile(matFiles(j).folder, matFiles(j).name);
                data = load(matFilePath);
                efficiencyValues = [efficiencyValues, data.efficiency]; % 假设.mat文件中的数据在字段"assortativity"中
            end
            
            % 计算平均值
            averageEfficiency = mean(efficiencyValues);

        end
    end

