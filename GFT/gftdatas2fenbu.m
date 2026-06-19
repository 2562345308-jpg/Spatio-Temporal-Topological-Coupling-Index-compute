clear;
clc;
close all;
Path1 = 'G:\Markov\finalmatrix\R06';%%%%%%%%%% %%%%%%%%%
Path2 = 'G:\signal\R06';%%%%%%%%%% %%%%%%%%%
Path3 = 'G:\gft\situation2\R06eff';%%%%%%%%%%%%%%% %%%%%%%%%%%%%
matFiles = dir(fullfile(Path1, '*_processed_transition_matrix.mat'));
subdirs = dir(Path2);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'

P = 'G:\signal\G1\901_21817';
%signFiles = dir(fullfile(P, 'signal_*.mat'));
signFiles = dir(fullfile(P, 'signal_Efficiency.mat'));

for j = 1:length(signFiles)
% rmean1 = [];
% rmean2 = [];
% rmean3 = [];
% rmean4 = [];
% rmean5 = [];
rmed1 = [];
rmed2 = [];
rmed3 = [];
rmed4 = [];
rmed5 = [];
    for iii = 1:500
        ratio1 = [];
        ratio2 = [];
        ratio3 = [];
        ratio4 = [];
        ratio5 = [];
        for i = 1:length(matFiles)
            matFilePath = fullfile(matFiles(i).folder, matFiles(i).name);
            data = load(matFilePath);
            
            new_data = reshape(data.transitionMatrix, [5, 5]);
            % new_data = reshape(data.transitionMatrix, [5, 5]);
            s_all = new_data;
           
            L = full(sgwt_laplacian(s_all));

            [eigenvectors, eigenvalues] = eig(L);

            % 按特征值从小到大排序
            [eigenvalues, idx] = sort(diag(eigenvalues));
            eigenvectors = eigenvectors(:, idx);
            diagonalElements = randi([0, 1], 5, 1) * 2 - 1;
            DD = diag(diagonalElements);
            %%节点信号%
            a = subdirs(i).name;
            signfile = fullfile(Path2, a, signFiles(j).name);
            signdata = load(signfile);
            f = signdata.combinedData;
    
            f_hat = eigenvectors' * f';
            % 保留低频分量，将高频分量设置为0
            El = eigenvectors;
            El(:, 4:5) = 0;
            f_l = El * DD * f_hat;
            
            % 保留高频分量，将低频分量设置为0
            Eh = eigenvectors;
            Eh(:, 1:3) = 0;
            f_h = Eh * DD * f_hat;
    
            %比例
            ratio1 = [ratio1, abs(f_l(1))/abs(f_h(1))];
            ratio2 = [ratio2, abs(f_l(2))/abs(f_h(2))];
            ratio3 = [ratio3, abs(f_l(3))/abs(f_h(3))];
            ratio4 = [ratio4, abs(f_l(4))/abs(f_h(4))];
            ratio5 = [ratio5, abs(f_l(5))/abs(f_h(5))];

        
        end
            % mean1 = mean(ratio1); 
            % mean2 = mean(ratio2);
            % mean3 = mean(ratio3);
            % mean4 = mean(ratio4);
            % mean5 = mean(ratio5);
            % 去除 ratio1 中的 NaN 值
            ratio1 = ratio1(~isnan(ratio1));
            ratio2 = ratio2(~isnan(ratio2));
            ratio3 = ratio3(~isnan(ratio3));
            ratio4 = ratio4(~isnan(ratio4));
            ratio5 = ratio5(~isnan(ratio5));

            median1 = median(ratio1);
            median2 = median(ratio2);
            median3 = median(ratio3);
            median4 = median(ratio4);
            median5 = median(ratio5);

            % rmean1 = [rmean1, mean1];
            % rmean2 = [rmean2, mean2];
            % rmean3 = [rmean3, mean3];
            % rmean4 = [rmean4, mean4];
            % rmean5 = [rmean5, mean5];
            rmed1 = [rmed1, median1];
            rmed2 = [rmed2, median2];
            rmed3 = [rmed3, median3];
            rmed4 = [rmed4, median4];
            rmed5 = [rmed5, median5];
    end
    % outputFilePath11 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmean1')));%%%%%%%%%%%
    % save(outputFilePath11, 'rmean1');
    % outputFilePath12 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmean2')));%%%%%%%%%%%%%%
    % save(outputFilePath12, 'rmean2');
    % outputFilePath13 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmean3')));%%%%%%%%%%%%
    % save(outputFilePath13, 'rmean3');
    % outputFilePath14 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmean4')));%%%%%%%%%%%%%%%%
    % save(outputFilePath14, 'rmean4');
    % outputFilePath15 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmean5')));%%%%%%%%%%%%%%%%
    % save(outputFilePath15, 'rmean5');
    % 
    outputSubdirPath = fullfile(Path3);
    if ~exist(outputSubdirPath, 'dir')
          mkdir(outputSubdirPath);
    end
    outputFilePath21 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmed1')));%%%%%%%%%%%
    save(outputFilePath21, 'rmed1');
    outputFilePath22 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmed2')));%%%%%%%%%%%%%%
    save(outputFilePath22, 'rmed2');
    outputFilePath23 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmed3')));%%%%%%%%%%%%
    save(outputFilePath23, 'rmed3');
    outputFilePath24 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmed4')));%%%%%%%%%%%%%%%%
    save(outputFilePath24, 'rmed4');
    outputFilePath25 = fullfile(outputSubdirPath, sprintf(strrep(signFiles(j).name, 'signal', 'rmed5')));%%%%%%%%%%%%%%%%
    save(outputFilePath25, 'rmed5');


end

