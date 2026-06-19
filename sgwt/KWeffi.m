clear;
clc;
% 设置目录路径
baseDir1 = 'G:\SGWT1\G2';%%%
baseDir2 = 'G:\SGWT1\G3';%%%
baseDir3 = 'G:\SGWT1\G8';%%%
baseDir4 = 'G:\SGWT1\R06';%%%

% 初始化参数


matFile1 = load(fullfile(baseDir1, 'ratio5_Efficiency.mat'));
matFile2 = load(fullfile(baseDir2, 'ratio5_Efficiency.mat'));
matFile3 = load(fullfile(baseDir3, 'ratio5_Efficiency.mat'));
matFile4 = load(fullfile(baseDir4, 'ratio5_Efficiency.mat'));

x1 = matFile1.ratio5;
x2 = matFile2.ratio5;
x3 = matFile3.ratio5;
x4 = matFile4.ratio5;
 % 剔除异常值
Q1 = quantile(x1, 0.25);
Q3 = quantile(x1, 0.75);
IQR = Q3 - Q1;
lowerBound = Q1 - 1.5 * IQR;
upperBound = Q3 + 1.5 * IQR;
x1 = x1(x1 >= lowerBound & x1 <= upperBound);

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

Q1 = quantile(x4, 0.25);
Q3 = quantile(x4, 0.75);
IQR = Q3 - Q1;
lowerBound = Q1 - 1.5 * IQR;
upperBound = Q3 + 1.5 * IQR;
x4 = x4(x4 >= lowerBound & x4 <= upperBound);
    


% 执行Friedman检验
% if ~isempty(x1) && ~isempty(x2) && ~isempty(x3)&& ~isempty(x4) 
%     x1(isnan(x1)) = 0;
%     x2(isnan(x2)) = 0;
%     x3(isnan(x3)) = 0;
%     x4(isnan(x4)) = 0;
   
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
% end
