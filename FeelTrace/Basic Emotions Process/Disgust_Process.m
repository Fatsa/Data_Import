% fileName means the file name
% path means the path of the file

% return
% disgust_Lines means the information of Disgust
% disgust_Count means the info line num + 1
function [disgust_Lines, disgust_Count]=Disgust_Process(fileName, pathName)
    % read the text by each sentence
    disgust_Lines=cell(50000,1);
    % count represent the count index of the line
    disgust_Count=1; 
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
            disgust_Lines{disgust_Count,1}=titleLine;
            disgust_Count=disgust_Count+1;
        end
    end
    % close the file stream
    fclose(ioStream);
end