% 1. 读取'G:\sleep_data'文件夹下所有文件夹的名字
folder1 = 'F:\processed_data\T_part\G9';
subfolders1 = dir(folder1);
subfolders1 = subfolders1([subfolders1.isdir]);
subfolder_names1 = {subfolders1.name};
subfolder_names1 = subfolder_names1(3:end); % 移除'.'和'..'文件夹

% 步骤2：获取'G:\sleep_data'位置下所有文件夹的名字
folderPath = 'F:\processed_data\G\G9';
folders = dir(folderPath);
folderNames = {folders([folders.isdir]).name};
folderNames = setdiff(folderNames, {'.', '..'}); % 移除当前目录和上级目录

% 步骤3：复制以第一步读取的数据开头的文件夹到'E:\sleep_data'位置
targetPath = 'F:\processed_data\G_part\G9';
for i = 1:numel(folderNames)
    folderName = folderNames{i};
    if startsWith(folderName, subfolder_names1)
        sourceFolder = fullfile(folderPath, folderName);
        targetFolder = fullfile(targetPath, folderName);
        copyfile(sourceFolder, targetFolder);
        disp(['复制文件夹：' folderName]);
    end
end