clear;
clc;
Path1 = 'E:\processed_data\Y_part\G9';%%%%%%%%%% %%%%%%%%%
Path2 = 'E:\processed_data\S_part\G9';%%%%%%%%%% %%%%%%%%%
Path3 = 'E:\processed_data\B1\G9';%%%%%%%%%%%%%%% %%%%%%%%%%%%%
matFiles = dir(fullfile(Path1, '*_processed_transition_matrix.mat'));
subdirs = dir(Path2);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'
for i = 1:length(matFiles)
    matFilePath = fullfile(matFiles(i).folder, matFiles(i).name);
    data = load(matFilePath);
    
    new_data = reshape(data.transitionMatrix, [5, 5]);
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

    for k=1:numel(g)%不同尺度下的g的小波基, g{1}时t为1%
        G=diag(g{k}(x));%对角阵
        c{k}=V*G/V;
    end
    a = subdirs(i).name;
    signfile = fullfile(Path2, a, 'signal_transitivity.mat');%%%%%%%%%%%%%%%%%
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

    ratio1 = ((s1_l'*s1_l)^0.5)/((s1_h'*s1_h)^0.5);
    ratio2 = ((s2_l'*s2_l)^0.5)/((s2_h'*s2_h)^0.5);
    ratio3 = ((s3_l'*s3_l)^0.5)/((s3_h'*s3_h)^0.5);
    ratio4 = ((s4_l'*s4_l)^0.5)/((s4_h'*s4_h)^0.5);
    ratio5 = ((s5_l'*s5_l)^0.5)/((s5_h'*s5_h)^0.5);

    outputSubdirPath = fullfile(Path3, a);%%%
    if ~exist(outputSubdirPath, 'dir')
         mkdir(outputSubdirPath);
    end
            
            % 保存平均值为.mat文件
    outputFilePath1 = fullfile(outputSubdirPath, sprintf('ratio1_transitivity.mat'));%%%%%%%%%%%
    save(outputFilePath1, 'ratio1');
    outputFilePath2 = fullfile(outputSubdirPath, sprintf('ratio2_transitivity.mat'));%%%%%%%%%%%%%%
    save(outputFilePath2, 'ratio2');
    outputFilePath3 = fullfile(outputSubdirPath, sprintf('ratio3_transitivity.mat'));%%%%%%%%%%%%
    save(outputFilePath3, 'ratio3');
    outputFilePath4 = fullfile(outputSubdirPath, sprintf('ratio4_transitivity.mat'));%%%%%%%%%%%%%%%%
    save(outputFilePath4, 'ratio4');
    outputFilePath5 = fullfile(outputSubdirPath, sprintf('ratio5_transitivity.mat'));%%%%%%%%%%%%%%%%
    save(outputFilePath5, 'ratio5');
    

end
