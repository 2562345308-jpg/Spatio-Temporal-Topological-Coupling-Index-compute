clear;
clc;
% 输入和输出的基本路径
inputBasePath = 'G:\Matrixparameter\G1';%%%%%
outputBasePath = 'G:\Meanparameter\G1';%%%%%

% 获取所有子目录
subdirs = dir(inputBasePath);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'

for i = 1:length(subdirs)
    subdirName = subdirs(i).name;
    inputSubdirPath = fullfile(inputBasePath, subdirName);
    
    % 查找"Sleep stage N1_"文件夹和"results"文件夹
    sleepStageN1Path = fullfile(inputSubdirPath, 'Sleep stage W_');%%%
    resultsPath = fullfile(sleepStageN1Path, 'results');  
    if exist(resultsPath, 'dir')
        % 查找以"assortativity"结尾的.mat文件
        matFiles = dir(fullfile(resultsPath, '*richclub.mat'));        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            richclubValues = [];
            
            b1 = [];
            for j = 1:length(matFiles)
                matFilePath = fullfile(matFiles(j).folder, matFiles(j).name);
                data = load(matFilePath);
                a1 = [];
                for k = 1:length(data.richclub)
                    if ~isnan(data.richclub(k))
                        a1 = [a1 data.richclub(k)];
                    end     
                end
                b1 = mean(a1);
                if ~isnan(b1)
                    richclubValues = [richclubValues, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                end
            end         
            % 计算平均值
            averagerichclub = mean(richclubValues);          
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_richclub.mat'));
            save(outputFilePath, 'averagerichclub');
        end
    end
end
