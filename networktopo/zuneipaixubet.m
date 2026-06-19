clear;%%%%%替代情况二%%%%%%
clc;
% 文件路径和变量名称
filePaths = { ...
    'G:\nettp\R06\N1_betweenness8.mat', ...
    'G:\nettp\R06\N2_betweenness8.mat', ...
    'G:\nettp\R06\N3_betweenness8.mat', ...
    'G:\nettp\R06\R_betweenness8.mat', ...
    'G:\nettp\R06\W_betweenness8.mat' ...
};
variableNames = {'N1', 'N2', 'N3', 'R', 'W'};

% 初始化数据存储
data = cell(1, numel(filePaths));
medians = zeros(1, numel(filePaths));

% 读取数据和计算中位数
for i = 1:numel(filePaths)
    % 加载 .mat 文件中的数据
    temp = load(filePaths{i});
    
    % 提取特定变量
    ratioData = temp.allData;
    
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
sortedLabels = variableNames(sortedIndices);

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

baseDir = 'G:\nettp\R06';%%%
A = ones(5,5);
% 初始化参数
x1 = [];
x2 = [];
x3 = [];
x4 = [];
x5 = [];
matFile1 = load(fullfile(baseDir, 'N1_betweenness8.mat'));
matFile2 = load(fullfile(baseDir, 'N2_betweenness8.mat'));
matFile3 = load(fullfile(baseDir, 'N3_betweenness8.mat'));
matFile4 = load(fullfile(baseDir, 'R_betweenness8.mat'));
matFile5 = load(fullfile(baseDir, 'W_betweenness8.mat'));
x1 = matFile1.allData;
x2 = matFile2.allData;
x3 = matFile3.allData;
x4 = matFile4.allData;
x5 = matFile5.allData;

% 执行Friedman检验
if ~isempty(x1) && ~isempty(x2) && ~isempty(x3)&& ~isempty(x4) && ~isempty(x5)
    x1(isnan(x1)) = 0;
    x2(isnan(x2)) = 0;
    x3(isnan(x3)) = 0;
    x4(isnan(x4)) = 0;
    x5(isnan(x5)) = 0;
    data11 = [x1, x2, x3, x4, x5];
    [p, ~, stats] = friedman(data11, 1, 'off');
    
    fprintf('Friedman TestG9:\n');%%%
    fprintf('P-value = %.4f\n', p);

     % 执行两两Signed Rank检验
    [p12, ~, stats12] = signrank(x1, x2);
    [p13, ~, stats13] = signrank(x1, x3);
    [p14, ~, stats14] = signrank(x1, x4);
    [p15, ~, stats15] = signrank(x1, x5);
    [p23, ~, stats23] = signrank(x2, x3);
    [p24, ~, stats24] = signrank(x2, x4);
    [p25, ~, stats25] = signrank(x2, x5);
    [p34, ~, stats34] = signrank(x3, x4);
    [p35, ~, stats35] = signrank(x3, x5);
    [p45, ~, stats45] = signrank(x4, x5);
    
    fprintf('\nSigned Rank TestG9:\n');%%%
    fprintf('P-value for x1 vs x2 = %.4f\n', p12);
    fprintf('P-value for x1 vs x3 = %.4f\n', p13);
    fprintf('P-value for x1 vs x4 = %.4f\n', p14);
    fprintf('P-value for x1 vs x5 = %.4f\n', p15);
    fprintf('P-value for x2 vs x3 = %.4f\n', p23);
    fprintf('P-value for x2 vs x4 = %.4f\n', p24);
    fprintf('P-value for x2 vs x5 = %.4f\n', p25);
    fprintf('P-value for x3 vs x4 = %.4f\n', p34);
    fprintf('P-value for x3 vs x5 = %.4f\n', p35);
    fprintf('P-value for x4 vs x5 = %.4f\n', p45);
end
p_values = [p12,p13,p14,p15,p23,p24,p25,p34,p35,p45];

q_values = mafdr(p_values, 'BHFDR', true);
fprintf('%.4f\n', q_values);
A(1,2) = roundn(q_values(1),-4);
A(1,3) = roundn(q_values(2),-4);
A(1,4) = roundn(q_values(3),-4);
A(1,5) = roundn(q_values(4),-4);
A(2,3) = roundn(q_values(5),-4);
A(2,4) = roundn(q_values(6),-4);
A(2,5) = roundn(q_values(7),-4);
A(3,4) = roundn(q_values(8),-4);
A(3,5) = roundn(q_values(9),-4);
A(4,5) = roundn(q_values(10),-4);
