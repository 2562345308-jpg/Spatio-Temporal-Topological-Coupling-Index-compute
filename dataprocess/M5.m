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
        matFiles = dir(fullfile(resultsPath, '*clustering.mat'));
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            clusteringValues1 = [];
            clusteringValues2 = [];
            clusteringValues3 = [];
            clusteringValues4 = [];
            clusteringValues5 = [];
            clusteringValues6 = [];
            clusteringValues7 = [];
            clusteringValues8 = [];
            clusteringValues9 = [];
            clusteringValues10 = [];
            clusteringValues11 = [];
            clusteringValues12 = [];
            clusteringValues13 = [];
            clusteringValues14 = [];
            
            b1 = [];
            b2 = [];
            b3 = [];
            b4 = [];
            b5 = [];
            b6 = [];
            b7 = [];
            b8 = [];
            b9 = [];
            b10 = [];
            b11 = [];
            b12 = [];
            b13 = [];
            b14 = [];
            for j = 1:length(matFiles)
                matFilePath = fullfile(matFiles(j).folder, matFiles(j).name);
                data = load(matFilePath);
                a1 = [];
                for k = 1:length(data.clustering)
                    if ~isnan(data.clustering(k))
                        a1 = [a1 data.clustering(k)];
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
                b9 = a1(9);
                b10 = a1(10);
                b11 = a1(11);
                b12 = a1(12);
                b13 = a1(13);
                b14 = a1(14);
                clusteringValues1 = [clusteringValues1, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                clusteringValues2 = [clusteringValues2, b2];
                clusteringValues3 = [clusteringValues3, b3];
                clusteringValues4 = [clusteringValues4, b4];
                clusteringValues5 = [clusteringValues5, b5];
                clusteringValues6 = [clusteringValues6, b6];
                clusteringValues7 = [clusteringValues7, b7];
                clusteringValues8 = [clusteringValues8, b8];
                clusteringValues9 = [clusteringValues9, b9];
                clusteringValues10 = [clusteringValues10, b10];
                clusteringValues11 = [clusteringValues11, b11];
                clusteringValues12 = [clusteringValues12, b12];
                clusteringValues13 = [clusteringValues13, b13];
                clusteringValues14 = [clusteringValues14, b14];
            end
            
            % 计算平均值
            averageclustering1 = mean(clusteringValues1);
            averageclustering2 = mean(clusteringValues2);
            averageclustering3 = mean(clusteringValues3);
            averageclustering4 = mean(clusteringValues4);
            averageclustering5 = mean(clusteringValues5);
            averageclustering6 = mean(clusteringValues6);
            averageclustering7 = mean(clusteringValues7);
            averageclustering8 = mean(clusteringValues8);
            averageclustering9 = mean(clusteringValues9);
            averageclustering10 = mean(clusteringValues10);
            averageclustering11 = mean(clusteringValues11);
            averageclustering12 = mean(clusteringValues12);
            averageclustering13 = mean(clusteringValues13);
            averageclustering14 = mean(clusteringValues14);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_1.mat'));%%%
            save(outputFilePath, 'averageclustering1');
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
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_9.mat'));%%%
            save(outputFilePath, 'averageclustering9');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_10.mat'));%%%
            save(outputFilePath, 'averageclustering10');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_11.mat'));%%%
            save(outputFilePath, 'averageclustering11');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_12.mat'));%%%
            save(outputFilePath, 'averageclustering12');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_13.mat'));%%%
            save(outputFilePath, 'averageclustering13');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_clustering_14.mat'));%%%
            save(outputFilePath, 'averageclustering14');
        end
    end
end
