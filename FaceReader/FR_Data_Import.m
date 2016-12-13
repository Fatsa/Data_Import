% Features included in the calculation
% Video Time 1
% Neutral	 2
% Happy	3
% Sad	4
% Angry	5
% Surprised	6
% Scared	7
% Disgusted	8
% Valence	9
% Arousal	10
% Stimulus	
% Event Marker

function [FR_Data] = FR_Data_Import (maindir,export_FilePath)
    % recording of the frequency data
    frequency = zeros(9,9);
    
    % collect all the txt files under the subfolder
    subdirpath = fullfile( maindir, '*.txt' );
    % the set of filenames of txt files
    dat = dir( subdirpath );

    % the set of file names
    b = length(dat);
    fileName = cell(b,1);
    for j = 1 : length( dat )
        fileName(j)= cellstr(dat(j).name);
    end    

    % fullfile the absolute path of txt file
    pathName = fullfile( maindir);
    export_FileName = strcat(export_FilePath,'/Overall');
 
    
    % function of FR_Sensitivity
    if  ~iscell(fileName)
        fileName1 = cellstr(fileName);
%         % sensitivity 
%        [FR_Lines_temp]=FR_Sensitivity (fileName1, pathName, export_FileName);

%         % frequency
%         [data_Frequency]=FR_Frequency (fileName1, pathName);
%         [frequency] = FR_Frequency_Calculation (data_Frequency, frequency);
         
        % Universality
        [FR_Data] = FR_Universality(fileName1, pathName);
    else
%          % Sensitivity
%        [FR_Lines_temp]=FR_Sensitivity (fileName, pathName, export_FileName);

%         % frequency
%         [data_Frequency]=FR_Frequency (fileName, pathName);
%         [frequency] = FR_Frequency_Calculation (data_Frequency, frequency);

        % Universality 
        [FR_Data] = FR_Universality(fileName, pathName);
    end    
%     % export
%    FR_Frequency_Export(export_FileName, frequency);   
    
%      % function of FR_File_Selection    
%     % process each txt file
%     if  ~iscell(fileName)
%         fileName1 = cellstr(fileName);
%         [FR_Lines_temp, lines_Num]=FR_File_Selection(fileName1,pathName);
%     else
%         [FR_Lines_temp, lines_Num]=FR_File_Selection(fileName,pathName);
%     end
% 
%     % structurize the final data 
%     [data_FaceReader]=FR_Synchronization(FR_Lines_temp, lines_Num);
% 
%     % export the proessed data into a csv.file
%     FR_Export_Data(export_FileName,data_FaceReader);
%     
%     % change the export name
%     export_FileName = strcat(export_FilePath,'/Merge');
%     % merge the final data
%     [Merge_FaceReader] = FR_Data_Merge(data_FaceReader);
%    
%     % export the proessed data into a csv.file
%     FR_Export_Data(export_FileName,Merge_FaceReader);
end