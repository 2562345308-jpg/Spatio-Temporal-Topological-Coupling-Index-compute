clear;
clc;
% 1. 读取'G:\sleep_data'文件夹下所有文件夹的名字
folder1 = 'G:\R06';
subfolders1 = dir(folder1);
subfolders1 = subfolders1([subfolders1.isdir]);
subfolder_names1 = {subfolders1.name};
subfolder_names1 = subfolder_names1(3:end); % 移除'.'和'..'文件夹

% 2. 读取'E:\sleep_data'文件夹下所有.tsv文件的名字
folder2 = 'E:\nchsdb\R06';
tsv_files2 = dir(fullfile(folder2, '*.tsv'));
tsv_file_names2 = {tsv_files2.name};

% 3. 查找第二步读取的文件名字在第一步读取的文件夹名字中是否能找到，如果能找到则将对应的.tsv文件复制到'F:\sleep_data'文件夹下
output_folder = 'G:\R06';
for i = 1:length(tsv_file_names2)
    current_tsv_file = tsv_file_names2{i};
    
    % 去除文件扩展名，得到文件名
    [~, current_file_name, ~] = fileparts(current_tsv_file);
    
    if any(strcmp(current_file_name, subfolder_names1))
        % 文件名在文件夹名字中能找到，进行复制操作
        source_file = fullfile(folder2, current_tsv_file);
        destination_file = fullfile(output_folder, current_tsv_file);

      
        % 复制文件
        copyfile(source_file, destination_file);
        disp(['Copied ' source_file ' to ' destination_file]);
    end
end
