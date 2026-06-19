clear;
clc;
close all;
Path1 = 'E:\processed_data\Y_part\G2';%%%%%%%%%% %%%%%%%%%
Path2 = 'E:\processed_data\S_part\G2';%%%%%%%%%% %%%%%%%%%
Path3 = 'E:\processed_data\B2\G2';%%%%%%%%%%%%%%% %%%%%%%%%%%%%
matFiles = dir(fullfile(Path1, '*_processed_transition_matrix.mat'));
subdirs = dir(Path2);
subdirs = subdirs([subdirs.isdir]); % 筛选出子目录
subdirs = subdirs(~ismember({subdirs.name}, {'.', '..'})); % 去除'.'和'..'
ts1_l = [];
ts2_l = [];
ts3_l = [];
ts4_l = [];
ts5_l = [];

ts1_h = [];
ts2_h = [];
ts3_h = [];
ts4_h = [];
ts5_h = [];

ratio1 = [];
ratio2 = [];
ratio3 = [];
ratio4 = [];
ratio5 = [];

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
    signfile = fullfile(Path2, a, 'signal_GErout1.mat');%%%%%%%%%%%%%%%%%
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
 
    
    ts1_l = [ts1_l, ((s1_l'*s1_l)^0.5)];
    ts2_l = [ts2_l, ((s2_l'*s2_l)^0.5)];
    ts3_l = [ts3_l, ((s3_l'*s3_l)^0.5)];
    ts4_l = [ts4_l, ((s4_l'*s4_l)^0.5)];
    ts5_l = [ts5_l, ((s5_l'*s5_l)^0.5)];

    ts1_h = [ts1_h, ((s1_h'*s1_h)^0.5)];
    ts2_h = [ts2_h, ((s2_h'*s2_h)^0.5)];
    ts3_h = [ts3_h, ((s3_h'*s3_h)^0.5)];
    ts4_h = [ts4_h, ((s4_h'*s4_h)^0.5)];
    ts5_h = [ts5_h, ((s5_h'*s5_h)^0.5)];
 

    outputSubdirPath = fullfile(Path3, a);%%%
    if ~exist(outputSubdirPath, 'dir')
         mkdir(outputSubdirPath);
    end
            
            % 保存平均值为.mat文件
   

end

tlow = [];
thigh = [];
ratio = [];
gnamel = [];
gnameh = [];
gnamer = [];
subfolders1 = {ts1_l, ts2_l, ts3_l, ts4_l, ts5_l};
for item1 = 1:length(subfolders1)
    hol = subfolders1{item1};
    q1l = prctile(hol,25);
    q3l = prctile(hol,75);
    iqrl = q3l-q1l;  
    upperl = q3l+1.5*iqrl;
    lowerl = q1l-1.5*iqrl;   
    hol(hol>upperl) = [];
    hol(hol<lowerl) = []; 
    gnamel = [gnamel size(hol',1)];
    tlow = [tlow; hol'];
end
groupl = [repmat('1', gnamel(1), 1); repmat('2', gnamel(2), 1); repmat('3', ...
    gnamel(3), 1); repmat('4', gnamel(4), 1); repmat('5',gnamel(5), 1)];

subfolders2 = {ts1_h, ts2_h, ts3_h, ts4_h, ts5_h};
for item2 = 1:length(subfolders2)
    hoh = subfolders2{item2};
    q1h = prctile(hoh,25);
    q3h = prctile(hoh,75);
    iqrh= q3h-q1h;  
    upperh = q3h+1.5*iqrh;
    lowerh = q1h-1.5*iqrh;   
    hoh(hoh>upperh) = [];
    hoh(hoh<lowerh) = [];
    gnameh = [gnameh size(hoh',1)];
    thigh = [thigh; hoh'];
end
grouph = [repmat('1', gnameh(1), 1); repmat('2', gnameh(2), 1); repmat('3', ...
    gnameh(3), 1); repmat('4', gnameh(4), 1); repmat('5',gnameh(5), 1)];

subfolders3 = {ratio1, ratio2, ratio3, ratio4, ratio5};
for item3 = 1:length(subfolders3)
    rat = subfolders3{item3};
    q1h = prctile(rat,25);
    q3h = prctile(rat,75);
    iqrh= q3h-q1h;  
    upperh = q3h+1.5*iqrh;
    lowerh = q1h-1.5*iqrh;   
    rat(rat>upperh) = [];
    rat(rat<lowerh) = [];
    gnamer = [gnamer size(rat',1)];
    ratio = [ratio; rat'];
end
groupr = [repmat('1', gnamer(1), 1); repmat('2', gnamer(2), 1); repmat('3', ...
    gnamer(3), 1); repmat('4', gnamer(4), 1); repmat('5',gnamer(5), 1)];

figure
subplot(3,1,1)
%boxplot(tlow, groupl,'Width',0.2);
h1=boxplot(tlow, groupl,'Width',0.2);
set(h1,'LineWidth',1.5);
set(gca,'FontSize',20);

subplot(3,1,2)
%boxplot(thigh, grouph,'Width',0.2);
h2=boxplot(thigh, grouph,'Width',0.2);
set(h2,'LineWidth',1.5);
set(gca,'FontSize',20);

subplot(3,1,3)
%boxplot(ratio, groupr,'Width',0.2);
h3=boxplot(ratio, groupr,'Width',0.2);
set(h3,'LineWidth',1.5);
set(gca,'FontSize',20);




