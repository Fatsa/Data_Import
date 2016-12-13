% record features from Feeltrace
% these features arer universal which crossing tools
% including 
% Arousal - 1
% Valence - 2
% Fear - 3
% Anger - 4
% Happiness -5
% Saddness - 6
% Disgust - 7

function [FT_Data]=FT_Universality (fileName, pathName,index_List)
    arousal_Frequency = zeros(1,1);
    valence_Frequency = zeros(1,1);
    fear_Frequency = zeros(1,1);
    anger_Frequency = zeros(1,1);
    happiness_Frequency = zeros(1,1);
    saddness_Frequency = zeros(1,1);
    disgust_Frequency = zeros(1,1);
    index = zeros(12,1);
    
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
            % collect all the related feature values
            [temp_Matrix, count, index(1,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(1,1));
            % merage them into one matrix
            [arousal_Frequency] = FT_Frequency_Merge (arousal_Frequency, temp_Matrix, index(1,1), count);
                
        % DV means the Valence
        elseif (0==isempty(strfind(fileName{n},'DV')))
            % collect all the related feature values
            [temp_Matrix, count, index(2,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(2,1));
            % merage them into one matrix
            [valence_Frequency] = FT_Frequency_Merge (valence_Frequency, temp_Matrix, index(2,1), count);
 
        % DFr means the fear
        elseif (0==isempty(strfind(fileName{n},'DFr')))
            % collect all the related feature values
            [temp_Matrix, count, index(6,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(6,1));
            % merage them into one matrix
            [fear_Frequency] = FT_Frequency_Merge (fear_Frequency, temp_Matrix, index(6,1), count);
                
        % DAn means the anger
        % fileName doesn't contain DAntg
        % fileName doesn't contain DAnomSim
        elseif ((0~=isempty(strfind(fileName{n},'DAntg')))&& ... 
                (0~=isempty(strfind(fileName{n},'DAnomSim')))&& ... 
                (0==isempty(strfind(fileName{n},'DAn'))))
            % collect all the related feature values
            [temp_Matrix, count, index(7,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(7,1));
            % merage them into one matrix
            [anger_Frequency] = FT_Frequency_Merge (anger_Frequency, temp_Matrix, index(7,1), count);
                
        % DHp means happiness
        elseif (0==isempty(strfind(fileName{n},'DHp')))
            % collect all the related feature values
            [temp_Matrix, count, index(8,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(8,1));
            % merage them into one matrix
            [happiness_Frequency] = FT_Frequency_Merge (happiness_Frequency, temp_Matrix, index(8,1), count);
            
        % DSd means saddness
        elseif (0==isempty(strfind(fileName{n},'DSd')))
            % collect all the related feature values
            [temp_Matrix, count, index(9,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(9,1));
            % merage them into one matrix
            [saddness_Frequency] = FT_Frequency_Merge (saddness_Frequency, temp_Matrix, index(9,1), count);
            
        % DDg means digust
        elseif (0==isempty(strfind(fileName{n},'DDg')))
            % collect all the related feature values
            [temp_Matrix, count, index(10,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(10,1));
            % merage them into one matrix
            [disgust_Frequency] = FT_Frequency_Merge (disgust_Frequency, temp_Matrix, index(10,1), count);
        else
            fprintf('%s is No matched file\n',fileName{n});
        end
    end
  
    % calculate the sensivitiy detalied value
    % Frequency contains average value, SD, SD of SD from above features
    [FT_Data] = FT_Universality_Merge (arousal_Frequency, ... 
        valence_Frequency, fear_Frequency, anger_Frequency, ...
        happiness_Frequency, saddness_Frequency, disgust_Frequency, ...
        index_List);
end

% collect the data 
% FileName only contains the name of the file
% PathName only have the absolute path of the file
% 
function [temp_Matrix, count, index]=FT_Frequency_Collection(fileName, pathName, index)
    % count represent the count index of the line
    count=1;
    % define the temp matrix
    temp_Matrix=zeros(50000,1);
    
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
        % check whehter the iosStream reach the end of the file stream
        while ~feof(ioStream)
            %read each line
            titleLine = fgetl(ioStream);
            b = strsplit(titleLine,' ');
            % time value is not needed
            %temp_matrix(count,1)=str2double(b{1});
            if 50000 == count
                fprintf ('Boom!\n');
            else
                if 0==isempty(b{2})
                    temp_Matrix(count,1)=str2double(b{2});
                    count=count+1;
                else
                    fprintf('ID:%d;  Content:%s', count, b{2});
                end
            end
        end
    end
    % close the file stream
    fclose(ioStream);
    index = index +1;
end

% merage differnt file data into one matrix
function [frequency, index] = FT_Frequency_Merge (target_Frequency, temp_Matrix, index, count)
    [M,N] = size(target_Frequency);
    temp = zeros (count, 1);
    for i=1:count 
        temp(i,1) = temp_Matrix(i,1);
    end
    if (1 == M)
        frequency = temp;
    else
        if count > M
            for i = 1 : M
                temp (i,1) = (target_Frequency(i,1)*(index-1)+temp(i,1))/index;     
            end
            frequency = temp;
        else
            for i = 1 : count
                target_Frequency (i,1) = (target_Frequency(i,1)*(index-1)+temp(i,1))/index;    
            end
            frequency = target_Frequency;
        end
    end
end

function     [FT_Data] = FT_Universality_Merge (arousal_Frequency, ... 
        valence_Frequency, fear_Frequency, anger_Frequency, ...
        happiness_Frequency, saddness_Frequency, disgust_Frequency, ...
        index_List)
    % select the maximum length of all Frequency
    length = 0;
    l_Arousal = size(arousal_Frequency);
    l_Valence = size(valence_Frequency);
    l_Fear = size(fear_Frequency);
    l_Anger = size(anger_Frequency);
    l_Happiness = size(happiness_Frequency);
    l_Saddness = size(saddness_Frequency);
    l_Disgust = size(disgust_Frequency);
    % try find oout the longest length
    if length < l_Arousal(1)
        length = l_Arousal(1);
    elseif length < l_Valence(1)
        length = l_Valence(1);
    elseif length < l_Fear(1)
        length = l_Fear(1);
    elseif length < l_Anger(1)
        length = l_Anger(1);
    elseif length < l_Happiness(1)
        length = l_Happiness(1);
    elseif length < l_Saddness(1)
        length = l_Saddness(1);
    elseif length < l_Disgust(1)
        length = l_Disgust(1);
    end
    % defien the FT_Data size
    FT_Data = zeros(length, 7);
    % start to record the common feature data
    % arousal
    for i = 1 : l_Arousal(1)
        FT_Data(i,1) = arousal_Frequency(i,1);
    end
    % valence
    for i = 1 : l_Valence(1)
        FT_Data(i,2) = valence_Frequency(i,1);
    end
    % fear
    for i = 1 : l_Fear(1)
        FT_Data(i,3) = fear_Frequency(i,1);
    end
    % anger
    for i = 1 : l_Anger(1)
        FT_Data(i,4) = anger_Frequency(i,1);
    end
    % happiness
    for i = 1 : l_Happiness(1)
        FT_Data(i,5) = happiness_Frequency(i,1);
    end 
    % saddness
    for i = 1 : l_Saddness(1)
        FT_Data(i,6) = saddness_Frequency(i,1);
    end
    % disgust
    for i = 1 : l_Disgust(1)
        FT_Data(i,7) = disgust_Frequency(i,1);
    end 
end
