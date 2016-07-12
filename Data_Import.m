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
function [wordLevel_Transcript,wordLevel_Transcript_Timings,arousal_Data,arousal_Timings,valence_Data, valence_Timings,power_Data, power_Timings,expectation_Data,expectation_Timings,intensity_Data,intensity_Timings,fear_Data,fear_Timings,anger_Data,anger_Timings,happiness_Data,happiness_Timings,saddness_Data,saddness_Timings,disgust_Data, disgust_Timings,contempt_Data,contempt_Timings,amusement_Data,amusement_Timings]=Data_Import (fileName, pathName)
    % check the file exitst
    if pathName == 0
       return;
    end
    % store the targeted file path into the 'filePath'
    % wordLevel_alignedTranscript_User means the user's text
    if  ~iscell(fileName)
        fileName1 = cellstr(fileName);
        [wordLevel_alignedTranscript_User,wordLevel_alignedTranscript_User_Line_Count,valence_Lines, valence_Count,arousal_Lines, arousal_Count,power_Lines, power_Count,expectation_Lines, expectation_Count,intensity_Lines, intensity_Count,fear_Lines, fear_Count,anger_Lines, anger_Count,happiness_Lines, happiness_Count,saddness_Lines, saddness_Count,disgust_Lines, disgust_Count,contempt_Lines, contempt_Count,amusement_Lines, amusement_Count]=File_Selection(fileName1,pathName);
    else
        [wordLevel_alignedTranscript_User,wordLevel_alignedTranscript_User_Line_Count,valence_Lines, valence_Count,arousal_Lines, arousal_Count,power_Lines, power_Count,expectation_Lines, expectation_Count,intensity_Lines, intensity_Count,fear_Lines, fear_Count,anger_Lines, anger_Count,happiness_Lines, happiness_Count,saddness_Lines, saddness_Count,disgust_Lines, disgust_Count,contempt_Lines, contempt_Count,amusement_Lines, amusement_Count]=File_Selection(fileName,pathName);
    end
    % process the data
    [wordLevel_Transcript,wordLevel_Transcript_Timings,arousal_Data,arousal_Timings,valence_Data, valence_Timings,power_Data, power_Timings,expectation_Data,expectation_Timings,intensity_Data,intensity_Timings,fear_Data,fear_Timings,anger_Data,anger_Timings,happiness_Data,happiness_Timings,saddness_Data,saddness_Timings,disgust_Data, disgust_Timings,contempt_Data,contempt_Timings,amusement_Data,amusement_Timings]=Data_Process(wordLevel_alignedTranscript_User,wordLevel_alignedTranscript_User_Line_Count,arousal_Lines, arousal_Count,valence_Lines, valence_Count,power_Lines, power_Count,expectation_Lines,expectation_Count,intensity_Lines, intensity_Count,fear_Lines, fear_Count,anger_Lines, anger_Count,happiness_Lines, happiness_Count,saddness_Lines, saddness_Count,disgust_Lines, disgust_Count,contempt_Lines, contempt_Count,amusement_Lines, amusement_Count);
    
end