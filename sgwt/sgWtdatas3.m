clear;
clc;
close all;
Path1 = 'G:\Markov\finalmatrix\R06';%%%%%%%%%% %%%%%%%%%
Path2 = 'G:\signal1\R06';%%%%%%%%%% %%%%%%%%%
Path3 = 'G:\situation2\R06';%%%%%%%%%%%%%%% %%%%%%%%%%%%%
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
        
        new_data = reshape(data.transitionMatrix, [5, 5]);
        % new_data = reshape(data.transitionMatrix, [5, 5]);
        s_all = new_data;
       
        L = full(sgwt_laplacian(s_all));
        %% Design filters for transform
        Nscales=2; %4个尺度函数
        lmax=sgwt_rough_lmax(L);
    
        designtype='abspline3';
        %designtype='mexican_hat';
        %designtype='meyer';
        %designtype='simple_tf';
    
        [g,t]=sgwt_filter_design(lmax,Nscales,'designtype',designtype); %g为尺度函数核和小波函数核，t为尺度
    
        A = sym(L);
       
        [V,J]=jordan(L);%V为有向图的图傅里叶基
      
        x=eig(L);%L的特征值
        diagonalElements = randi([0, 1], 5, 1) * 2 - 1;
        D = diag(diagonalElements);
        for k=1:numel(g)%不同尺度下的g的小波基, g{1}时t为1%
            G1=diag(g{k}(x));%对角阵
            G = D*G1;
            c{k}=V*G/V;
        end
        a = subdirs(i).name;
        signfile = fullfile(Path2, a, signFiles(j).name);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        signdata = load(signfile);
        f = signdata.combinedData;%%节点信号%
        xs_low =lsqminnorm(c{1,2},f');%%低小波系数%%
        xs_high = lsqminnorm(c{1,3},f');%%高小波系数%%
        s1_l = c{1,2}(:,1)*xs_low(1,1);
        s2_l = c{1,2}(:,2)*xs_low(2,1);
        s3_l = c{1,2}(:,3)*xs_low(3,1);
        s4_l = c{1,2}(:,4)*xs_low(4,1);
        s5_l = c{1,2}(:,5)*xs_low(5,1);
    
        s1_h = c{1,3}(:,1)*xs_high(1,1);
        s2_h = c{1,3}(:,2)*xs_high(2,1);
        s3_h = c{1,3}(:,3)*xs_high(3,1);
        s4_h = c{1,3}(:,4)*xs_high(4,1);
        s5_h = c{1,3}(:,5)*xs_high(5,1);
    
        ratio1 = [ratio1, ((s1_l'*s1_l)^0.5)/((s1_h'*s1_h)^0.5)];
        ratio2 = [ratio2, ((s2_l'*s2_l)^0.5)/((s2_h'*s2_h)^0.5)];
        ratio3 = [ratio3, ((s3_l'*s3_l)^0.5)/((s3_h'*s3_h)^0.5)];
        ratio4 = [ratio4, ((s4_l'*s4_l)^0.5)/((s4_h'*s4_h)^0.5)];
        ratio5 = [ratio5, ((s5_l'*s5_l)^0.5)/((s5_h'*s5_h)^0.5)];

        outputSubdirPath = fullfile(Path3);
        if ~exist(outputSubdirPath, 'dir')
             mkdir(outputSubdirPath);
        end
                
  
    
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

