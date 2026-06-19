clear;
clc;
% Initialize arrays to store assortativity values
x0 = [];

x2 = [];
x3 = [];

x8 = [];
x9 = [];

% Directory paths
baseDir = 'E:\processed_data\T_part\';
subDirs = {'G0', 'G2', 'G3', 'G8', 'G9'};
%subDirs = {'G0', 'G1', 'G2', 'G3', 'G5', 'G6', 'G8', 'G9'};
filePattern = 'average_efficiency.mat';%%%%

% Loop through different groups
for groupIdx = 1:length(subDirs)
    groupDir = fullfile(baseDir, subDirs{groupIdx});
    
    % Find subdirectories with 'Sleep stage N1_' in their names
    subSubDirs = dir(fullfile(groupDir, '*/Sleep stage W_'));%%%%%
    
    % Loop through sub-subdirectories
    for subSubDirIdx = 1:length(subSubDirs)
        resultsDir = fullfile(subSubDirs(subSubDirIdx).folder, subSubDirs(subSubDirIdx).name, 'results');
        
        % Check if 'average_assortativity.mat' file exists
        matFiles = dir(fullfile(resultsDir, filePattern));
        if ~isempty(matFiles)
            matFilePath = fullfile(matFiles(1).folder, matFiles(1).name);
            EfficiencyData = load(matFilePath);
            EfficiencyValue = EfficiencyData.averageEfficiency;%%%%%%%
            
            % Add assortativity value to the respective group's array
            switch groupIdx
                case 1
                    x0 = [x0, EfficiencyValue];
                case 2
                    x2 = [x2, EfficiencyValue];
                case 3
                    x3 = [x3, EfficiencyValue];
                case 4
                    x8 = [x8, EfficiencyValue];
                case 5
                    x9 = [x9, EfficiencyValue];
            end
        end
    end
end
%data = {x0; x1; x2; x3; x5; x6; x8};

data = [x0'; x2'; x3'; x8'; x9']; % 将每个样本组的数据存储在矩阵中
g0=repmat({'x0'},size(x0));

g2=repmat({'x2'},size(x2));
g3=repmat({'x3'},size(x3));

g8=repmat({'x8'},size(x8));
g9=repmat({'x9'},size(x9));
group=[g0';g2';g3';g8';g9'];
[p_kw, tbl, stats_kw] = kruskalwallis(data,group); % 将矩阵作为参数传递给函数
disp('Kruskal-Wallis Test Results:');
disp(tbl);
fprintf('H statistic: %.4f\n', tbl{2, 5});
fprintf('p-value: %.4f\n', p_kw);





