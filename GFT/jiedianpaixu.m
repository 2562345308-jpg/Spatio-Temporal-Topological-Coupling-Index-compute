clear;
clc;
% 文件路径和变量名称
a = 'ratio1';
b= 'R06';
filePaths = { ...
    ['G:\gft\' b '\' a '_betweenness1.mat'], ...
    ['G:\gft\' b '\' a '_betweenness2.mat'], ...
    ['G:\gft\' b '\' a '_betweenness3.mat'], ...
    ['G:\gft\' b '\' a '_betweenness4.mat'], ...
    ['G:\gft\' b '\' a '_betweenness5.mat'], ...
    ['G:\gft\' b '\' a '_betweenness6.mat'], ...
    ['G:\gft\' b '\' a '_betweenness7.mat'], ...
    ['G:\gft\' b '\' a '_betweenness8.mat'], ...
    ['G:\gft\' b '\' a '_betweenness9.mat'], ...
    ['G:\gft\' b '\' a '_betweenness10.mat'], ...
    ['G:\gft\' b '\' a '_betweenness11.mat'], ...
    ['G:\gft\' b '\' a '_betweenness12.mat'], ...
    ['G:\gft\' b '\' a '_betweenness13.mat'], ...
    ['G:\gft\' b '\' a '_betweenness14.mat'] ...
};
variableNames = {a, a, a, a, a, a, a, a, a, a, a, a, a, a};
variableNums = {[a '_betweenness1'], [a '_betweenness2'], [a '_betweenness3'],...
    [a '_betweenness4'], [a '_betweenness5'], [a '_betweenness6'],...
    [a '_betweenness7'], [a '_betweenness8'],[a '_betweenness9'],...
    [a '_betweenness10'],[a '_betweenness11'], [a '_betweenness12'],[a '_betweenness13'], [a '_betweenness14']};
% 初始化数据存储
data = cell(1, numel(filePaths));
medians = zeros(1, numel(filePaths));

% 读取数据和计算中位数
for i = 1:numel(filePaths)
    % 加载 .mat 文件中的数据
    temp = load(filePaths{i});
    
    % 提取特定变量
    ratioData = temp.(variableNames{i});
    ratioData = log(ratioData);
    
    % 剔除异常值
    Q1 = quantile(ratioData, 0.25);
    Q3 = quantile(ratioData, 0.75);
    IQR = Q3 - Q1;
    lowerBound = Q1 - 1.5 * IQR;
    upperBound = Q3 + 1.5 * IQR;
    ratioData = ratioData(ratioData >= lowerBound & ratioData <= upperBound);
    
    % 存储剔除异常值后的数据
    data{i} = ratioData;
    
    % 计算中位数
    medians(i) = median(ratioData);
end

% 按照中位数从大到小排序数据
[~, sortedIndices] = sort(medians, 'descend');
sortedData = data(sortedIndices);
sortedLabels = variableNums(sortedIndices);

% 确定最大数据长度
maxLength = max(cellfun(@numel, sortedData));

% 创建一个矩阵用于存储数据，短的用NaN填充
groupedData = nan(maxLength, numel(sortedData));
for i = 1:numel(sortedData)
    groupedData(1:numel(sortedData{i}), i) = sortedData{i};
end

% 绘制箱型图
figure;
boxplot(groupedData, 'Labels', sortedLabels);
title('Boxplot of Ratio Data with Outliers Removed');
xlabel('Ratio');
ylabel('Ratio Values');

% 设置目录路径
baseDir = 'G:\gft\R06';%%%

% 初始化参数
x1 = [];
x2 = [];
x3 = [];
x4 = [];
x5 = [];
x6 = [];
x7 = [];
x8 = [];
x9 = [];
x10 = [];
x11 = [];
x12 = [];
x13 = [];
x14 = [];

matFile1 = load(fullfile(baseDir, 'ratio1_betweenness1.mat'));
matFile2 = load(fullfile(baseDir, 'ratio1_betweenness2.mat'));
matFile3 = load(fullfile(baseDir, 'ratio1_betweenness3.mat'));
matFile4 = load(fullfile(baseDir, 'ratio1_betweenness4.mat'));
matFile5 = load(fullfile(baseDir, 'ratio1_betweenness5.mat'));
matFile6 = load(fullfile(baseDir, 'ratio1_betweenness6.mat'));
matFile7 = load(fullfile(baseDir, 'ratio1_betweenness7.mat'));
matFile8 = load(fullfile(baseDir, 'ratio1_betweenness8.mat'));
matFile9 = load(fullfile(baseDir, 'ratio1_betweenness9.mat'));
matFile10 = load(fullfile(baseDir, 'ratio1_betweenness10.mat'));
matFile11 = load(fullfile(baseDir, 'ratio1_betweenness11.mat'));
matFile12 = load(fullfile(baseDir, 'ratio1_betweenness12.mat'));
matFile13 = load(fullfile(baseDir, 'ratio1_betweenness13.mat'));
matFile14 = load(fullfile(baseDir, 'ratio1_betweenness14.mat'));


x1 = matFile1.ratio1;
x2 = matFile2.ratio1;
x3 = matFile3.ratio1;
x4 = matFile4.ratio1;
x5 = matFile5.ratio1;
x6 = matFile6.ratio1;
x7 = matFile7.ratio1;
x8 = matFile8.ratio1;
x9 = matFile9.ratio1;
x10 = matFile10.ratio1;
x11 = matFile11.ratio1;
x12 = matFile12.ratio1;
x13 = matFile13.ratio1;
x14 = matFile14.ratio1;
x1 = log(x1);
x2 = log(x2);
x3 = log(x3);
x4 = log(x4);
x5 = log(x5);
x6 = log(x6);
x7 = log(x7);
x8 = log(x8);
x9 = log(x9);
x10 = log(x10);
x11 = log(x11);
x12 = log(x12);
x13 = log(x13);
x14 = log(x14);

% 执行Friedman检验
if ~isempty(x1) && ~isempty(x2) && ~isempty(x3)&& ~isempty(x4) && ~isempty(x5)...
    && ~isempty(x6)&& ~isempty(x7)&& ~isempty(x8)&& ~isempty(x9)&& ~isempty(x10)...
    && ~isempty(x11)&& ~isempty(x12)&& ~isempty(x13)&& ~isempty(x14)
    x1(isnan(x1)) = 0;
    x2(isnan(x2)) = 0;
    x3(isnan(x3)) = 0;
    x4(isnan(x4)) = 0;
    x5(isnan(x5)) = 0;
    x6(isnan(x6)) = 0;
    x7(isnan(x7)) = 0;
    x8(isnan(x8)) = 0;
    x9(isnan(x9)) = 0;
    x10(isnan(x10)) = 0;
    x11(isnan(x11)) = 0;
    x12(isnan(x12)) = 0;
    x13(isnan(x13)) = 0;
    x14(isnan(x14)) = 0;
    
    data11 = [x1', x2', x3', x4', x5', x6', x7', x8', x9', x10', x11', x12', x13', x14'];
    [p, ~, stats] = friedman(data11, 1, 'off');
    
    fprintf('Friedman Test:\n');
    fprintf('P-value = %.4f\n', p);
end

% Initialize p-values matrix
p_values = zeros(1, nchoosek(14, 2));

% Compute p-values for all pairs
index = 1;
for i = 1:14
    for j = i+1:14
        eval(sprintf('[p%d%d, ~, ~] = signrank(x%d, x%d);', i, j, i, j));
        p_values(index) = eval(sprintf('p%d%d', i, j));
        index = index + 1;
    end
end

% Display p-values
fprintf('\nSigned Rank TestG9:\n');%%%
index = 1;
for i = 1:14
    for j = i+1:14
        fprintf('P-value for x%d vs x%d = %.4f\n', i, j, p_values(index));
        index = index + 1;
    end
end

% Perform multiple comparison correction
q_values = mafdr(p_values, 'BHFDR', true);

% Display q-values
fprintf('%.4f\n', q_values);

% Initialize A matrix
A = ones(14, 14);

% Populate A matrix with q-values
index = 1;
for i = 1:14
    for j = i+1:14
        A(i, j) = roundn(q_values(index), -4);
        index = index + 1;
    end
end
