clear;
clc;
% 文件路径和变量名称
filePaths = { ...
    'G:\SGWT1\G2\ratio5_betweenness14.mat', ...
    'G:\SGWT1\G3\ratio5_betweenness14.mat', ...
    'G:\SGWT1\G8\ratio5_betweenness14.mat', ...
    'G:\SGWT1\R06\ratio5_betweenness14.mat', ...
};
variableNames = {'ratio5', 'ratio5', 'ratio5', 'ratio5'};
labelNames = {'G2ratio5', 'G3ratio5', 'G8ratio5', 'R06ratio5'};

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

    % % 存储剔除异常值后的数据
    data{i} = ratioData;
    
    % 计算中位数
    medians(i) = median(ratioData);
end

% 按照中位数从大到小排序数据
[~, sortedIndices] = sort(medians, 'descend');
sortedData = data(sortedIndices);
sortedLabels = labelNames(sortedIndices);

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

x1 = data{1};
x2 = data{2};
x3 = data{3};
x4 = data{4};
A = ones(4,4);
    [p_ranksum] = ranksum(x1, x2);
    A(1,2) = roundn(p_ranksum,-4);
    fprintf('Ranksum Test between x2 and x3:\n');
    fprintf('p-value: %.4f\n', p_ranksum);
    
    [p_ranksum] = ranksum(x1, x3);
    A(1,3) = roundn(p_ranksum,-4);
    fprintf('Ranksum Test between x2 and x8:\n');
    fprintf('p-value: %.4f\n', p_ranksum);
    [p_ranksum] = ranksum(x1, x4);
    A(1,4) = roundn(p_ranksum,-4);
    fprintf('Ranksum Test between x2 and x06:\n');
    fprintf('p-value: %.4f\n', p_ranksum);
    
    [p_ranksum] = ranksum(x2, x3);
    A(2,3) = roundn(p_ranksum,-4);
    fprintf('Ranksum Test between x3 and x8:\n');
    fprintf('p-value: %.4f\n', p_ranksum);
    [p_ranksum] = ranksum(x2, x4);
    A(2,4) = roundn(p_ranksum,-4);
    fprintf('Ranksum Test between x3 and x06:\n');
    fprintf('p-value: %.4f\n', p_ranksum);
    
    [p_ranksum] = ranksum(x3, x4);
    A(3,4) = roundn(p_ranksum,-4);
    fprintf('Ranksum Test between x8 and x06:\n');
    fprintf('p-value: %.4f\n', p_ranksum);

    data = [x1'; x2'; x3'; x4']; % 将每个样本组的数据存储在矩阵中

    g1=repmat({'x1'},size(x1));
    g2=repmat({'x2'},size(x2));
    
    g3=repmat({'x3'},size(x3));
    g4=repmat({'x4'},size(x4));
    group=[g1';g2';g3';g4'];
    [p_kw, tbl, stats_kw] = kruskalwallis(data,group); % 将矩阵作为参数传递给函数
    disp('Kruskal-Wallis Test Results:');
    disp(tbl);
    fprintf('H statistic: %.4f\n', tbl{2, 5});
    fprintf('p-value: %.4f\n', p_kw);
