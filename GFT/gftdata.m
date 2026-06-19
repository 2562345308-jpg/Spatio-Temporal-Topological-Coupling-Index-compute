clear;
clc;
close all;
Path1 = 'G:\Markov\finalmatrix\R06';%%%%%%%%%% %%%%%%%%%
Path2 = 'G:\signal1\R06';%%%%%%%%%% %%%%%%%%%
Path3 = 'G:\gft\R06';%%%%%%%%%%%%%%% %%%%%%%%%%%%%
matFiles = dir(fullfile(Path1, '*_processed_transition_matrix.mat'));
subdirs = dir(Path2);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'



P = 'G:\signal1\G1\901_21817';
signFiles = dir(fullfile(P, 'signal_*.mat'));

for j = 1:length(signFiles)
ratio1 = [];
ratio2 = [];
ratio3 = [];
ratio4 = [];
ratio5 = [];
    for i = 1:length(matFiles)
        matFilePath = fullfile(matFiles(i).folder, matFiles(i).name);
        data = load(matFilePath);
        
        %new_data = reshape(data.matrix, [5, 5]);
        new_data = reshape(data.transitionMatrix, [5, 5]);
        s_all = new_data;
       
        L = full(sgwt_laplacian(s_all));
        [eigenvectors, eigenvalues] = eig(L);

        % 按特征值从小到大排序
        [eigenvalues, idx] = sort(diag(eigenvalues));
        eigenvectors = eigenvectors(:, idx);

        %%节点信号%
        a = subdirs(i).name;
        signfile = fullfile(Path2, a, signFiles(j).name);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        signdata = load(signfile);
        f = signdata.combinedData;

        f_hat = eigenvectors' * f';
        % 保留低频分量，将高频分量设置为0
        El = eigenvectors;
        El(:, 4:5) = 0;
        f_l = El * f_hat;%%%%逆变换
        
        % 保留高频分量，将低频分量设置为0
        Eh = eigenvectors;
        Eh(:, 1:3) = 0;
        f_h = Eh * f_hat;%%%%逆变换

        %比例
        ratio1 = [ratio1, abs(f_l(1))/abs(f_h(1))];
        ratio2 = [ratio2, abs(f_l(2))/abs(f_h(2))];
        ratio3 = [ratio3, abs(f_l(3))/abs(f_h(3))];
        ratio4 = [ratio4, abs(f_l(4))/abs(f_h(4))];
        ratio5 = [ratio5, abs(f_l(5))/abs(f_h(5))];
        % ratio1 = abs(f_l(1))/abs(f_h(1));
        % ratio2 = abs(f_l(2))/abs(f_h(2));
        % ratio3 = abs(f_l(3))/abs(f_h(3));
        % ratio4 = abs(f_l(4))/abs(f_h(4));
        % ratio5 = abs(f_l(5))/abs(f_h(5));

        outputSubdirPath = fullfile(Path3);
        if ~exist(outputSubdirPath, 'dir')
             mkdir(outputSubdirPath);
        end
                
                % 保存平均值为.mat文件
       
    
    end
              
        outputFilePath11 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'ratio1')));%%%%%%%%%%%
        save(outputFilePath11, 'ratio1');
        outputFilePath12 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'ratio2')));%%%%%%%%%%%%%%
        save(outputFilePath12, 'ratio2');
        outputFilePath13 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'ratio3')));%%%%%%%%%%%%
        save(outputFilePath13, 'ratio3');
        outputFilePath14 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'ratio4')));%%%%%%%%%%%%%%%%
        save(outputFilePath14, 'ratio4');
        outputFilePath15 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'ratio5')));%%%%%%%%%%%%%%%%
        save(outputFilePath15, 'ratio5');

end





















