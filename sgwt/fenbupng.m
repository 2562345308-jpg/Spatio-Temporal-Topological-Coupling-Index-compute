clc;
clear;
% 定义文件夹路径
inputFolder = 'G:\gft\situation2fenbu\R06eff';
rmedFolder = 'G:\gft\situation2fenbu\rmedeff';
pngFolder = 'G:\gft\situation2fenbu\huang+png';

% 获取输入文件夹下所有.mat文件
matFiles = dir(fullfile(inputFolder, '*.mat'));

% 遍历每个.mat文件
for i = 1:length(matFiles)
    % 获取原文件名和路径
    originalFile = matFiles(i).name;
    originalFilePath = fullfile(inputFolder, originalFile);

    % 修改文件名中的 'rmed' 为 'ratio'
    ratioFileName = strrep(originalFile, 'rmed', 'ratio');

    % 读取 rmed 文件夹下对应的文件
    rmedFilePath = fullfile(rmedFolder, ratioFileName);
    if ~isfile(rmedFilePath)
        fprintf('文件 %s 不存在于 %s\n', ratioFileName, rmedFolder);
        continue;
    end

    % 加载数据
    inputData = load(originalFilePath);
    
    rmedData = load(rmedFilePath);
    
    % 提取数据
    if isstruct(inputData)
        fields = fieldnames(inputData);
        inputValues = inputData.(fields{1}); % 假设数据存储在第一个字段中
    else
        inputValues = inputData; % 如果是直接数组
    end
    inputValues = log(inputValues);
    if isstruct(rmedData)
        fields = fieldnames(rmedData);
        rmedValue = rmedData.(fields{1}); % 假设数据存储在第一个字段中
    else
        rmedValue = rmedData; % 如果是直接数值
    end
    rmedValue = log(rmedValue);
    % 检查数据有效性
    if ~isnumeric(inputValues) || ~isnumeric(rmedValue)
        fprintf('文件 %s 或 %s 中的数据无效\n', originalFile, ratioFileName);
        continue;
    end

    % 计算 5% 和 95% 分位数
    p5 = prctile(inputValues, 5);
    p95 = prctile(inputValues, 95);

    % 绘图
    figure;
    % 绘制直方图（填充部分）
    histogram(inputValues, 50, 'FaceColor', '#C1CDC1', 'EdgeColor', 'none', 'Normalization', 'pdf');
    hold on;
    
    % 拟合正态分布并绘制 PDF 曲线
    pd = fitdist(inputValues', 'Normal');
    x = linspace(min(inputValues), max(inputValues), 100);
    y = pdf(pd, x);
    plot(x, y, 'Color', [0.9725,0.9412,0.7451], 'LineWidth', 2); % 绘制拟合的正态分布 PDF 曲线蓝[0.7529,0.8863,0.993]、黄[0.9725,0.9412,0.7451]、绿[0.7451,0.9373,0.7490]
    fill([x, fliplr(x)], [y, zeros(size(y))], [0.9725,0.9412,0.7451], 'FaceAlpha', 0.7, 'EdgeColor', 'none');
    % 绘制 rmedValue 和分位数线
    yLimits = ylim;
    plot([rmedValue, rmedValue], yLimits, 'Color', [0.8510 0.1686 0.0118], 'LineWidth', 1.5); % rmedValue，红色虚线
    plot([p5, p5], yLimits, 'Color', [0.4118,0.4118,0.4118], 'LineStyle', '--', 'LineWidth', 1.5);              % 5% 分位数，灰色虚线
    plot([p95, p95], yLimits, 'Color',[0.4118,0.4118,0.4118], 'LineStyle', '--', 'LineWidth', 1.5);            % 95% 分位数，灰色虚线
    
    hold off;
    
    % 设置图形标题和标签
    title(sprintf('Distribution of Data in %s\n(rmed Value: %.2f)', originalFile, rmedValue), 'Interpreter', 'none');
    xlabel('Value');
    ylabel('Probability Density');
    %legend('Data Distribution', 'Fitted Normal Distribution', 'rmed Value', '5% Percentile', '95% Percentile', 'Location', 'Best');
    % 保存图形（可选）
    saveas(gcf, fullfile(pngFolder, [ratioFileName, '.png']));
end

disp('处理完成！');
close all;
