% calculate the sensitivity of features
% FileName only contains the name of the file
% PathName only have the absolute path of the file

% - features - 
% arousal - 1
% valence - 2
% powe - 3
% expectation - 4 
% intensity - 5
% fear - 6
% anger - 7
% happiness - 8 
% saddness - 9
% disgust - 10
% contempt - 11
% amusement - 12

function [sensitivity]=FT_Sensitivity (fileName, pathName)
    % collect all the data according to each feature
    for n = 1: length(fileName)
        fprintf('%s start to process file\n',fileName{n})
        % DA means the Activation/Arousal
        % fileName doesn't contain DAn
        % fileName doesn't contain DAm
        % fileName doesn't contain DAgre
        % fileName doesn't contain DAntg
        % fileName doesn't contain DASug
        % fileName doesn't contain DAInf
        % fileName doesn't contain DAnomSim  
        if ((0~=isempty(strfind(fileName{n},'DAn')))&& ... 
            (0~=isempty(strfind(fileName{n},'DAm')))&& ...
            (0~=isempty(strfind(fileName{n},'DAgre')))&& ... 
            (0~=isempty(strfind(fileName{n},'DAntg')))&& ... 
            (0~=isempty(strfind(fileName{n},'DASug')))&& ... 
            (0~=isempty(strfind(fileName{n},'DAInf')))&& ... 
            (0~=isempty(strfind(fileName{n},'DAnomSim')))&& ... 
            (0==isempty(strfind(fileName{n},'DA'))))
                valence_sensitivity=FT_Sensitivity_Collection(fileName, pathName);
                [sensitivity] = FT_Sensitivity_Merge (sensitivity, valence_sensitivity);
        % DV means the Valence
        elseif (0==isempty(strfind(fileName{n},'DV')))

        % DP means the Power
        elseif (0==isempty(strfind(fileName{n},'DP')))

        % DE means the Anticipation/Expectation
        % fileName doesn't contain DEase
        elseif ((0~=isempty(strfind(fileName{n},'DEase')))&&(0==isempty(strfind(fileName{n},'DE'))))

        % DI means the Intensity
        % fileName doesn't contain DIntr
        elseif ((0~=isempty(strfind(fileName{n},'DIntr')))&&(0==isempty(strfind(fileName{n},'DI'))))

        % DFr means the fear
        elseif (0==isempty(strfind(fileName{n},'DFr')))

        % DAn means the anger
        % fileName doesn't contain DAntg
        % fileName doesn't contain DAnomSim
        elseif ((0~=isempty(strfind(fileName{n},'DAntg')))&&(0~=isempty(strfind(fileName{n},'DAnomSim')))&&(0==isempty(strfind(fileName{n},'DAn'))))

        % DHp means happiness
        elseif (0==isempty(strfind(fileName{n},'DHp')))

        % DSd means saddness
        elseif (0==isempty(strfind(fileName{n},'DSd')))

        % DDg means digust
        elseif (0==isempty(strfind(fileName{n},'DDg')))

        % DCt means contempt
        elseif (0==isempty(strfind(fileName{n},'DCt')))

        % DAm means amusement
        elseif (0==isempty(strfind(fileName{n},'DAm')))

        else
            %fprintf('%s is No matched file\n',fileName{n});
        end
    end
  
    % calculate the sensivitiy detalied value
    % sensitivity contains average value, SD, SD of SD from above features
    sensitivity = FT_Sensitivity_Calculation ();
end

% collect the data 
% FileName only contains the name of the file
% PathName only have the absolute path of the file
% 
function FT_Sensitivity_Collection(fileName, pathName, num)
    % count represent the count index of the line
    count=1;
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    % open the file and store the data in IOStream
    % message is used to label the error
    % path including the file name and its path
    [ioStream,message] = fopen(path,'r');
    % select the type of the file and judge whether IOStream is empty or not
    % different type will be processed differently 
    
    if (0 ~= message) 
        fprintf(message);
        exit(EXIT_FAILURE);
    else 
        if (0 == num)
            % check whehter the iosStream reach the end of the file stream
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                lines{count,1}=str2double(b{1});
                lines{count,2}=str2double(b{2});
                count=count+1;
            end
            num=num+1;
        else
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                a = size(b);
                if (1 == a(2))
                    fprintf('lines is not big enough for input file\n');
                    continue;
                else
                    if (0 == isempty(b(1)))
                        % extract the time vlaue
                        if(1 == isempty(lines{count,1}))
                           
                            lines{count,1}=str2double(b{1});
                        % recalculated the repeated part of lines
                        else
                            lines{count,1}=(lines{count,1}*num+str2double(b{1}))/(num+1);
                        end
                    else
                        fprintf('input data is empty')
                    end
                    if (0 == isempty(b(2)))
                        % extract the value of each feature
                        if(1 == isempty(lines{count,2}))
                            lines{count,2}=str2double(b{2});
                        % recalculated the repeated part of lines
                        else
                            lines{count,2}=(lines{count,2}*num+str2double(b{2}))/(num+1);
                        end
                    else
                        fprintf('input data is empty')
                    end
                    count=count+1;
                end
            end
            num=num+1;
        end
    end
    % close the file stream
    fclose(ioStream);
end

% merage differnt file data into one matrix
function [] = FT_Sensitivity_Merge ()
end

% calculate the sensitivity
function FT_Sensitivity_Calculation()
end