clear;

clc;
% 输入和输出的基本路径
inputBasePath = 'E:\processed_data\K4_part\G3';%%%
outputBasePath = 'E:\processed_data\T4_part\G3';%%%

% 获取所有子目录
subdirs = dir(inputBasePath);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'

for i = 1:length(subdirs)
    subdirName = subdirs(i).name;
    inputSubdirPath = fullfile(inputBasePath, subdirName);
    
    % 查找"Sleep stage N1_"文件夹和"results"文件夹
    sleepStageN1Path = fullfile(inputSubdirPath, 'Sleep stage N2_');%%%
    resultsPath = fullfile(sleepStageN1Path, 'results');
    
    if exist(resultsPath, 'dir')
        % 查找以"assortativity"结尾的.mat文件
        matFiles = dir(fullfile(resultsPath, '*GErout.mat'));
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            GEroutValues = [];
            for j = 1:length(matFiles)
                matFilePath = fullfile(matFiles(j).folder, matFiles(j).name);
                data = load(matFilePath);

                if ~isnan(data.GErout)
                     GEroutValues = [GEroutValues data.GErout];
                end     
            end
            
            % 计算平均值
            averageGErout = mean(GEroutValues);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage N2_', 'results');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_GErout.mat'));
            save(outputFilePath, 'averageGErout');
        end
    end
end
