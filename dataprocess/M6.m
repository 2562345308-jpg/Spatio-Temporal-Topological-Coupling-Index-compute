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
        matFiles = dir(fullfile(resultsPath, '*participation.mat'));%%%
        
        if ~isempty(matFiles)
            % 读取并计算.mat文件中的数据
            participationValues1 = [];
            participationValues2 = [];
            participationValues3 = [];
            participationValues4 = [];
            participationValues5 = [];
            participationValues6 = [];
            participationValues7 = [];
            participationValues8 = [];
            
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
                for k = 1:length(data.participation)
                    if ~isnan(data.participation(k))
                        a1 = [a1 data.participation(k)];
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
                participationValues1 = [participationValues1, b1]; % 假设.mat文件中的数据在字段"assortativity"中
                participationValues2 = [participationValues2, b2];
                participationValues3 = [participationValues3, b3];
                participationValues4 = [participationValues4, b4];
                participationValues5 = [participationValues5, b5];
                participationValues6 = [participationValues6, b6];
                participationValues7 = [participationValues7, b7];
                participationValues8 = [participationValues8, b8];
            end
            
            % 计算平均值
            averageparticipation1 = mean(participationValues1);
            averageparticipation2 = mean(participationValues2);
            averageparticipation3 = mean(participationValues3);
            averageparticipation4 = mean(participationValues4);
            averageparticipation5 = mean(participationValues5);
            averageparticipation6 = mean(participationValues6);
            averageparticipation7 = mean(participationValues7);
            averageparticipation8 = mean(participationValues8);
            
            % 创建输出文件夹
            outputSubdirPath = fullfile(outputBasePath, subdirName, 'Sleep stage W_', 'results');%%%
            if ~exist(outputSubdirPath, 'dir')
                mkdir(outputSubdirPath);
            end
            
            % 保存平均值为.mat文件
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_1.mat'));%%%
            save(outputFilePath, 'averageparticipation1');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_2.mat'));%%%
            save(outputFilePath, 'averageparticipation2');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_3.mat'));%%%
            save(outputFilePath, 'averageparticipation3');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_4.mat'));%%%
            save(outputFilePath, 'averageparticipation4');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_5.mat'));%%%
            save(outputFilePath, 'averageparticipation5');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_6.mat'));%%%
            save(outputFilePath, 'averageparticipation6');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_7.mat'));%%%
            save(outputFilePath, 'averageparticipation7');
            outputFilePath = fullfile(outputSubdirPath, sprintf('average_participation_8.mat'));%%%
            save(outputFilePath, 'averageparticipation8');
        end
    end
end
