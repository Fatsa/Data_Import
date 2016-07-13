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
function Data_Import (fileName, pathName)

    % check the file exitst
    if pathName == 0
       return;
    end
    % store the targeted file path into the 'filePath'
    % wordLevel_alignedTranscript_User means the user's text
    if  ~iscell(fileName)
        fileName1 = cellstr(fileName);
        [lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines]=File_Selection(fileName1,pathName);
    else
        [lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines]=File_Selection(fileName,pathName);
    end
    
    % synchronize the data of each features and merge them in one data
    % strucutre
    [data_FeelTrace]=Synchronization(lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines);
    
    % label the name of the exported file 
    character_Folder = '/Obadiah/FeelTrace/';
    ID = 'Obadiah_5';
    filename = strcat(character_Folder,ID);
    Export_Data_FeelTrace(filename,data_FeelTrace);
end