clear;
clc;
% 设置输入和输出目录
inputDir = 'G:\Rxiaolong';  % 输入目录
outputDir = 'E:\parameter'; % 输出目录

% 调用递归函数处理输入目录及其所有子目录的所有子目录
processSubDirs(inputDir, outputDir);

function processSubDirs(dirPath, outputRootDir)
    % 获取输入目录下所有子目录
    subDirs = dir(dirPath);
    subDirs = subDirs([subDirs.isdir]); % 仅保留文件夹项
    subDirs = subDirs(~ismember({subDirs.name}, {'.', '..'})); % 去除 "." 和 ".."



% 循环处理每个子目录
 for i = 1:length(subDirs)
    subDirName = subDirs(i).name; % 子目录名称
    inputSubDir = fullfile(dirPath, subDirName); % 子目录完整路径
    outputSubDir = fullfile(outputRootDir, subDirName); % 输出子目录完整路径

    % 获取子目录下名字含有"Sleep"的.mat文件
    matFiles = dir(fullfile(inputSubDir, 'binnue*.mat'));
    disp(['Current directory: ', inputSubDir]);
    disp('Matching .mat files:');
    %disp({matFiles.name});

   % 如果子目录中有名字含有"sleep data"的.mat文件，则进行处理
    if ~isempty(matFiles)
    % 如果输出子目录不存在，则创建新文件夹
        if ~exist(outputSubDir, 'dir')
            mkdir(outputSubDir);
        end   

    % 循环处理每个.mat文件
        for j = 1:length(matFiles)
            matFileName = matFiles(j).name; % .mat文件名称
            % 加载.mat文件中的数据并进行处理
            try
                % 加载.mat文件中的数据
                matFilePath = fullfile(inputSubDir, matFileName);
                data = load(matFilePath);
    
     
                % 提取数值数据（根据结构体成员名，假设保存数据的字段名为'data_field'，请根据实际情况修改）
                numericData = data.outputToStore.reshapedMtx;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                A = double(numericData); % 转换为双精度
               
                
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
            
            % 调用函数处理数据
    
            
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                try
                    assortativity = assortativity_wei(A,3);
                catch
                     fprintf('Error calculating assortativity for file: %s\n', matFileName);
                     continue;
                end
                %try
                    %betweenness = betweenness_wei(L);
                %catch
                     %fprintf('Error calculating betweenness for file: %s\n', matFileName);
                     %continue; 
                %end
                
                try
                    clustering = clustering_coef_wd(A);
                catch
                     fprintf('Error calculating clustering for file: %s\n', matFileName);
                     continue;
                end
                try
                    community = community_louvain(A);
                catch
                     fprintf('Error calculating community for file: %s\n', matFileName);
                     continue; 
                end
                C = community;
                try
                    corestructure = core_periphery_dir(A);
                catch
                     fprintf('Error calculating corestructure for file: %s\n', matFileName);
                     continue; 
                end
                try
                    [id,od,deg] = degrees_dir(A);
                catch
                     fprintf('Error calculating [id,od,deg] for file: %s\n', matFileName);
                     continue; 
                end
                try
                    kden = density_dir(A);
                catch
                     fprintf('Error calculating kden for file: %s\n', matFileName);
                     continue;
                end
                %try
                    %EBC = edge_betweenness_wei(L);
                %catch
                     %fprintf('Error calculating EBC for file: %s\n', matFileName);
                     %continue; 
                %end
                try
                    Eloc = efficiency_wei(A,2);
                catch
                     fprintf('Error calculating Eloc for file: %s\n', matFileName);
                     continue; 
                end
                try
                    [coreness,kn] = kcoreness_centrality_bd(A);
                catch
                     fprintf('Error calculating [coreness,kn] for file: %s\n', matFileName);
                     continue; 
                end
                try
                    participation = participation_coef(A,C);
                catch
                     fprintf('Error calculating participation for file: %s\n', matFileName);
                     continue;
                end
                try
                    richclub = rich_club_wd(A);
                catch
                     fprintf('Error calculating richclub for file: %s\n', matFileName);
                     continue;
                end
                
                try
                    [is,os,str] = strengths_dir(A);
                catch
                     fprintf('Error calculating [is,os,str] for file: %s\n', matFileName);
                     continue;
                end
                try
                    transitivity = transitivity_wd(A);
                catch
                     fprintf('Error calculating transitivity for file: %s\n', matFileName);
                     continue;
                end

                
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % 将结果保存到输出子目录中
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                result1FileName = strrep(matFileName, '.mat', '_assortativity.mat');
                %result2FileName = strrep(matFileName, '.mat', '_betweenness.mat');
               
                result5FileName = strrep(matFileName, '.mat', '_clustering.mat');
                result6FileName = strrep(matFileName, '.mat', '_community.mat');
                result7FileName = strrep(matFileName, '.mat', '_corestructure.mat');
                result8FileName = strrep(matFileName, '.mat', '_id.mat');
                result9FileName = strrep(matFileName, '.mat', '_od.mat');
                result10FileName = strrep(matFileName, '.mat', '_deg.mat');
                result11FileName = strrep(matFileName, '.mat', '_kden.mat');
                %result12FileName = strrep(matFileName, '.mat', '_EBC.mat');
                result13FileName = strrep(matFileName, '.mat', '_Eloc.mat');
                result14FileName = strrep(matFileName, '.mat', '_coreness.mat');
                result15FileName = strrep(matFileName, '.mat', '_kn.mat');
                result16FileName = strrep(matFileName, '.mat', '_participation.mat');
                result17FileName = strrep(matFileName, '.mat', '_richclub.mat');
                
                result21FileName = strrep(matFileName, '.mat', '_is.mat');
                result22FileName = strrep(matFileName, '.mat', '_os.mat');
                result23FileName = strrep(matFileName, '.mat', '_str.mat');
                result24FileName = strrep(matFileName, '.mat', '_transitivity.mat');
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                result1FilePath = fullfile(outputSubDir, result1FileName);
                %result2FilePath = fullfile(outputSubDir, result2FileName);
                
                result5FilePath = fullfile(outputSubDir, result5FileName);
                result6FilePath = fullfile(outputSubDir, result6FileName);
                result7FilePath = fullfile(outputSubDir, result7FileName);
                result8FilePath = fullfile(outputSubDir, result8FileName);
                result9FilePath = fullfile(outputSubDir, result9FileName);
                result10FilePath = fullfile(outputSubDir, result10FileName);
                result11FilePath = fullfile(outputSubDir, result11FileName);
                %result12FilePath = fullfile(outputSubDir, result12FileName);
                result13FilePath = fullfile(outputSubDir, result13FileName);
                result14FilePath = fullfile(outputSubDir, result14FileName);
                result15FilePath = fullfile(outputSubDir, result15FileName);
                result16FilePath = fullfile(outputSubDir, result16FileName);
                result17FilePath = fullfile(outputSubDir, result17FileName);
               
                result21FilePath = fullfile(outputSubDir, result21FileName);
                result22FilePath = fullfile(outputSubDir, result22FileName);
                result23FilePath = fullfile(outputSubDir, result23FileName);
                result24FilePath = fullfile(outputSubDir, result24FileName);
        
                save(result1FilePath, 'assortativity');
                %save(result2FilePath, 'betweenness');
                
                save(result5FilePath, 'clustering');
                save(result6FilePath, 'community');
                save(result7FilePath, 'corestructure');
                save(result8FilePath, 'id');
                save(result9FilePath, 'od');
                save(result10FilePath, 'deg');
                save(result11FilePath, 'kden');
                %save(result12FilePath, 'EBC');
                save(result13FilePath, 'Eloc');
                save(result14FilePath, 'coreness');
                save(result15FilePath, 'kn');
                save(result16FilePath, 'participation');
                save(result17FilePath, 'richclub');
             
                save(result21FilePath, 'is');
                save(result22FilePath, 'os');
                save(result23FilePath, 'str');
                save(result24FilePath, 'transitivity');
            catch
                 % 捕获异常并显示错误信息
                 fprintf('Error processing file: %s\n', matFileName);
                 continue; % 跳过当前.mat文件，继续处理下一个文件
            end

        end
     end 
    % 递归调用处理子目录的子目录
     processSubDirs(inputSubDir, outputSubDir);
 end
end
