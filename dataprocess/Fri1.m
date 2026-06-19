clear;
clc;
% 设置目录路径
baseDir = 'G:\processed_data\T\G9';%%%

% 初始化参数
x1 = [];
x2 = [];
x3 = [];
x4 = [];
x5 = [];

% 遍历子目录
subDirs = dir(baseDir);
for i = 1:length(subDirs)
    if subDirs(i).isdir && ~strcmp(subDirs(i).name, '.') && ~strcmp(subDirs(i).name, '..')
        subSubDirsN1 = fullfile(baseDir, subDirs(i).name, 'Sleep stage N1_', 'results');
        subSubDirsN2 = fullfile(baseDir, subDirs(i).name, 'Sleep stage N2_', 'results');
        subSubDirsN3 = fullfile(baseDir, subDirs(i).name, 'Sleep stage N3_', 'results');
        subSubDirsN4 = fullfile(baseDir, subDirs(i).name, 'Sleep stage R_', 'results');
        subSubDirsN5 = fullfile(baseDir, subDirs(i).name, 'Sleep stage W_', 'results');
        
        % 处理Sleep stage N1_
        if isfolder(subSubDirsN1)
            matFiles = dir(fullfile(subSubDirsN1, 'average_assortativity*.mat'));%%%
            for j = 1:length(matFiles)
                matFile = load(fullfile(subSubDirsN1, matFiles(j).name));
                x1 = [x1 matFile.averageAssortativity];%%%
            end
        end
        
        % 处理Sleep stage N2_
        if isfolder(subSubDirsN2)
            matFiles = dir(fullfile(subSubDirsN2, 'average_assortativity*.mat'));%%%
            for j = 1:length(matFiles)
                matFile = load(fullfile(subSubDirsN2, matFiles(j).name));
                x2 = [x2 matFile.averageAssortativity];%%%
            end
        end
        
        % 处理Sleep stage N3_
        if isfolder(subSubDirsN3)
            matFiles = dir(fullfile(subSubDirsN3, 'average_assortativity*.mat'));%%%
            for j = 1:length(matFiles)
                matFile = load(fullfile(subSubDirsN3, matFiles(j).name));
                x3 = [x3 matFile.averageAssortativity];%%%
            end
        end
        if isfolder(subSubDirsN4)
            matFiles = dir(fullfile(subSubDirsN4, 'average_assortativity*.mat'));%%%
            for j = 1:length(matFiles)
                matFile = load(fullfile(subSubDirsN4, matFiles(j).name));
                x4 = [x4 matFile.averageAssortativity];%%%
            end
        end
        if isfolder(subSubDirsN5)
            matFiles = dir(fullfile(subSubDirsN5, 'average_assortativity*.mat'));%%%
            for j = 1:length(matFiles)
                matFile = load(fullfile(subSubDirsN5, matFiles(j).name));
                x5 = [x5 matFile.averageAssortativity];%%%
            end
        end
    end
end

% 执行Friedman检验
if ~isempty(x1) && ~isempty(x2) && ~isempty(x3)&& ~isempty(x4) && ~isempty(x5)
    data = [x1', x2', x3', x4', x5'];
    [p, ~, stats] = friedman(data, 1, 'off');
    
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
