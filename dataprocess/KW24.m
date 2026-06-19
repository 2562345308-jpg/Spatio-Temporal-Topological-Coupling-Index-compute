clear;
clc;
% Initialize arrays to store assortativity values
x0 = [];

x2 = [];
x3 = [];

x8 = [];
x9 = [];

% Directory paths
baseDir = 'E:\processed_data\T_part\';
subDirs = {'G0', 'G2', 'G3', 'G8', 'G9'};
filePattern = 'average_richclub.mat';%%%%

% Loop through different groups
for groupIdx = 1:length(subDirs)
    groupDir = fullfile(baseDir, subDirs{groupIdx});
    
    % Find subdirectories with 'Sleep stage N1_' in their names
    subSubDirs = dir(fullfile(groupDir, '*/Sleep stage N1_'));%%%%%
    
    % Loop through sub-subdirectories
    for subSubDirIdx = 1:length(subSubDirs)
        resultsDir = fullfile(subSubDirs(subSubDirIdx).folder, subSubDirs(subSubDirIdx).name, 'results');
        
        % Check if 'average_assortativity.mat' file exists
        matFiles = dir(fullfile(resultsDir, filePattern));
        if ~isempty(matFiles)
            matFilePath = fullfile(matFiles(1).folder, matFiles(1).name);
           richclubData = load(matFilePath);
            richclubValue = richclubData.averagerichclub;%%%%%%%
            
            % Add assortativity value to the respective group's array
            switch groupIdx
                case 1
                    x0 = [x0, richclubValue];
                case 2
                    x2 = [x2, richclubValue];
                case 3
                    x3 = [x3, richclubValue];
                case 4
                    x8 = [x8, richclubValue];
                case 5
                    x9 = [x9, richclubValue];
            end
        end
    end
end

% Perform ranksum tests
[p_ranksum] = ranksum(x0, x2);
fprintf('Ranksum Test between x0 and x2:\n');
fprintf('p-value: %.4f\n', p_ranksum);
[p_ranksum] = ranksum(x0, x3);
fprintf('Ranksum Test between x0 and x3:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x0, x8);
fprintf('Ranksum Test between x0 and x8:\n');
fprintf('p-value: %.4f\n', p_ranksum);
[p_ranksum] = ranksum(x0, x9);
fprintf('Ranksum Test between x0 and x9:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x2, x3);
fprintf('Ranksum Test between x2 and x3:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x2, x8);
fprintf('Ranksum Test between x2 and x8:\n');
fprintf('p-value: %.4f\n', p_ranksum);
[p_ranksum] = ranksum(x2, x9);
fprintf('Ranksum Test between x2 and x9:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x3, x8);
fprintf('Ranksum Test between x3 and x8:\n');
fprintf('p-value: %.4f\n', p_ranksum);
[p_ranksum] = ranksum(x3, x9);
fprintf('Ranksum Test between x3 and x9:\n');
fprintf('p-value: %.4f\n', p_ranksum);

[p_ranksum] = ranksum(x8, x9);
fprintf('Ranksum Test between x8 and x9:\n');
fprintf('p-value: %.4f\n', p_ranksum);