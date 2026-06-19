clear;
clc;
% 设置目录路径
baseDir = 'G:\SGWT1\G8';%%%
A = ones(5,5);
% 初始化参数

matFile1 = load(fullfile(baseDir, 'ratio1_CC.mat'));
matFile2 = load(fullfile(baseDir, 'ratio2_CC.mat'));
matFile3 = load(fullfile(baseDir, 'ratio3_CC.mat'));
matFile4 = load(fullfile(baseDir, 'ratio4_CC.mat'));
matFile5 = load(fullfile(baseDir, 'ratio5_CC.mat'));
x1 = matFile1.ratio1;
x2 = matFile2.ratio2;
x3 = matFile3.ratio3;
x4 = matFile4.ratio4;
x5 = matFile5.ratio5;

% 执行Friedman检验
if ~isempty(x1) && ~isempty(x2) && ~isempty(x3)&& ~isempty(x4) && ~isempty(x5)
    x1(isnan(x1)) = 0;
    x2(isnan(x2)) = 0;
    x3(isnan(x3)) = 0;
    x4(isnan(x4)) = 0;
    x5(isnan(x5)) = 0;
    data = [x1', x2', x3', x4', x5'];
    [p, ~, stats] = friedman(data, 1, 'off');
    
    fprintf('Friedman Test:\n');%%%
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