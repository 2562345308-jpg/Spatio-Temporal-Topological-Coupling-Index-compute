clear;
clc;
% 文件路径和变量名称
a = 'ratio5';
b= 'R06';
filePaths = { ...
    ['G:\SGWT1\' b '\' a '_pagerankness1.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness2.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness3.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness4.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness5.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness6.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness7.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness8.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness9.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness10.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness11.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness12.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness13.mat'], ...
    ['G:\SGWT1\' b '\' a '_pagerankness14.mat'] ...
};
variableNames = {a, a, a, a, a, a, a, a, a, a, a, a, a, a};
variableNums = {[a '_pagerankness1'], [a '_pagerankness2'], [a '_pagerankness3'],...
    [a '_pagerankness4'], [a '_pagerankness5'], [a '_pagerankness6'],...
    [a '_pagerankness7'], [a '_pagerankness8'],[a '_pagerankness9'],...
    [a '_pagerankness10'],[a '_pagerankness11'], [a '_pagerankness12'],[a '_pagerankness13'], [a '_pagerankness14']};
% 初始化数据存储
data = cell(1, numel(filePaths));
medians = zeros(1, numel(filePaths));

% 读取数据和计算中位数
for i = 1:numel(filePaths)
    % 加载 .mat 文件中的数据
    temp = load(filePaths{i});
    
    % 提取特定变量
    ratioData = temp.(variableNames{i});
    
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
