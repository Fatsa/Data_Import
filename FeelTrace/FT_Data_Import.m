% this function used to import all the data in one sample
% FileName only contains the name of the file
% PathName only have the absolute path of the file

% return 
% user_Transcript,
% wordLevel_Transcript_Timings,
% arousal_Data,
% arousal_Timings,
% valence_Data, 
% valence_Timings,
% power_Data, 
% power_Timings
% expectation_Data,
% expectation_Timings
% intensity_Data
% intensity_Timings
% anger_Data,
% anger_Timings
function FT_Data_Import (maindir)
%     file_Structure = dir(pathName); 
%     % the first 3 file are MAC os file isntead of data file
%     for i=3:size(file_Structure)     
%         fileName=file_Structure(i).name;
%         % check the file exitst
%         if pathName == 0
%            return;
%         end
%         fprintf(pathName);
%         fprintf('\n');

    % exported file absolute path
    export_FilePath = '/Users/village/Desktop/Data_MasterThesis/Obadiah/FeelTrace/';
   
    % subfolder path
    subdir  = dir( maindir );  
    % process each subfolder
    for i = 1 : length( subdir )
        % if it is not the path of folder, it will just be skipped
        if( isequal( subdir( i ).name, '.' )||...
                isequal( subdir( i ).name, '..')||...
                ~subdir( i ).isdir)               
            continue;
        end
        % collect all the txt files under the subfolder
        subdirpath = fullfile( maindir, subdir( i ).name, '*.txt' );
        % the set of filenames of txt files
        dat = dir( subdirpath );

        % the set of file names
        b = length(dat);
        fileName = cell(b,1);
        for j = 1 : length( dat )
            fileName(j)= cellstr(dat(j).name);
        end    
        
        % fullfile the absolute path of txt file
        pathName = fullfile( maindir, subdir( i ).name);
        % fullfile the absolute path export folder
        export_FileName = strcat(export_FilePath,subdir( i ).name);
                
        % process each txt file
        if  ~iscell(fileName)
            fileName1 = cellstr(fileName);
            [lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines]=FT_File_Selection(fileName1,pathName);
        else
            [lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines]=FT_File_Selection(fileName,pathName);
        end

        % synchronize the data of each features and merge them in one data
        % strucutre
        [data_FeelTrace]=FT_Synchronization(lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines);

        FT_Export_Data(export_FileName,data_FeelTrace);
    end
end