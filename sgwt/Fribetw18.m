clear;
clc;
% 设置目录路径
baseDir = 'G:\SGWT1\R06';%%%

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

matFile1 = load(fullfile(baseDir, 'ratio5_betweenness1.mat'));
matFile2 = load(fullfile(baseDir, 'ratio5_betweenness2.mat'));
matFile3 = load(fullfile(baseDir, 'ratio5_betweenness3.mat'));
matFile4 = load(fullfile(baseDir, 'ratio5_betweenness4.mat'));
matFile5 = load(fullfile(baseDir, 'ratio5_betweenness5.mat'));
matFile6 = load(fullfile(baseDir, 'ratio5_betweenness6.mat'));
matFile7 = load(fullfile(baseDir, 'ratio5_betweenness7.mat'));
matFile8 = load(fullfile(baseDir, 'ratio5_betweenness8.mat'));
matFile9 = load(fullfile(baseDir, 'ratio5_betweenness9.mat'));
matFile10 = load(fullfile(baseDir, 'ratio5_betweenness10.mat'));
matFile11 = load(fullfile(baseDir, 'ratio5_betweenness11.mat'));
matFile12 = load(fullfile(baseDir, 'ratio5_betweenness12.mat'));
matFile13 = load(fullfile(baseDir, 'ratio5_betweenness13.mat'));
matFile14 = load(fullfile(baseDir, 'ratio5_betweenness14.mat'));


x1 = matFile1.ratio5;
x2 = matFile2.ratio5;
x3 = matFile3.ratio5;
x4 = matFile4.ratio5;
x5 = matFile5.ratio5;
x6 = matFile6.ratio5;
x7 = matFile7.ratio5;
x8 = matFile8.ratio5;
x9 = matFile9.ratio5;
x10 = matFile10.ratio5;
x11 = matFile11.ratio5;
x12 = matFile12.ratio5;
x13 = matFile13.ratio5;
x14 = matFile14.ratio5;

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
    
    data = [x1', x2', x3', x4', x5', x6', x7', x8', x9', x10', x11', x12', x13', x14'];
    [p, ~, stats] = friedman(data, 1, 'off');
    
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
