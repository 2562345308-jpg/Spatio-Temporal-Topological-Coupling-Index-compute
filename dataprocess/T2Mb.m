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
        matFiles = dir(fullfile(resultsPath, '*betweennessCentrality.mat'));
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            betweennessValues1 = [];
            betweennessValues2 = [];
            betweennessValues3 = [];
            betweennessValues4 = [];
            betweennessValues5 = [];
            betweennessValues6 = [];
            betweennessValues7 = [];
            betweennessValues8 = [];
            betweennessValues9 = [];
            betweennessValues10 = [];
            betweennessValues11 = [];
            betweennessValues12 = [];
            betweennessValues13 = [];
            betweennessValues14 = [];
            
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
                for k = 1:length(data.betweennessCentrality)
                    if ~isnan(data.betweennessCentrality(k))
                        a1 = [a1 data.betweennessCentrality(k)];
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
                betweennessValues1 = [betweennessValues1, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                betweennessValues2 = [betweennessValues2, b2];
                betweennessValues3 = [betweennessValues3, b3];
                betweennessValues4 = [betweennessValues4, b4];
                betweennessValues5 = [betweennessValues5, b5];
                betweennessValues6 = [betweennessValues6, b6];
                betweennessValues7 = [betweennessValues7, b7];
                betweennessValues8 = [betweennessValues8, b8];
                betweennessValues9 = [betweennessValues9, b9];
                betweennessValues10 = [betweennessValues10, b10];
                betweennessValues11 = [betweennessValues11, b11];
                betweennessValues12 = [betweennessValues12, b12];
                betweennessValues13 = [betweennessValues13, b13];
                betweennessValues14 = [betweennessValues14, b14];
            end
            
            % 计算平均值
            averagebetweenness1 = mean(betweennessValues1);
            averagebetweenness2 = mean(betweennessValues2);
            averagebetweenness3 = mean(betweennessValues3);
            averagebetweenness4 = mean(betweennessValues4);
            averagebetweenness5 = mean(betweennessValues5);
            averagebetweenness6 = mean(betweennessValues6);
            averagebetweenness7 = mean(betweennessValues7);
            averagebetweenness8 = mean(betweennessValues8);
            averagebetweenness9 = mean(betweennessValues9);
            averagebetweenness10 = mean(betweennessValues10);
            averagebetweenness11 = mean(betweennessValues11);
            averagebetweenness12 = mean(betweennessValues12);
            averagebetweenness13 = mean(betweennessValues13);
            averagebetweenness14 = mean(betweennessValues14);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_1.mat'));%%%
            save(outputFilePath, 'averagebetweenness1');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_2.mat'));%%%
            save(outputFilePath, 'averagebetweenness2');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_3.mat'));%%%
            save(outputFilePath, 'averagebetweenness3');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_4.mat'));%%%
            save(outputFilePath, 'averagebetweenness4');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_5.mat'));%%%
            save(outputFilePath, 'averagebetweenness5');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_6.mat'));%%%
            save(outputFilePath, 'averagebetweenness6');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_7.mat'));%%%
            save(outputFilePath, 'averagebetweenness7');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_8.mat'));%%%
            save(outputFilePath, 'averagebetweenness8');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_9.mat'));%%%
            save(outputFilePath, 'averagebetweenness9');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_10.mat'));%%%
            save(outputFilePath, 'averagebetweenness10');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_11.mat'));%%%
            save(outputFilePath, 'averagebetweenness11');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_12.mat'));%%%
            save(outputFilePath, 'averagebetweenness12');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_13.mat'));%%%
            save(outputFilePath, 'averagebetweenness13');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_betweenness_14.mat'));%%%
            save(outputFilePath, 'averagebetweenness14');
        end
    end
end
