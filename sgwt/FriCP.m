clear;
clc;
% 设置目录路径
baseDir = 'G:\SGWT1\R06';%%%
A = ones(4,4);
% 初始化参数
x1 = [];
x2 = [];
x3 = [];
x4 = [];

matFile1 = load(fullfile(baseDir, 'ratio5_CC.mat'));
matFile2 = load(fullfile(baseDir, 'ratio5_CP.mat'));
matFile3 = load(fullfile(baseDir, 'ratio5_PC.mat'));
matFile4 = load(fullfile(baseDir, 'ratio5_PP.mat'));

x1 = matFile1.ratio5;
x2 = matFile2.ratio5;
x3 = matFile3.ratio5;
x4 = matFile4.ratio5;


% 执行Friedman检验
if ~isempty(x1) && ~isempty(x2) && ~isempty(x3)&& ~isempty(x4) 
    x1(isnan(x1)) = 0;
    x2(isnan(x2)) = 0;
    x3(isnan(x3)) = 0;
    x4(isnan(x4)) = 0;
    
    data = [x1', x2', x3', x4'];
    [p, ~, stats] = friedman(data, 1, 'off');
    
    fprintf('Friedman TestG9:\n');%%%
    fprintf('P-value = %.4f\n', p);

     % 执行两两Signed Rank检验
    [p12, ~, stats12] = signrank(x1, x2);
    [p13, ~, stats13] = signrank(x1, x3);
    [p14, ~, stats14] = signrank(x1, x4);

    [p23, ~, stats23] = signrank(x2, x3);
    [p24, ~, stats24] = signrank(x2, x4);
  
    [p34, ~, stats34] = signrank(x3, x4);
    
    
    
    fprintf('\nSigned Rank TestG9:\n');%%%
    fprintf('P-value for x1 vs x2 = %.4f\n', p12);
    fprintf('P-value for x1 vs x3 = %.4f\n', p13);
    fprintf('P-value for x1 vs x4 = %.4f\n', p14);

    fprintf('P-value for x2 vs x3 = %.4f\n', p23);
    fprintf('P-value for x2 vs x4 = %.4f\n', p24);

    fprintf('P-value for x3 vs x4 = %.4f\n', p34);
 

end
p_values = [p12,p13,p14,p23,p24,p34];

q_values = mafdr(p_values, 'BHFDR', true);
fprintf('%.4f\n', q_values);
A(1,2) = roundn(q_values(1),-4);
A(1,3) = roundn(q_values(2),-4);
A(1,4) = roundn(q_values(3),-4);

A(2,3) = roundn(q_values(4),-4);
A(2,4) = roundn(q_values(5),-4);

A(3,4) = roundn(q_values(6),-4);
