clear;
clc;
% Initialize arrays to store assortativity values

x2 = [];
x3 = [];
x8 = [];
x06= [];

% Directory paths
baseDir = 'G:\Meanparameter\';
subDirs = {'G2', 'G3', 'G8', 'R06'};
filePattern = 'average_efficiency.mat';%%%%

% Loop through different groups
for groupIdx = 1:length(subDirs)
    groupDir = fullfile(baseDir, subDirs{groupIdx});
    
    % Find subdirectories with 'Sleep stage N1_' in their names
    subSubDirs = dir(fullfile(groupDir, '*/Sleep stage W_'));%%%%%
    
    % Loop through sub-subdirectories
    for subSubDirIdx = 1:length(subSubDirs)
        resultsDir = fullfile(subSubDirs(subSubDirIdx).folder, subSubDirs(subSubDirIdx).name);
        
        % Check if 'average_assortativity.mat' file exists
        matFiles = dir(fullfile(resultsDir, filePattern));
        if ~isempty(matFiles)
            matFilePath = fullfile(matFiles(1).folder, matFiles(1).name);
            EfficiencyData = load(matFilePath);
            EfficiencyValue = EfficiencyData.averageEfficiency;%%%%%%%
            
            % Add assortativity value to the respective group's array
            switch groupIdx
                
                case 1
                    x2 = [x2, EfficiencyValue];
                case 2
                    x3 = [x3, EfficiencyValue];
                case 3
                    x8 = [x8, EfficiencyValue];
                case 4
                    x06 = [x06, EfficiencyValue];
            end
        end
    end
end
Q1 = quantile(x2, 0.25);
Q3 = quantile(x2, 0.75);
IQR = Q3 - Q1;
lowerBound = Q1 - 1.5 * IQR;
upperBound = Q3 + 1.5 * IQR;
x2 = x2(x2 >= lowerBound & x2 <= upperBound);

Q1 = quantile(x3, 0.25);
Q3 = quantile(x3, 0.75);
IQR = Q3 - Q1;
lowerBound = Q1 - 1.5 * IQR;
upperBound = Q3 + 1.5 * IQR;
x3 = x3(x3 >= lowerBound & x3 <= upperBound);

Q1 = quantile(x8, 0.25);
Q3 = quantile(x8, 0.75);
IQR = Q3 - Q1;
lowerBound = Q1 - 1.5 * IQR;
upperBound = Q3 + 1.5 * IQR;
x8 = x8(x8 >= lowerBound & x8 <= upperBound);

Q1 = quantile(x06, 0.25);
Q3 = quantile(x06, 0.75);
IQR = Q3 - Q1;
lowerBound = Q1 - 1.5 * IQR;
upperBound = Q3 + 1.5 * IQR;
x06 = x06(x06 >= lowerBound & x06 <= upperBound);
    
A = ones(4,4);
[p_ranksum] = ranksum(x2, x3);
A(1,2) = roundn(p_ranksum,-4);
fprintf('Ranksum Test between x2 and x3:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x2, x8);
A(1,3) = roundn(p_ranksum,-4);
fprintf('Ranksum Test between x2 and x8:\n');
fprintf('p-value: %.4f\n', p_ranksum);
[p_ranksum] = ranksum(x2, x06);
A(1,4) = roundn(p_ranksum,-4);
fprintf('Ranksum Test between x2 and x06:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x3, x8);
A(2,3) = roundn(p_ranksum,-4);
fprintf('Ranksum Test between x3 and x8:\n');
fprintf('p-value: %.4f\n', p_ranksum);
[p_ranksum] = ranksum(x3, x06);
A(2,4) = roundn(p_ranksum,-4);
fprintf('Ranksum Test between x3 and x06:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x8, x06);
A(3,4) = roundn(p_ranksum,-4);
fprintf('Ranksum Test between x8 and x06:\n');
fprintf('p-value: %.4f\n', p_ranksum);

data = [x2'; x3'; x8'; x06']; % 将每个样本组的数据存储在矩阵中

g2=repmat({'x2'},size(x2));
g3=repmat({'x3'},size(x3));

g8=repmat({'x8'},size(x8));
g06=repmat({'x06'},size(x06));
group=[g2';g3';g8';g06'];
[p_kw, tbl, stats_kw] = kruskalwallis(data,group); % 将矩阵作为参数传递给函数
disp('Kruskal-Wallis Test Results:');
disp(tbl);
fprintf('H statistic: %.4f\n', tbl{2, 5});
fprintf('p-value: %.4f\n', p_kw);




