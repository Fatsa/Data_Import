% this function used to match the file to the correct process
% FR_FileName only contains the name of the file
% FR_PathName only have the absolute path of the file
% 
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

function [FR_Lines, lines_Num]=FR_File_Selection (fileName, pathName)    
    %initialization
    % lines_Num represent the lines num of the file
    lines_Num = 0; 
    % file_Num represent the number of the inputed file
    file_Num = 0;
    % define the data_Cluster for FaceReader transcript
    FR_Lines=cell(30000,10);
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
    % record the length of the file 
    count = 0;
    % select the type of the file and judge whether IOStream is empty or not
    % different type will be processed differently 
    if (0 ~= message) 
        fprintf(message);
        exit(EXIT_FAILURE);
    else
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
            i=0;
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                % skip the first nine rows
                if i<9
                    i=i+1;
                    continue;
                end
              
                % b = strsplit(titleLine,'');
                b = regexp(titleLine, '\s+', 'split');
                
                count = count+1;
                for j=1:10
                    if 1 == j
                        % assign the time value 
                        expression = '(?<hour>\d+):(?<minute>\d+):(?<second>\d+).(?<rest>\d+)';
                        time_Line = regexp(b{j}, expression, 'names');
                        hour = str2double(time_Line.hour)*60;
                        minute = str2double(time_Line.minute)*60;
                        second = str2double(time_Line.second);
                        rest = str2double(time_Line.rest)/1000;
                        time = hour+minute+second+rest;
                        FR_Lines{count,j}=time;
                    else
                        % assign the feature value
                        % the element of FR_Lines becomes double not cell
                        if (0 == strcmp('FIT_FAILED',b{j})&&(0 == strcmp('FIND_FAILED', b{j})))
                            FR_Lines{count,j}=str2double(b{j}); 
                        else
                            FR_Lines{count,j} = 0;
                            fprintf('there is a FAILED data (FIT_FAILED/FIND_FAILED)\n');
                        end
                    end
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
            i=0;
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                
                % skip the first nine rows
                if i<9
                    i=i+1;
                    continue;
                end
                
                count = count+1;
                b = regexp(titleLine, '\s+', 'split');
                for j=1:10
                    if 1 == j
                        % calculate the time value 
                        expression = '(?<hour>\d+):(?<minute>\d+):(?<second>\d+).(?<rest>\d+)';
                        time_Line = regexp(b{j}, expression, 'names');
                        hour = str2double(time_Line.hour)*60;
                        minute = str2double(time_Line.minute)*60;
                        second = str2double(time_Line.second);
                        rest = str2double(time_Line.rest)/1000;
                        time = hour+minute+second+rest; 
                        % if the FR_Lines is not empty
                        if 0 == isempty(FR_Lines{count,j})
                            FR_Lines{count,j}=(FR_Lines{count,j}*file_Num+time)/(file_Num+1);
                        % if the FR_Lines is empty
                        else 
                            FR_Lines{count,j}=time;                               
                        end
                        
                    else
                        % assign the feature value
                        % the element of FR_Lines is double not cell after
                        % the case of file_Num=0
                        if (0 == strcmp('FIT_FAILED',b{j})&&(0 == strcmp('FIND_FAILED', b{j})))
                            if 0 == isempty(FR_Lines{count,j})
                                FR_Lines{count,j}=(FR_Lines{count,j}*file_Num+str2double(b{j}))/(file_Num+1);
                            else 
                                FR_Lines{count,j}=str2double(b{j});                               
                            end
                        else
                            % FR_Lines{cout,j} remain the same
                            % use the previous value to represent the
                            % missing element
                            if 0 == isempty(FR_Lines{count,j})
                                FR_Lines{count,j}=(FR_Lines{count,j}*file_Num+0)/(file_Num+1);
                            else 
                                FR_Lines{count,j}=0;                               
                            end
                            fprintf('there is a FAILED data (FIT_FAILED/FIND_FAILED)\n');
                        end
                    end
                end
            end
            % record the processede file number
            file_Num = file_Num+1;
        end
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