clear;
clc;
% 输入和输出的基本路径
inputBasePath = 'E:\processed_data\K1_part\G9';%%%
outputBasePath = 'E:\processed_data\T1_part\G9';%%%

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
        matFiles = dir(fullfile(resultsPath, '*eloc.mat'));
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            elocValues1 = [];
            elocValues2 = [];
            elocValues3 = [];
            elocValues4 = [];
            elocValues5 = [];
            elocValues6 = [];
            elocValues7 = [];
            elocValues8 = [];
            
            b1 = [];
            b2 = [];
            b3 = [];
            b4 = [];
            b5 = [];
            b6 = [];
            b7 = [];
            b8 = [];
            for j = 1:length(matFiles)
                matFilePath = fullfile(matFiles(j).folder, matFiles(j).name);
                data = load(matFilePath);
                a1 = [];
                for k = 1:length(data.eloc)
                    if ~isnan(data.eloc(k))
                        a1 = [a1 data.eloc(k)];
                    end     
                end
                b1 = a1(1);
                b2 = a1(2);
                b3 = a1(3);
                b4 = a1(4);
                b5 = a1(5);
                b6 = a1(6);
                b7 = a1(7);
                b8 = a1(8);
                elocValues1 = [elocValues1, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                elocValues2 = [elocValues2, b2];
                elocValues3 = [elocValues3, b3];
                elocValues4 = [elocValues4, b4];
                elocValues5 = [elocValues5, b5];
                elocValues6 = [elocValues6, b6];
                elocValues7 = [elocValues7, b7];
                elocValues8 = [elocValues8, b8];
            end
            
            % 计算平均值
            averageeloc1 = mean(elocValues1);
            averageclustering2 = mean(elocValues2);
            averageclustering3 = mean(elocValues3);
            averageclustering4 = mean(elocValues4);
            averageclustering5 = mean(elocValues5);
            averageclustering6 = mean(elocValues6);
            averageclustering7 = mean(elocValues7);
            averageclustering8 = mean(elocValues8);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_', 'results');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_1.mat'));%%%
            save(outputFilePath, 'averageeloc1');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_2.mat'));%%%
            save(outputFilePath, 'averageclustering2');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_3.mat'));%%%
            save(outputFilePath, 'averageclustering3');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_4.mat'));%%%
            save(outputFilePath, 'averageclustering4');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_5.mat'));%%%
            save(outputFilePath, 'averageclustering5');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_6.mat'));%%%
            save(outputFilePath, 'averageclustering6');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_7.mat'));%%%
            save(outputFilePath, 'averageclustering7');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_8.mat'));%%%
            save(outputFilePath, 'averageclustering8');
        end
    end
end
