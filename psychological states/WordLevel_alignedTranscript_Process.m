% fileName means the file name
% path means the path of the file
% return
% wordLevel_alignedTranscript_User means the user's text
% count means the text line num + 1
function [wordLevel_alignedTranscript_User, wordLevel_alignedTranscript_User_Line_Count]=WordLevel_alignedTranscript_Process(fileName, pathName)
    % read the text by each sentence
    wordLevel_alignedTranscript_User=cell(50000,1);
    % count represent the count index of the line
    wordLevel_alignedTranscript_User_Line_Count=1;
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    % open the file and store the data in IOStream
    % message is used to label the error
    % path including the file name and its path
    [ioStream,message] = fopen(path,'r');
    % select the type of the file and judge whether IOStream is empty or not
    % different type will be processed differently 
    if (0 ~= message) 
        fprintf('It is a error to open the file in Transcript_Process.m)\n');
        exit(EXIT_FAILURE);
    else 
        % check whehter the iosStream reach the end of the file stream
        while ~feof(ioStream)
            %read each line
            titleLine = fgetl(ioStream);
            wordLevel_alignedTranscript_User{wordLevel_alignedTranscript_User_Line_Count,1}=titleLine;
            wordLevel_alignedTranscript_User_Line_Count=wordLevel_alignedTranscript_User_Line_Count+1;
        end
    end
    % close the file stream
    fclose(ioStream);
end