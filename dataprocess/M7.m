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
        matFiles = dir(fullfile(resultsPath, '*Eloc.mat'));%%%
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            ElocValues1 = [];
            ElocValues2 = [];
            ElocValues3 = [];
            ElocValues4 = [];
            ElocValues5 = [];
            ElocValues6 = [];
            ElocValues7 = [];
            ElocValues8 = [];
            ElocValues9 = [];
            ElocValues10 = [];
            ElocValues11 = [];
            ElocValues12 = [];
            ElocValues13 = [];
            ElocValues14 = [];
            
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
                for k = 1:length(data.eloc)
                    if ~isnan(data.eloc(k))
                        a1 = [a1 data.eloc(k)];
                    else
                        a1 = [a1 0];
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
                ElocValues1 = [ElocValues1, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                ElocValues2 = [ElocValues2, b2];
                ElocValues3 = [ElocValues3, b3];
                ElocValues4 = [ElocValues4, b4];
                ElocValues5 = [ElocValues5, b5];
                ElocValues6 = [ElocValues6, b6];
                ElocValues7 = [ElocValues7, b7];
                ElocValues8 = [ElocValues8, b8];
                ElocValues9 = [ElocValues9, b9];
                ElocValues10 = [ElocValues10, b10];
                ElocValues11 = [ElocValues11, b11];
                ElocValues12 = [ElocValues12, b12];
                ElocValues13 = [ElocValues13, b13];
                ElocValues14 = [ElocValues14, b14];
            end
            
            % 计算平均值
            averageEloc1 = mean(ElocValues1);
            averageEloc2 = mean(ElocValues2);
            averageEloc3 = mean(ElocValues3);
            averageEloc4 = mean(ElocValues4);
            averageEloc5 = mean(ElocValues5);
            averageEloc6 = mean(ElocValues6);
            averageEloc7 = mean(ElocValues7);
            averageEloc8 = mean(ElocValues8);
            averageEloc9 = mean(ElocValues9);
            averageEloc10 = mean(ElocValues10);
            averageEloc11 = mean(ElocValues11);
            averageEloc12 = mean(ElocValues12);
            averageEloc13 = mean(ElocValues13);
            averageEloc14 = mean(ElocValues14);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath1 = fullfile(outputSubdirPath, sprintf('average_Eloc_1.mat'));%%%
            save(outputFilePath1, 'averageEloc1');
            outputFilePath2 = fullfile(outputSubdirPath, sprintf('average_Eloc_2.mat'));%%%
            save(outputFilePath2, 'averageEloc2');
            outputFilePath3 = fullfile(outputSubdirPath, sprintf('average_Eloc_3.mat'));%%%
            save(outputFilePath3, 'averageEloc3');
            outputFilePath4 = fullfile(outputSubdirPath, sprintf('average_Eloc_4.mat'));%%%
            save(outputFilePath4, 'averageEloc4');
            outputFilePath5 = fullfile(outputSubdirPath, sprintf('average_Eloc_5.mat'));%%%
            save(outputFilePath5, 'averageEloc5');
            outputFilePath6 = fullfile(outputSubdirPath, sprintf('average_Eloc_6.mat'));%%%
            save(outputFilePath6, 'averageEloc6');
            outputFilePath7 = fullfile(outputSubdirPath, sprintf('average_Eloc_7.mat'));%%%
            save(outputFilePath7, 'averageEloc7');
            outputFilePath8 = fullfile(outputSubdirPath, sprintf('average_Eloc_8.mat'));%%%
            save(outputFilePath8, 'averageEloc8');
            outputFilePath9 = fullfile(outputSubdirPath, sprintf('average_Eloc_9.mat'));%%%
            save(outputFilePath9, 'averageEloc9');
            outputFilePath10 = fullfile(outputSubdirPath, sprintf('average_Eloc_10.mat'));%%%
            save(outputFilePath10, 'averageEloc10');
            outputFilePath11 = fullfile(outputSubdirPath, sprintf('average_Eloc_11.mat'));%%%
            save(outputFilePath11, 'averageEloc11');
            outputFilePath12 = fullfile(outputSubdirPath, sprintf('average_Eloc_12.mat'));%%%
            save(outputFilePath12, 'averageEloc12');
            outputFilePath13 = fullfile(outputSubdirPath, sprintf('average_Eloc_13.mat'));%%%
            save(outputFilePath13, 'averageEloc13');
            outputFilePath14 = fullfile(outputSubdirPath, sprintf('average_Eloc_14.mat'));%%%
            save(outputFilePath14, 'averageEloc14');
        end
    end
end
