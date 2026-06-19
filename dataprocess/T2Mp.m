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
        matFiles = dir(fullfile(resultsPath, '*pageranknessCentrality.mat'));
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            pageranknessValues1 = [];
            pageranknessValues2 = [];
            pageranknessValues3 = [];
            pageranknessValues4 = [];
            pageranknessValues5 = [];
            pageranknessValues6 = [];
            pageranknessValues7 = [];
            pageranknessValues8 = [];
            pageranknessValues9 = [];
            pageranknessValues10 = [];
            pageranknessValues11 = [];
            pageranknessValues12 = [];
            pageranknessValues13 = [];
            pageranknessValues14 = [];
            
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
                for k = 1:length(data.pageranknessCentrality)
                    if ~isnan(data.pageranknessCentrality(k))
                        a1 = [a1 data.pageranknessCentrality(k)];
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
                pageranknessValues1 = [pageranknessValues1, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                pageranknessValues2 = [pageranknessValues2, b2];
                pageranknessValues3 = [pageranknessValues3, b3];
                pageranknessValues4 = [pageranknessValues4, b4];
                pageranknessValues5 = [pageranknessValues5, b5];
                pageranknessValues6 = [pageranknessValues6, b6];
                pageranknessValues7 = [pageranknessValues7, b7];
                pageranknessValues8 = [pageranknessValues8, b8];
                pageranknessValues9 = [pageranknessValues9, b9];
                pageranknessValues10 = [pageranknessValues10, b10];
                pageranknessValues11 = [pageranknessValues11, b11];
                pageranknessValues12 = [pageranknessValues12, b12];
                pageranknessValues13 = [pageranknessValues13, b13];
                pageranknessValues14 = [pageranknessValues14, b14];
            end
            
            % 计算平均值
            averagepagerankness1 = mean(pageranknessValues1);
            averagepagerankness2 = mean(pageranknessValues2);
            averagepagerankness3 = mean(pageranknessValues3);
            averagepagerankness4 = mean(pageranknessValues4);
            averagepagerankness5 = mean(pageranknessValues5);
            averagepagerankness6 = mean(pageranknessValues6);
            averagepagerankness7 = mean(pageranknessValues7);
            averagepagerankness8 = mean(pageranknessValues8);
            averagepagerankness9 = mean(pageranknessValues9);
            averagepagerankness10 = mean(pageranknessValues10);
            averagepagerankness11 = mean(pageranknessValues11);
            averagepagerankness12 = mean(pageranknessValues12);
            averagepagerankness13 = mean(pageranknessValues13);
            averagepagerankness14 = mean(pageranknessValues14);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_1.mat'));%%%
            save(outputFilePath, 'averagepagerankness1');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_2.mat'));%%%
            save(outputFilePath, 'averagepagerankness2');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_3.mat'));%%%
            save(outputFilePath, 'averagepagerankness3');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_4.mat'));%%%
            save(outputFilePath, 'averagepagerankness4');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_5.mat'));%%%
            save(outputFilePath, 'averagepagerankness5');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_6.mat'));%%%
            save(outputFilePath, 'averagepagerankness6');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_7.mat'));%%%
            save(outputFilePath, 'averagepagerankness7');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_8.mat'));%%%
            save(outputFilePath, 'averagepagerankness8');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_9.mat'));%%%
            save(outputFilePath, 'averagepagerankness9');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_10.mat'));%%%
            save(outputFilePath, 'averagepagerankness10');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_11.mat'));%%%
            save(outputFilePath, 'averagepagerankness11');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_12.mat'));%%%
            save(outputFilePath, 'averagepagerankness12');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_13.mat'));%%%
            save(outputFilePath, 'averagepagerankness13');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_pagerankness_14.mat'));%%%
            save(outputFilePath, 'averagepagerankness14');
        end
    end
end
