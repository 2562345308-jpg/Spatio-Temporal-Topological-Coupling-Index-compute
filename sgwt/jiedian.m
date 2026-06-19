clear;
clc;
% 文件路径和变量名称
a = 'ratio5';
b= 'R06';
filePaths = { ...
    ['G:\SGWT1\' b '\' a '_betweenness1.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness2.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness3.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness4.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness5.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness6.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness7.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness8.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness9.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness10.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness11.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness12.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness13.mat'], ...
    ['G:\SGWT1\' b '\' a '_betweenness14.mat'] ...
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

% % 创建一个矩阵用于存储数据，短的用NaN填充
% groupedData = nan(maxLength, numel(sortedData));
% for i = 1:numel(sortedData)
%     groupedData(1:numel(sortedData{i}), i) = sortedData{i};
% end
% 
% % 绘制箱型图
% figure;
% boxplot(groupedData, 'Labels', sortedLabels);
% title('Boxplot of Ratio Data with Outliers Removed');
% xlabel('Ratio');
% ylabel('Ratio Values');
