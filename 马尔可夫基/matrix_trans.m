% 1. 读取文件夹E:\processed_data\X_part\G0下所有.mat文件
fileFolder = 'G:\Markov\re\R06';
matFiles = dir(fullfile(fileFolder, '*.mat'));

% 2. 对于每一个文件，读取变量selected_data下的数据
for i = 1:length(matFiles)
    % 读取.mat文件
    currentFile = fullfile(fileFolder, matFiles(i).name);
    load(currentFile);  % 假设.mat文件中有一个变量selected_data
    
    % 初始化一个5x5的矩阵
    transitionMatrix = zeros(5, 5);
    
    % 3. 设置一个5x5的矩阵
    
    % 4. 对于第二步读取的数据，更新矩阵
    for j = 1:(length(selected_data) - 1)
        currentStage = selected_data{j};
        nextStage = selected_data{j + 1};
        
        if strcmp(currentStage, 'Sleep stage N1') && strcmp(nextStage, 'Sleep stage N2')
            transitionMatrix(1, 2) = transitionMatrix(1, 2) + 1;
        elseif strcmp(currentStage, 'Sleep stage N1') && strcmp(nextStage, 'Sleep stage N3')
            transitionMatrix(1, 3) = transitionMatrix(1, 3) + 1;
        elseif strcmp(currentStage, 'Sleep stage N1') && strcmp(nextStage, 'Sleep stage R')
            transitionMatrix(1, 4) = transitionMatrix(1, 4) + 1;
        elseif strcmp(currentStage, 'Sleep stage N1') && strcmp(nextStage, 'Sleep stage W')
            transitionMatrix(1, 5) = transitionMatrix(1, 5) + 1;
        elseif strcmp(currentStage, 'Sleep stage N2') && strcmp(nextStage, 'Sleep stage N1')
            transitionMatrix(2, 1) = transitionMatrix(2, 1) + 1;
        elseif strcmp(currentStage, 'Sleep stage N2') && strcmp(nextStage, 'Sleep stage N3')
            transitionMatrix(2, 3) = transitionMatrix(2, 3) + 1;
        elseif strcmp(currentStage, 'Sleep stage N2') && strcmp(nextStage, 'Sleep stage R')
            transitionMatrix(2, 4) = transitionMatrix(2, 4) + 1;
        elseif strcmp(currentStage, 'Sleep stage N2') && strcmp(nextStage, 'Sleep stage W')
            transitionMatrix(2, 5) = transitionMatrix(2, 5) + 1;
        elseif strcmp(currentStage, 'Sleep stage N3') && strcmp(nextStage, 'Sleep stage N1')
            transitionMatrix(3, 1) = transitionMatrix(3, 1) + 1;
        elseif strcmp(currentStage, 'Sleep stage N3') && strcmp(nextStage, 'Sleep stage N2')
            transitionMatrix(3, 2) = transitionMatrix(3, 2) + 1;
        elseif strcmp(currentStage, 'Sleep stage N3') && strcmp(nextStage, 'Sleep stage R')
            transitionMatrix(3, 4) = transitionMatrix(3, 4) + 1;
        elseif strcmp(currentStage, 'Sleep stage N3') && strcmp(nextStage, 'Sleep stage W')
            transitionMatrix(3, 5) = transitionMatrix(3, 5) + 1;
        elseif strcmp(currentStage, 'Sleep stage R') && strcmp(nextStage, 'Sleep stage N1')
            transitionMatrix(4, 1) = transitionMatrix(4, 1) + 1;
        elseif strcmp(currentStage, 'Sleep stage R') && strcmp(nextStage, 'Sleep stage N2')
            transitionMatrix(4, 2) = transitionMatrix(4, 2) + 1;
        elseif strcmp(currentStage, 'Sleep stage R') && strcmp(nextStage, 'Sleep stage N3')
            transitionMatrix(4, 3) = transitionMatrix(4, 3) + 1;
        elseif strcmp(currentStage, 'Sleep stage R') && strcmp(nextStage, 'Sleep stage W')
            transitionMatrix(4, 5) = transitionMatrix(4, 5) + 1;
        elseif strcmp(currentStage, 'Sleep stage W') && strcmp(nextStage, 'Sleep stage N1')
            transitionMatrix(5, 1) = transitionMatrix(5, 1) + 1;
        elseif strcmp(currentStage, 'Sleep stage W') && strcmp(nextStage, 'Sleep stage N2')
            transitionMatrix(5, 2) = transitionMatrix(5, 2) + 1;
        elseif strcmp(currentStage, 'Sleep stage W') && strcmp(nextStage, 'Sleep stage N3')
            transitionMatrix(5, 3) = transitionMatrix(5, 3) + 1;
        elseif strcmp(currentStage, 'Sleep stage W') && strcmp(nextStage, 'Sleep stage R')
            transitionMatrix(5, 4) = transitionMatrix(5, 4) + 1;
        %elseif strcmp(currentStage, 'Sleep stage N1') && strcmp(nextStage, 'Sleep stage N1')
            %transitionMatrix(1, 1) = transitionMatrix(1, 1) + 1;
        %elseif strcmp(currentStage, 'Sleep stage N2') && strcmp(nextStage, 'Sleep stage N2')
            %transitionMatrix(2, 2) = transitionMatrix(2, 2) + 1;
        %elseif strcmp(currentStage, 'Sleep stage N3') && strcmp(nextStage, 'Sleep stage N3')
            %transitionMatrix(3, 3) = transitionMatrix(3, 3) + 1;
        %elseif strcmp(currentStage, 'Sleep stage R') && strcmp(nextStage, 'Sleep stage R')
            %transitionMatrix(4, 4) = transitionMatrix(4, 4) + 1;
        %elseif strcmp(currentStage, 'Sleep stage W') && strcmp(nextStage, 'Sleep stage W')
            %transitionMatrix(5, 5) = transitionMatrix(5, 5) + 1;
        end
    end
    
    % 5. 将矩阵保存为.mat文件
    saveFolder = 'G:\Markov\finalmatrix\R06';
    [~, fileName, ~] = fileparts(matFiles(i).name);
    save(fullfile(saveFolder, [fileName '_transition_matrix.mat']), 'transitionMatrix');
end
