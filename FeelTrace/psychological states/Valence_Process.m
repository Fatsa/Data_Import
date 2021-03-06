% fileName means the file name
% path means the path of the file
% return
% valence_Lines means the information of valence
% valence_Count means the info line num + 1
function [valence_Lines, valence_Count,valence_num]=Valence_Process(fileName, pathName,valence_num)
    % read the text by each sentence
    valence_Lines=cell(50000,2);
    % count represent the count index of the line
    valence_Count=1;
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
        if (0 == valence_num)
            % check whehter the iosStream reach the end of the file stream
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                valence_Lines{valence_Count,1}=str2double(b{1});
                valence_Lines{valence_Count,2}=str2double(b{2});
                valence_Count=valence_Count+1;
            end
            valence_num=valence_num+1;
        else
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                valence_Lines{valence_Count,1}=(valence_Lines{valence_Count,1}*valence_num+str2double(b{1}))/(valence_num+1);
                valence_Lines{valence_Count,2}=(valence_Lines{valence_Count,2}*valence_num+str2double(b{2}))/(valence_num+1);
                valence_Count=valence_Count+1;
            end
            valence_num=valence_num+1;
        end
    end
    % close the file stream
    fclose(ioStream);
end