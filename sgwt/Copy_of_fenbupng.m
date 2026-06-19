clc;
clear;
% 定义文件夹路径
inputFolder = 'G:\gft\situation2fenbu\R06';
rmedFolder = 'G:\gft\situation2fenbu\rmed';
pngFolder = 'G:\gft\situation2fenbu\png';

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
    inputData = log(inputData.rmed1);
    rmedData = load(rmedFilePath);
    rmedData = log(rmedData.medianValue);
    % 提取数据
    if isstruct(inputData)
        fields = fieldnames(inputData);
        inputValues = inputData.(fields{1}); % 假设数据存储在第一个字段中
    else
        inputValues = inputData; % 如果是直接数组
    end

    if isstruct(rmedData)
        fields = fieldnames(rmedData);
        rmedValue = rmedData.(fields{1}); % 假设数据存储在第一个字段中
    else
        rmedValue = rmedData; % 如果是直接数值
    end

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
    histogram(inputValues, 50, 'FaceColor', '#0072BD', 'EdgeColor', 'none'); % 直方图
    hold on;
    yLimits = ylim;
    plot([rmedValue, rmedValue], yLimits, 'r-', 'LineWidth', 2); % 在直方图上标出一个数的位置
    plot([p5, p5], yLimits, 'k--', 'LineWidth', 1.5);
    plot([p95, p95], yLimits, 'k--', 'LineWidth', 1.5);
    hold off;

    % 设置图形标题和标签
    title(sprintf('Distribution of Data in %s\n(rmed Value: %.2f)', originalFile, rmedValue), 'Interpreter', 'none');
    xlabel('Value');
    ylabel('Frequency');
    legend('Data Distribution', 'rmed Value', '5% Percentile', '95% Percentile', 'Location', 'Best');
    
    % 保存图形（可选）
    %saveas(gcf, fullfile(pngFolder, [ratioFileName, '.png']));
end

disp('处理完成！');
