% 步骤1：读取文件'G:\sleep_data\delname.xlsx'中的第一列数据
excelData = readtable('E:\sleep_data\health_spi_final.xlsx');
data = string(excelData{:, 1}); % 将数据转换为字符串数组

% 步骤2：获取'G:\sleep_data'位置下所有文件夹的名字
folderPath = 'G:\sleep_data';
folders = dir(folderPath);
folderNames = {folders([folders.isdir]).name};
folderNames = setdiff(folderNames, {'.', '..'}); % 移除当前目录和上级目录

% 步骤3：复制以第一步读取的数据开头的文件夹到'E:\sleep_data'位置
targetPath = 'E:\sleep_data\H';
for i = 1:numel(folderNames)
    folderName = folderNames{i};
    if startsWith(folderName, data)
        sourceFolder = fullfile(folderPath, folderName);
        targetFolder = fullfile(targetPath, folderName);
        copyfile(sourceFolder, targetFolder);
        disp(['复制文件夹：' folderName]);
    end
end