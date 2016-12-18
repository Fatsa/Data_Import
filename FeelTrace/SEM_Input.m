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
%function FT_Data_Import (maindir)
function [FT_Data] = FT_Data_Import (maindir,export_FilePath)
    
    % subfolder path
    subdir  = dir( maindir );  
    
    % recording how many frequencies have been calculated
    index_List = zeros(12,12);
    % recording of the frequency data
    frequency = zeros(12,12);
    FT_Data = zeros(1,7);
    file_Number = 0;
    
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
        export_FilePath = strcat(export_FilePath,'/');
        export_FileName = strcat(export_FilePath,subdir( i ).name);
                
        % process each txt file
        if  ~iscell(fileName)
            fileName1 = cellstr(fileName);
%              [lines_Num, valence_Lines, arousal_Lines, power_Lines, ... 
%              expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, ...
%              happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, ... 
%              amusement_Lines]=FT_File_Selection(fileName1,pathName);

%          Calculation of Frequency
%             [temp_Frequency, index_List]=FT_Frequency (fileName1, pathName,index_List);
%             [frequency] = FT_Frequency_FinalMerge (temp_Frequency, frequency, index_List);
            [FT_Data1] = FT_Universality (fileName1, pathName,index_List);
        else
%             [lines_Num, valence_Lines, arousal_Lines, power_Lines, ... 
%             expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, ... 
%             happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, ... 
%             amusement_Lines]=FT_File_Selection(fileName,pathName);

%          Calculation of Frequency
%             [temp_Frequency, index_List]=FT_Frequency (fileName, pathName,index_List);
%             [frequency] = FT_Frequency_FinalMerge (temp_Frequency, frequency, index_List);
            [FT_Data1] = FT_Universality (fileName, pathName,index_List);
        end
        
        [FT_Data, file_Number] = FT_Universality_Merge(FT_Data, FT_Data1, file_Number);
        
%         % synchronize the data of each features and merge them in one data
%         % strucutre
%         [data_FeelTrace]=FT_Synchronization(lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines);
%         
%         % export the proessed data into a csv.file
%         FT_Export_Data(export_FileName,data_FeelTrace);
%         
%         export_FileName = strcat(export_FileName,'_overall');
%         [ov_Data_FeelTrace]=FT_Data_Merge(data_FeelTrace);
%         FT_Export_Data(export_FileName,ov_Data_FeelTrace);
    end
%    FT_Frequency_Export(export_FileName, frequency);
end

function [FT_Data,file_Number] = FT_Universality_Merge(FT_Data, FT_Data1,file_Number)
    if 0 == file_Number
        FT_Data = FT_Data1;
    else
        temp_length = size (FT_Data1);
        temp = zeros(temp_length(1), 7);
        target_length = size (FT_Data);
        
        % compare the length
        if temp_length(1) < target_length(1)
            for i = 1 : temp_length(1)
                for j = 1 : 7 
                    FT_Data (i,j) = (FT_Data(i,j)*file_Number +...
                        FT_Data1(i,j))/(file_Number+1);
                end
            end
        else
            for i = 1 : target_length(1)
                for j =1 : 7
                    FT_Data1 (i,j) = (FT_Data(i,j)*file_Number +...
                        FT_Data1(i,j))/(file_Number+1);
                end
            end
            FT_Data = FT_Data1;
        end
    end
    
    file_Number = file_Number +1;
end