clear;

clc;
% 输入和输出的基本路径
inputBasePath = 'E:\processed_data\K_part\G9';%%%
outputBasePath = 'E:\processed_data\T_part\G9';%%%

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
        matFiles = dir(fullfile(resultsPath, '*str.mat'));%%%
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            strValues1 = [];
            strValues2 = [];
            strValues3 = [];
            strValues4 = [];
            strValues5 = [];
            strValues6 = [];
            strValues7 = [];
            strValues8 = [];
            
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
                for k = 1:length(data.str)
                    if ~isnan(data.str(k))
                        a1 = [a1 data.str(k)];
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
                strValues1 = [strValues1, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                strValues2 = [strValues2, b2];
                strValues3 = [strValues3, b3];
                strValues4 = [strValues4, b4];
                strValues5 = [strValues5, b5];
                strValues6 = [strValues6, b6];
                strValues7 = [strValues7, b7];
                strValues8 = [strValues8, b8];
            end
            
            % 计算平均值
            averagestr1 = mean(strValues1);
            averagestr2 = mean(strValues2);
            averagestr3 = mean(strValues3);
            averagestr4 = mean(strValues4);
            averagestr5 = mean(strValues5);
            averagestr6 = mean(strValues6);
            averagestr7 = mean(strValues7);
            averagestr8 = mean(strValues8);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_', 'results');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_1.mat'));%%%
            save(outputFilePath, 'averagestr1');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_2.mat'));%%%
            save(outputFilePath, 'averagestr2');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_3.mat'));%%%
            save(outputFilePath, 'averagestr3');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_4.mat'));%%%
            save(outputFilePath, 'averagestr4');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_5.mat'));%%%
            save(outputFilePath, 'averagestr5');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_6.mat'));%%%
            save(outputFilePath, 'averagestr6');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_7.mat'));%%%
            save(outputFilePath, 'averagestr7');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_str_8.mat'));%%%
            save(outputFilePath, 'averagestr8');
        end
    end
end
