% 1. 读取'E:\processed_data\C_part\G0'文件夹下所有.tsv文件
folder = 'G:\R06';
tsv_files = dir(fullfile(folder, '*.tsv'));

% 2. 循环处理每个.tsv文件
output_folder = 'G:\Markov\R06';
for i = 1:length(tsv_files)
    current_tsv_file = fullfile(folder, tsv_files(i).name);
    
    % 读取.tsv文件
    data = readtable(current_tsv_file, 'FileType', 'text', 'Delimiter', '\t');
    
    % 3. 保留第三列数据
    selected_data = data(:, 3);
    
    % 4. 只保留特定Sleep stages并修改对应的标签
    valid_stages = {'Sleep stage 1', 'Sleep stage N1', 'Sleep stage 2', 'Sleep stage N2', 'Sleep stage 3', 'Sleep stage N3', 'Sleep stage R', 'Sleep stage W'};
    selected_data = selected_data(ismember(selected_data.description, valid_stages), :);
    
    % 修改Sleep stage标签
    selected_data.description = regexprep(selected_data.description, 'Sleep stage 1', 'Sleep stage N1');
    selected_data.description = regexprep(selected_data.description, 'Sleep stage 2', 'Sleep stage N2');
    selected_data.description = regexprep(selected_data.description, 'Sleep stage 3', 'Sleep stage N3');
    
    % 5. 将数据保存为.mat文件
    [~, file_name, ~] = fileparts(current_tsv_file);
    output_file = fullfile(output_folder, [file_name '.mat']);
    save(output_file, 'selected_data');
    disp(['Saved ' file_name '.mat to ' output_folder]);
end
