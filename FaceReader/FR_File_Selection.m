% this function used to match the file to the correct process
% FR_FileName only contains the name of the file
% FR_PathName only have the absolute path of the file
% 
% Features included in the calculation
% Video Time	
% Neutral	
% Happy	
% Sad	
% Angry	
% Surprised	
% Scared	
% Disgusted	
% Valence	
% Arousal	
% Stimulus	
% Event Marker

function [FR_Lines, lines_Num]=FR_File_Selection (fileName, pathName)    
    %initialization
    % lines_Num represent the lines num of the file
    lines_Num = 0; 
    % file_Num represent the number of the inputed file
    file_Num = 0;
    % define the data_Cluster for FaceReader transcript
    FR_Lines=cell(30000,9);
    for n = 1: length(fileName)
        [file_Num, FR_Lines, count] = FR_Data_Process(fileName{n}, pathName, FR_Lines, file_Num);
        [lines_Num] = FR_Maximum(lines_Num,count);
        fprintf('%s has been matched file\n',fileName{n})
    end 
end

function [file_Num, FR_Lines, count]=FR_Data_Process(fileName, pathName, FR_Lines, file_Num)
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    % open the file and store the data in IOStream
    % message is used to label the error
    % path including the file name and its path
    [ioStream,message] = fopen(path,'r');
    % select the type of the file and judge whether IOStream is empty or not
    % different type will be processed differently 
    count = 0;
    if (0 ~= message) 
        fprintf(message);
        exit(EXIT_FAILURE);
    else
        % record the length of the file
        i = 0;
        while ~feof(ioStream)
            % skip the first nine rows
            if i<9
                i=i+1;
                continue;
            end
            count = count+1;
        end
        % start to process and record the content
        if ( 0 == file_Num)
            % define the data cluster for FaceReader transcripts
            % Video Time - 1
            % Neutral - 2
            % Happy	- 3
            % Sad - 4
            % Angry - 5
            % Surprised - 6	
            % Scared - 7
            % Disgusted - 8
            % Valence - 9
            % Arousal - 10
            % Stimulus - 11 : is not included
            % Event Marker - 12 is not included
            
            % start to record
            % define the index for FR_Lines
            index = 1;
            i=0;
            while ~feof(ioStream)
                % skip the first nine rows
                if i<9
                    i=i+1;
                    continue;
                end
               
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                for j=1:9
                    FR_Lines(index,j)=str2double(b{j});
                end
            end
            file_Num = file_Num+1;
        else
            % define the data cluster for FaceReader transcripts
            % Video Time - 1
            % Neutral - 2
            % Happy	- 3
            % Sad - 4
            % Angry - 5
            % Surprised - 6	
            % Scared - 7
            % Disgusted - 8
            % Valence - 9
            % Arousal - 10
            % Stimulus - 11 : is not included
            % Event Marker - 12 is not included
            
            % start to record
            % define the index for FR_Lines
            index = 1;
            i=0;
            while ~feof(ioStream)
                % skip the first nine rows
                if i<9
                    i=i+1;
                    continue;
                end
               
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                for j=1:9
                    FR_Lines(index,j)=(FR_Lines(index,j)*file_Num+str2double(b{j}))/(file_Num+1);
                end
                index=index+1;
            end
        end
        % record the processede file number
        file_Num = file_Num+1;
    end
    % close the file stream
    fclose(ioStream);
end

function [lines_Num]=FR_Maximum(lines_Num,count)
    if 0==lines_Num
        lines_Num = count;
    else
        if lines_Num<count
            lines_Num=count;
        end
    end
end