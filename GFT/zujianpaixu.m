clear;%%%ratio betweeness NB%%%%
clc;
% 文件路径和变量名称
filePaths = { ...
    'G:\gft\G2\ratio5_richclub.mat', ...
    'G:\gft\G3\ratio5_richclub.mat', ...
    'G:\gft\G8\ratio5_richclub.mat', ...
    'G:\gft\R06\ratio5_richclub.mat', ...
};
variableNames = {'ratio5', 'ratio5', 'ratio5', 'ratio5'};
labelNames = {'G2', 'G3', 'G8', 'R06'};

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
saveas(gcf, 'G:\画图\图傅里叶\全局不同病\Wri.png');%%%%%

x1 = data{1};
x2 = data{2};
x3 = data{3};
x4 = data{4};
% x1 = log(x1);
% x2 = log(x2);
% x3 = log(x3);
% x4 = log(x4);

A = ones(4,4);
    [p12] = ranksum(x1, x2);
    [p13] = ranksum(x1, x3);
    [p14] = ranksum(x1, x4);
    [p23] = ranksum(x2, x3);
    [p24] = ranksum(x2, x4);
    [p34] = ranksum(x3, x4);
    fprintf('yuanshi:\n');
    fprintf('P-value for x1 vs x2 = %.4f\n', p12);
    fprintf('P-value for x1 vs x3 = %.4f\n', p13);
    fprintf('P-value for x1 vs x4 = %.4f\n', p14);
    fprintf('P-value for x2 vs x3 = %.4f\n', p23);
    fprintf('P-value for x2 vs x4 = %.4f\n', p24);
    fprintf('P-value for x3 vs x4 = %.4f\n', p34);
    p_values = [p12,p13,p14,p23,p24,p34];

    q_values = mafdr(p_values, 'BHFDR', true);
    fprintf('%.4f\n', q_values);

    A(1,2) = roundn(q_values(1),-4);
    A(1,3) = roundn(q_values(2),-4);
    A(1,4) = roundn(q_values(3),-4);
    A(2,3) = roundn(q_values(4),-4);
    A(2,4) = roundn(q_values(5),-4);
    A(3,4) = roundn(q_values(6),-4);
    

    data1 = [x1'; x2'; x3'; x4']; % 将每个样本组的数据存储在矩阵中

    g1=repmat({'x1'},size(x1));
    g2=repmat({'x2'},size(x2));
    
    g3=repmat({'x3'},size(x3));
    g4=repmat({'x4'},size(x4));
    group=[g1';g2';g3';g4'];
    [p_kw, tbl, stats_kw] = kruskalwallis(data1,group); % 将矩阵作为参数传递给函数
    disp('Kruskal-Wallis Test Results:');
    disp(tbl);
    fprintf('H statistic: %.4f\n', tbl{2, 5});
    fprintf('p-value: %.4f\n', p_kw);
close all;
