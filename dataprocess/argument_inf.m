clear;
clc;
% 设置输入和输出目录
inputDir = 'G:\Total\R06';  % 输入目录
outputDir = 'G:\Matrixparameter\R06'; % 输出目录

% 调用递归函数处理输入目录及其所有子目录的所有子目录
processSubDirs(inputDir, outputDir);

function processSubDirs(dirPath, outputRootDir)
    % 获取输入目录下所有子目录
    subDirs = dir(dirPath);
    subDirs = subDirs([subDirs.isdir]); % 仅保留文件夹项
    subDirs = subDirs(~ismember({subDirs.name}, {'.', '..'})); % 去除 "." 和 ".."



% 循环处理每个子目录
 for i = 1:length(subDirs)
    subDirName = subDirs(i).name; % 子目录名称
    inputSubDir = fullfile(dirPath, subDirName); % 子目录完整路径
    outputSubDir = fullfile(outputRootDir, subDirName); % 输出子目录完整路径

    % 获取子目录下名字含有"Sleep"的.mat文件
    matFiles = dir(fullfile(inputSubDir, '*Sleep*.mat'));
    disp(['Current directory: ', inputSubDir]);
    disp('Matching .mat files:');
    %disp({matFiles.name});

   % 如果子目录中有名字含有"sleep data"的.mat文件，则进行处理
    if ~isempty(matFiles)
    % 如果输出子目录不存在，则创建新文件夹
        if ~exist(outputSubDir, 'dir')
            mkdir(outputSubDir);
        end   

    % 循环处理每个.mat文件
        for j = 1:length(matFiles)
            matFileName = matFiles(j).name; % .mat文件名称
            % 加载.mat文件中的数据并进行处理
            try
                % 加载.mat文件中的数据
                matFilePath = fullfile(inputSubDir, matFileName);
                data = load(matFilePath);
    
     
                % 提取数值数据（根据结构体成员名，假设保存数据的字段名为'data_field'，请根据实际情况修改）
                numericData = data.outputToStore.reshapedMtx;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                M = double(numericData); % 转换为双精度
                % 拆分成四个4*4的矩阵
                A = M(4:10, 4:10);
                B = M(4:10, [1:3, 11:14]);
                C = M([1:3, 11:14], 4:10);
                D = M([1:3, 11:14], [1:3, 11:14]);
                
                % 求每个矩阵里所有元素之和
                sum_A = sum(A, 'all');
                sum_B = sum(B, 'all');
                sum_C = sum(C, 'all');
                sum_D = sum(D, 'all');
                
                % 保存为.mat文件
               

    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                result1FileName = strrep(matFileName, '.mat', '_C-C.mat');
                result3FileName = strrep(matFileName, '.mat', '_C-P.mat');
                result4FileName = strrep(matFileName, '.mat', '_P-C.mat');
                result5FileName = strrep(matFileName, '.mat', '_P-P.mat');
                
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                result1FilePath = fullfile(outputSubDir, result1FileName);
                
                result3FilePath = fullfile(outputSubDir, result3FileName);
                result4FilePath = fullfile(outputSubDir, result4FileName);
                result5FilePath = fullfile(outputSubDir, result5FileName);
                
        
                save(result1FilePath, 'sum_A');
                
                save(result3FilePath, 'sum_B');
                save(result4FilePath, 'sum_C');
                save(result5FilePath, 'sum_D');
            catch
                 % 捕获异常并显示错误信息
                 fprintf('Error processing file: %s\n', matFileName);
                 continue; % 跳过当前.mat文件，继续处理下一个文件
                
            end   
        end
     end 
    % 递归调用处理子目录的子目录
     processSubDirs(inputSubDir, outputSubDir);
 end
end
