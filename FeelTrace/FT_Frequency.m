% calculate the frequency of features
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

  
function [ft_Frequency, index_List]=FT_Frequency (fileName, pathName,index_List)
    arousal_Frequency = zeros(1,1);
    valence_Frequency = zeros(1,1);
    power_Frequency = zeros(1,1);
    expectation_Frequency = zeros(1,1);
    intensity_Frequency = zeros(1,1);
    fear_Frequency = zeros(1,1);
    anger_Frequency = zeros(1,1);
    happiness_Frequency = zeros(1,1);
    saddness_Frequency = zeros(1,1);
    disgust_Frequency = zeros(1,1);
    contempt_Frequency = zeros(1,1);
    amusement_Frequency = zeros(1,1);
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
                
        % DP means the Power
        elseif (0==isempty(strfind(fileName{n},'DP')))
            % collect all the related feature values
            [temp_Matrix, count, index(3,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(3,1));
            % merage them into one matrix
            [power_Frequency] = FT_Frequency_Merge (power_Frequency, temp_Matrix, index(3,1), count);
                
        % DE means the Anticipation/Expectation
        % fileName doesn't contain DEase
        elseif ((0~=isempty(strfind(fileName{n},'DEase')))&& ... 
                (0==isempty(strfind(fileName{n},'DE'))))
            % collect all the related feature values
            [temp_Matrix, count, index(4,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(4,1));
            % merage them into one matrix
            [expectation_Frequency] = FT_Frequency_Merge (expectation_Frequency, temp_Matrix, index(4,1), count);
                
        % DI means the Intensity
        % fileName doesn't contain DIntr
        elseif ((0~=isempty(strfind(fileName{n},'DIntr')))&& ... 
                (0==isempty(strfind(fileName{n},'DI'))))
            % collect all the related feature values
            [temp_Matrix, count, index(5,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(5,1));
            % merage them into one matrix
            [intensity_Frequency] = FT_Frequency_Merge (intensity_Frequency, temp_Matrix, index(5,1), count);
                
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
            
        % DCt means contempt
        elseif (0==isempty(strfind(fileName{n},'DCt')))
            % collect all the related feature values
            [temp_Matrix, count, index(11,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(11,1));
            % merage them into one matrix
            [contempt_Frequency] = FT_Frequency_Merge (contempt_Frequency, temp_Matrix, index(11,1), count);
            
        % DAm means amusement
        elseif (0==isempty(strfind(fileName{n},'DAm')))
            % collect all the related feature values
            [temp_Matrix, count, index(12,1)]=FT_Frequency_Collection(fileName{n}, pathName, index(12,1));
            % merage them into one matrix
            [amusement_Frequency] = FT_Frequency_Merge (amusement_Frequency, temp_Matrix, index(12,1), count);
        else
            fprintf('%s is No matched file\n',fileName{n});
        end
    end
  
    % calculate the sensivitiy detalied value
    % Frequency contains average value, SD, SD of SD from above features
    [ft_Frequency, index_List] = FT_Frequency_Calculation (arousal_Frequency, ... 
        valence_Frequency, power_Frequency, expectation_Frequency, ...
        intensity_Frequency, fear_Frequency, anger_Frequency, ...
        happiness_Frequency, saddness_Frequency, disgust_Frequency, ...
        contempt_Frequency, amusement_Frequency, index_List);
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

% calculate the Frequency/correaltion 
function [FT_Frequency, index_List] = FT_Frequency_Calculation (arousal_Frequency, ... 
        valence_Frequency, power_Frequency, expectation_Frequency, ...
        intensity_Frequency, fear_Frequency, anger_Frequency, ...
        happiness_Frequency, saddness_Frequency, disgust_Frequency, ...
        contempt_Frequency, amusement_Frequency, index_List)
    
    % define the Frequency/Correlation matrix
    FT_Frequency = zeros(12,12);
    % judge whether list is null or not
    
    % arousal - arousal
        [FT_Frequency(1,1),Label] = FT_Frequency_Correlation (arousal_Frequency,arousal_Frequency);
        index_List (1,1) = index_List (1,1)+Label;
        % arousal - valence
        [FT_Frequency(1,2),Label] = FT_Frequency_Correlation (arousal_Frequency,valence_Frequency);
        index_List (1,2) = index_List (1,2)+Label;
        % arousal - power
        [FT_Frequency(1,3),Label] = FT_Frequency_Correlation (arousal_Frequency,power_Frequency);
        index_List (1,3) = index_List (1,3)+Label;
        % arousal - expectation
        [FT_Frequency(1,4),Label] = FT_Frequency_Correlation (arousal_Frequency,expectation_Frequency);
        index_List (1,4) = index_List (1,4)+Label;
        % arousal - intensity
        [FT_Frequency(1,5),Label] = FT_Frequency_Correlation (arousal_Frequency,intensity_Frequency);
        index_List (1,5) = index_List (1,5)+Label;
        % arousal - fear
        [FT_Frequency(1,6),Label] = FT_Frequency_Correlation (arousal_Frequency,fear_Frequency);
        index_List (1,6) = index_List (1,6)+Label;
        % arousal - anger
        [FT_Frequency(1,7),Label] = FT_Frequency_Correlation (arousal_Frequency,anger_Frequency);
        index_List (1,7) = index_List (1,7)+Label;
        % arousal - happiness
        [FT_Frequency(1,8),Label] = FT_Frequency_Correlation (arousal_Frequency,happiness_Frequency);
        index_List (1,8) = index_List (1,8)+Label;
        % arousal - saddness
        [FT_Frequency(1,9),Label] = FT_Frequency_Correlation (arousal_Frequency,saddness_Frequency);
        index_List (1,9) = index_List (1,9)+Label;
        % arousal - disgust
        [FT_Frequency(1,10),Label] = FT_Frequency_Correlation (arousal_Frequency,disgust_Frequency);
        index_List (1,10) = index_List (1,10)+Label;
        % arousal - contempt
        [FT_Frequency(1,11),Label] = FT_Frequency_Correlation (arousal_Frequency,contempt_Frequency);
        index_List (1,11) = index_List (1,11)+Label;
        % arousal - amusement
        [FT_Frequency(1,12),Label] = FT_Frequency_Correlation (arousal_Frequency,amusement_Frequency);
        index_List (1,12) = index_List (1,12)+Label; 
    
    % valence
        % valence - arousal
        [FT_Frequency(2,1),Label] = FT_Frequency_Correlation (valence_Frequency,arousal_Frequency);
        index_List (2,1) = index_List (2,1)+Label;
        % valence - valence
        [FT_Frequency(2,2),Label] = FT_Frequency_Correlation (valence_Frequency,valence_Frequency);
        index_List (2,2) = index_List (2,2)+Label;
        % valence - power
        [FT_Frequency(2,3),Label] = FT_Frequency_Correlation (valence_Frequency,power_Frequency);
        index_List (2,3) = index_List (2,3)+Label;
        % valence - expectation
        [FT_Frequency(2,4),Label] = FT_Frequency_Correlation (valence_Frequency,expectation_Frequency);
        index_List (2,4) = index_List (2,4)+Label;
        % valence - intensity
        [FT_Frequency(2,5),Label] = FT_Frequency_Correlation (valence_Frequency,intensity_Frequency);
        index_List (2,5) = index_List (2,5)+Label;
        % valence - fear
        [FT_Frequency(2,6),Label] = FT_Frequency_Correlation (valence_Frequency,fear_Frequency);
        index_List (2,6) = index_List (2,6)+Label;
        % valence - anger
        [FT_Frequency(2,7),Label] = FT_Frequency_Correlation (valence_Frequency,anger_Frequency);
        index_List (2,7) = index_List (2,7)+Label;
        % valence - happiness
        [FT_Frequency(2,8),Label] = FT_Frequency_Correlation (valence_Frequency,happiness_Frequency);
        index_List (2,8) = index_List (2,8)+Label;
        % valence - saddness
        [FT_Frequency(2,9),Label] = FT_Frequency_Correlation (valence_Frequency,saddness_Frequency);
        index_List (2,9) = index_List (2,9)+Label;
        % valence - disgust
        [FT_Frequency(2,10),Label] = FT_Frequency_Correlation (valence_Frequency,disgust_Frequency);
        index_List (2,10) = index_List (2,10)+Label;
        % valence - contempt
        [FT_Frequency(2,11),Label] = FT_Frequency_Correlation (valence_Frequency,contempt_Frequency);
        index_List (2,11) = index_List (2,11)+Label;
        % valence - amusement
        [FT_Frequency(2,12),Label] = FT_Frequency_Correlation (valence_Frequency,amusement_Frequency);
        index_List (2,12) = index_List (2,12)+Label;
    
    % power
        % power - arousal
        [FT_Frequency(3,1),Label] = FT_Frequency_Correlation (power_Frequency,arousal_Frequency);
        index_List (3,1) = index_List (3,1)+Label;
        % power - valence
        [FT_Frequency(3,2),Label] = FT_Frequency_Correlation (power_Frequency,valence_Frequency);
        index_List (3,2) = index_List (3,2)+Label;
        % power - power
        [FT_Frequency(3,3),Label] = FT_Frequency_Correlation (power_Frequency,power_Frequency);
        index_List (3,3) = index_List (3,3)+Label;
        % power - expectation
        [FT_Frequency(3,4),Label] = FT_Frequency_Correlation (power_Frequency,expectation_Frequency);
        index_List (3,4) = index_List (3,4)+Label;
        % power - intensity
        [FT_Frequency(3,5),Label] = FT_Frequency_Correlation (power_Frequency,intensity_Frequency);
        index_List (3,5) = index_List (3,5)+Label;
        % power - fear
        [FT_Frequency(3,6),Label] = FT_Frequency_Correlation (power_Frequency,fear_Frequency);
        index_List (3,6) = index_List (3,6)+Label;
        % power - anger
        [FT_Frequency(3,7),Label] = FT_Frequency_Correlation (power_Frequency,anger_Frequency);
        index_List (3,7) = index_List (3,7)+Label;
        % power - happiness
        [FT_Frequency(3,8),Label] = FT_Frequency_Correlation (power_Frequency,happiness_Frequency);
        index_List (3,8) = index_List (3,8)+Label;
        % power - saddness
        [FT_Frequency(3,9),Label] = FT_Frequency_Correlation (power_Frequency,saddness_Frequency);
        index_List (3,9) = index_List (3,9)+Label;
        % power - disgust
        [FT_Frequency(3,10),Label] = FT_Frequency_Correlation (power_Frequency,disgust_Frequency);
        index_List (3,10) = index_List (3,10)+Label;
        % power - contempt
        [FT_Frequency(3,11),Label] = FT_Frequency_Correlation (power_Frequency,contempt_Frequency);
        index_List (3,11) = index_List (3,11)+Label;
        % power - amusement
        [FT_Frequency(3,12),Label] = FT_Frequency_Correlation (power_Frequency,amusement_Frequency);
        index_List (3,12) = index_List (3,12)+Label;
        
    % expectation
        % expectation - arousal
        [FT_Frequency(4,1),Label] = FT_Frequency_Correlation (expectation_Frequency,arousal_Frequency);
        index_List (4,1) = index_List (4,1)+Label;
        % expectation - valence
        [FT_Frequency(4,2),Label] = FT_Frequency_Correlation (expectation_Frequency,valence_Frequency);
        index_List (4,2) = index_List (4,2)+Label;
        % expectation - power
        [FT_Frequency(4,3),Label] = FT_Frequency_Correlation (expectation_Frequency,power_Frequency);
        index_List (4,3) = index_List (4,3)+Label;
        % expectation - expectation
        [FT_Frequency(4,4),Label] = FT_Frequency_Correlation (expectation_Frequency,expectation_Frequency);
        index_List (4,4) = index_List (4,4)+Label;
        % expectation - intensity
        [FT_Frequency(4,5),Label] = FT_Frequency_Correlation (expectation_Frequency,intensity_Frequency);
        index_List (4,5) = index_List (4,5)+Label;
        % expectation - fear
        [FT_Frequency(4,6),Label] = FT_Frequency_Correlation (expectation_Frequency,fear_Frequency);
        index_List (4,6) = index_List (4,6)+Label;
        % expectation - anger
        [FT_Frequency(4,7),Label] = FT_Frequency_Correlation (expectation_Frequency,anger_Frequency);
        index_List (4,7) = index_List (4,7)+Label;
        % expectation - happiness
        [FT_Frequency(4,8),Label] = FT_Frequency_Correlation (expectation_Frequency,happiness_Frequency);
        index_List (4,8) = index_List (4,8)+Label;
        % expectation - saddness
        [FT_Frequency(4,9),Label] = FT_Frequency_Correlation (expectation_Frequency,saddness_Frequency);
        index_List (4,9) = index_List (4,9)+Label;
        % expectation - disgust
        [FT_Frequency(4,10),Label] = FT_Frequency_Correlation (expectation_Frequency,disgust_Frequency);
        index_List (4,10) = index_List (4,10)+Label;
        % expectation - contempt
        [FT_Frequency(4,11),Label] = FT_Frequency_Correlation (expectation_Frequency,contempt_Frequency);
        index_List (4,11) = index_List (4,11)+Label;
        % expectation - amusement
        [FT_Frequency(4,12),Label] = FT_Frequency_Correlation (expectation_Frequency,amusement_Frequency);
        index_List (4,12) = index_List (4,12)+Label;
    
    % intensity
        % intensity - arousal
        [FT_Frequency(5,1),Label] = FT_Frequency_Correlation (intensity_Frequency,arousal_Frequency);
        index_List (5,1) = index_List (5,1)+Label;
        % intensity - valence
        [FT_Frequency(5,2),Label] = FT_Frequency_Correlation (intensity_Frequency,valence_Frequency);
        index_List (5,2) = index_List (5,2)+Label;
        % intensity - power
        [FT_Frequency(5,3),Label] = FT_Frequency_Correlation (intensity_Frequency,power_Frequency);
        index_List (5,3) = index_List (5,3)+Label;
        % intensity - expectation
        [FT_Frequency(5,4),Label] = FT_Frequency_Correlation (intensity_Frequency,expectation_Frequency);
        index_List (5,4) = index_List (5,4)+Label;
        % intensity - intensity
        [FT_Frequency(5,5),Label] = FT_Frequency_Correlation (intensity_Frequency,intensity_Frequency);
        index_List (5,5) = index_List (5,5)+Label;
        % intensity - fear
        [FT_Frequency(5,6),Label] = FT_Frequency_Correlation (intensity_Frequency,fear_Frequency);
        index_List (5,6) = index_List (5,6)+Label;
        % intensity - anger
        [FT_Frequency(5,7),Label] = FT_Frequency_Correlation (intensity_Frequency,anger_Frequency);
        index_List (5,7) = index_List (5,7)+Label;
        % intensity - happiness
        [FT_Frequency(5,8),Label] = FT_Frequency_Correlation (intensity_Frequency,happiness_Frequency);
        index_List (5,8) = index_List (5,8)+Label;
        % intensity - saddness
        [FT_Frequency(5,9),Label] = FT_Frequency_Correlation (intensity_Frequency,saddness_Frequency);
        index_List (5,9) = index_List (5,9)+Label;
        % intensity - disgust
        [FT_Frequency(5,10),Label] = FT_Frequency_Correlation (intensity_Frequency,disgust_Frequency);
        index_List (5,10) = index_List (5,10)+Label;
        % intensity - contempt
        [FT_Frequency(5,11),Label] = FT_Frequency_Correlation (intensity_Frequency,contempt_Frequency);
        index_List (5,11) = index_List (5,11)+Label;
        % intensity - amusement
        [FT_Frequency(5,12),Label] = FT_Frequency_Correlation (intensity_Frequency,amusement_Frequency);
        index_List (5,12) = index_List (5,12)+Label;
    
    % fear
        % fear - arousal
        [FT_Frequency(6,1),Label] = FT_Frequency_Correlation (fear_Frequency,arousal_Frequency);
        index_List (6,1) = index_List (6,1)+Label;
        % fear - valence
        [FT_Frequency(6,2),Label] = FT_Frequency_Correlation (fear_Frequency,valence_Frequency);
        index_List (6,2) = index_List (6,2)+Label;
        % fear - power
        [FT_Frequency(6,3),Label] = FT_Frequency_Correlation (fear_Frequency,power_Frequency);
        index_List (6,3) = index_List (6,3)+Label;
        % fear - expectation
        [FT_Frequency(6,4),Label] = FT_Frequency_Correlation (fear_Frequency,expectation_Frequency);
        index_List (6,4) = index_List (6,4)+Label;
        % fear - intensity
        [FT_Frequency(6,5),Label] = FT_Frequency_Correlation (fear_Frequency,intensity_Frequency);
        index_List (6,5) = index_List (6,5)+Label;
        % fear - fear
        [FT_Frequency(6,6),Label] = FT_Frequency_Correlation (fear_Frequency,fear_Frequency);
        index_List (6,6) = index_List (6,6)+Label;
        % fear - anger
        [FT_Frequency(6,7),Label] = FT_Frequency_Correlation (fear_Frequency,anger_Frequency);
        index_List (6,7) = index_List (6,7)+Label;
        % fear - happiness
        [FT_Frequency(6,8),Label] = FT_Frequency_Correlation (fear_Frequency,happiness_Frequency);
        index_List (6,8) = index_List (6,8)+Label;
        % fear - saddness
        [FT_Frequency(6,9),Label] = FT_Frequency_Correlation (fear_Frequency,saddness_Frequency);
        index_List (6,9) = index_List (6,9)+Label;
        % fear - disgust
        [FT_Frequency(6,10),Label] = FT_Frequency_Correlation (fear_Frequency,disgust_Frequency);
        index_List (6,10) = index_List (6,10)+Label;
        % fear - contempt
        [FT_Frequency(6,11),Label] = FT_Frequency_Correlation (fear_Frequency,contempt_Frequency);
        index_List (6,11) = index_List (6,11)+Label;
        % fear - amusement
        [FT_Frequency(6,12),Label] = FT_Frequency_Correlation (fear_Frequency,amusement_Frequency);
        index_List (6,12) = index_List (6,12)+Label;
    
    % anger
        % anger - arousal
        [FT_Frequency(7,1),Label] = FT_Frequency_Correlation (anger_Frequency,arousal_Frequency);
        index_List (7,1) = index_List (7,1)+Label;
        % anger - valence
        [FT_Frequency(7,2),Label] = FT_Frequency_Correlation (anger_Frequency,valence_Frequency);
        index_List (7,2) = index_List (7,2)+Label;
        % anger - power
        [FT_Frequency(7,3),Label] = FT_Frequency_Correlation (anger_Frequency,power_Frequency);
        index_List (7,3) = index_List (7,3)+Label;
        % anger - expectation
        [FT_Frequency(7,4),Label] = FT_Frequency_Correlation (anger_Frequency,expectation_Frequency);
        index_List (7,4) = index_List (7,4)+Label;
        % anger - intensity
        [FT_Frequency(7,5),Label] = FT_Frequency_Correlation (anger_Frequency,intensity_Frequency);
        index_List (7,5) = index_List (7,5)+Label;
        % anger - fear
        [FT_Frequency(7,6),Label] = FT_Frequency_Correlation (anger_Frequency,fear_Frequency);
        index_List (7,6) = index_List (7,6)+Label;
        % anger - anger
        [FT_Frequency(7,7),Label] = FT_Frequency_Correlation (anger_Frequency,anger_Frequency);
        index_List (7,7) = index_List (7,7)+Label;        
        % anger - happiness
        [FT_Frequency(7,8),Label] = FT_Frequency_Correlation (anger_Frequency,happiness_Frequency);
        index_List (7,8) = index_List (7,8)+Label;
        % anger - saddness
        [FT_Frequency(7,9),Label] = FT_Frequency_Correlation (anger_Frequency,saddness_Frequency);
        index_List (7,9) = index_List (7,9)+Label;
        % anger - disgust
        [FT_Frequency(7,10),Label] = FT_Frequency_Correlation (anger_Frequency,disgust_Frequency);
        index_List (7,10) = index_List (7,10)+Label;
        % anger - contempt
        [FT_Frequency(7,11),Label] = FT_Frequency_Correlation (anger_Frequency,contempt_Frequency);
        index_List (7,11) = index_List (7,11)+Label;
        % anger - amusement
        [FT_Frequency(7,12),Label] = FT_Frequency_Correlation (anger_Frequency,amusement_Frequency);
        index_List (7,12) = index_List (7,12)+Label;
    
    % happiness
        % happiness - arousal
        [FT_Frequency(8,1),Label] = FT_Frequency_Correlation (happiness_Frequency,arousal_Frequency);
        index_List (8,1) = index_List (8,1)+Label;
        % happiness - valence
        [FT_Frequency(8,2),Label] = FT_Frequency_Correlation (happiness_Frequency,valence_Frequency);
        index_List (8,2) = index_List (8,2)+Label;
        % happiness - power
        [FT_Frequency(8,3),Label] = FT_Frequency_Correlation (happiness_Frequency,power_Frequency);
        index_List (8,3) = index_List (8,3)+Label;
        % happiness - expectation
        [FT_Frequency(8,4),Label] = FT_Frequency_Correlation (happiness_Frequency,expectation_Frequency);
        index_List (8,4) = index_List (8,4)+Label;
        % happiness - intensity
        [FT_Frequency(8,5),Label] = FT_Frequency_Correlation (happiness_Frequency,intensity_Frequency);
        index_List (8,5) = index_List (8,5)+Label;
        % happiness - fear
        [FT_Frequency(8,6),Label] = FT_Frequency_Correlation (happiness_Frequency,fear_Frequency);
        index_List (8,6) = index_List (8,6)+Label;
        % happiness - anger
        [FT_Frequency(8,7),Label] = FT_Frequency_Correlation (happiness_Frequency,anger_Frequency);
        index_List (8,7) = index_List (8,7)+Label;
        % happiness - happiness
        [FT_Frequency(8,8),Label] = FT_Frequency_Correlation (happiness_Frequency,happiness_Frequency);
        index_List (8,8) = index_List (8,8)+Label;
        % happiness - saddness
        [FT_Frequency(8,9),Label] = FT_Frequency_Correlation (happiness_Frequency,saddness_Frequency);
        index_List (8,9) = index_List (8,9)+Label;
        % happiness - disgust
        [FT_Frequency(8,10),Label] = FT_Frequency_Correlation (happiness_Frequency,disgust_Frequency);
        index_List (8,10) = index_List (8,10)+Label;
        % happiness - contempt
        [FT_Frequency(8,11),Label] = FT_Frequency_Correlation (happiness_Frequency,contempt_Frequency);
        index_List (8,11) = index_List (8,11)+Label;
        % happiness - amusement
        [FT_Frequency(8,12),Label] = FT_Frequency_Correlation (happiness_Frequency,amusement_Frequency);
        index_List (8,12) = index_List (8,12)+Label;
    
    % saddness
      % saddness - arousal
        [FT_Frequency(9,1),Label] = FT_Frequency_Correlation (saddness_Frequency,arousal_Frequency);
        index_List (9,1) = index_List (9,1)+Label;
        % saddness - valence
        [FT_Frequency(9,2),Label] = FT_Frequency_Correlation (saddness_Frequency,valence_Frequency);
        index_List (9,2) = index_List (9,2)+Label;
        % saddness - power
        [FT_Frequency(9,3),Label] = FT_Frequency_Correlation (saddness_Frequency,power_Frequency);
        index_List (9,3) = index_List (9,3)+Label;
        % saddness - expectation
        [FT_Frequency(9,4),Label] = FT_Frequency_Correlation (saddness_Frequency,expectation_Frequency);
        index_List (9,4) = index_List (9,4)+Label;
        % saddness - intensity
        [FT_Frequency(9,5),Label] = FT_Frequency_Correlation (saddness_Frequency,intensity_Frequency);
        index_List (9,5) = index_List (9,5)+Label;
        % saddness - fear
        [FT_Frequency(9,6),Label] = FT_Frequency_Correlation (saddness_Frequency,fear_Frequency);
        index_List (9,6) = index_List (9,6)+Label;
        % saddness - anger
        [FT_Frequency(9,7),Label] = FT_Frequency_Correlation (saddness_Frequency,anger_Frequency);
        index_List (9,7) = index_List (9,7)+Label;
        % saddness - happiness
        [FT_Frequency(9,8),Label] = FT_Frequency_Correlation (saddness_Frequency,happiness_Frequency);
        index_List (9,8) = index_List (9,8)+Label;
        % saddness - saddness
        [FT_Frequency(9,9),Label] = FT_Frequency_Correlation (saddness_Frequency,saddness_Frequency);
        index_List (9,9) = index_List (9,9)+Label;
        % saddness - disgust
        [FT_Frequency(9,10),Label] = FT_Frequency_Correlation (saddness_Frequency,disgust_Frequency);
        index_List (9,10) = index_List (9,10)+Label;
        % saddness - contempt
        [FT_Frequency(9,11),Label] = FT_Frequency_Correlation (saddness_Frequency,contempt_Frequency);
        index_List (9,11) = index_List (9,11)+Label;
        % saddness - amusement
        [FT_Frequency(9,12),Label] = FT_Frequency_Correlation (saddness_Frequency,amusement_Frequency);
        index_List (9,12) = index_List (9,12)+Label;
    
    % disgust
       % disgust - arousal
        [FT_Frequency(10,1),Label] = FT_Frequency_Correlation (disgust_Frequency,arousal_Frequency);
        index_List (10,1) = index_List (10,1)+Label;
        % disgust - valence
        [FT_Frequency(10,2),Label] = FT_Frequency_Correlation (disgust_Frequency,valence_Frequency);
        index_List (10,2) = index_List (10,2)+Label;
        % disgust - power
        [FT_Frequency(10,3),Label] = FT_Frequency_Correlation (disgust_Frequency,power_Frequency);
        index_List (10,3) = index_List (10,3)+Label;
        % disgust - expectation
        [FT_Frequency(10,4),Label] = FT_Frequency_Correlation (disgust_Frequency,expectation_Frequency);
        index_List (10,4) = index_List (10,4)+Label;
        % disgust - intensity
        [FT_Frequency(10,5),Label] = FT_Frequency_Correlation (disgust_Frequency,intensity_Frequency);
        index_List (10,5) = index_List (10,5)+Label;
        % disgust - fear
        [FT_Frequency(10,6),Label] = FT_Frequency_Correlation (disgust_Frequency,fear_Frequency);
        index_List (10,6) = index_List (10,6)+Label;
        % disgust - anger
        [FT_Frequency(10,7),Label] = FT_Frequency_Correlation (disgust_Frequency,anger_Frequency);
        index_List (10,7) = index_List (10,7)+Label;
        % disgust - happiness
        [FT_Frequency(10,8),Label] = FT_Frequency_Correlation (disgust_Frequency,happiness_Frequency);
        index_List (10,8) = index_List (10,8)+Label;
        % disgust - saddness
        [FT_Frequency(10,9),Label] = FT_Frequency_Correlation (disgust_Frequency,saddness_Frequency);
        index_List (10,9) = index_List (10,9)+Label;
        % disgust - disgust
        [FT_Frequency(10,10),Label] = FT_Frequency_Correlation (disgust_Frequency,disgust_Frequency);
        index_List (10,10) = index_List (10,10)+Label;
        % disgust - contempt
        [FT_Frequency(10,11),Label] = FT_Frequency_Correlation (disgust_Frequency,contempt_Frequency);
        index_List (10,11) = index_List (10,11)+Label;
        % disgust - amusement
        [FT_Frequency(10,12),Label] = FT_Frequency_Correlation (disgust_Frequency,amusement_Frequency);
        index_List (10,12) = index_List (10,12)+Label;
    
    % contempt
        % contempt - arousal
        [FT_Frequency(11,1),Label] = FT_Frequency_Correlation (contempt_Frequency,arousal_Frequency);
        index_List (11,1) = index_List (11,1)+Label;
        % contempt - valence
        [FT_Frequency(11,2),Label] = FT_Frequency_Correlation (contempt_Frequency,valence_Frequency);
        index_List (11,2) = index_List (11,2)+Label;
        % contempt - power
        [FT_Frequency(11,3),Label] = FT_Frequency_Correlation (contempt_Frequency,power_Frequency);
        index_List (11,3) = index_List (11,3)+Label;
        % contempt - expectation
        [FT_Frequency(11,4),Label] = FT_Frequency_Correlation (contempt_Frequency,expectation_Frequency);
        index_List (11,4) = index_List (11,4)+Label;
        % contempt - intensity
        [FT_Frequency(11,5),Label] = FT_Frequency_Correlation (contempt_Frequency,intensity_Frequency);
        index_List (11,5) = index_List (11,5)+Label;
        % contempt - fear
        [FT_Frequency(11,6),Label] = FT_Frequency_Correlation (contempt_Frequency,fear_Frequency);
        index_List (11,6) = index_List (11,6)+Label;
        % contempt - anger
        [FT_Frequency(11,7),Label] = FT_Frequency_Correlation (contempt_Frequency,anger_Frequency);
        index_List (11,7) = index_List (11,7)+Label;
        % contempt - happiness
        [FT_Frequency(11,8),Label] = FT_Frequency_Correlation (contempt_Frequency,happiness_Frequency);
        index_List (11,8) = index_List (11,8)+Label;
        % contempt - saddness
        [FT_Frequency(11,9),Label] = FT_Frequency_Correlation (contempt_Frequency,saddness_Frequency);
        index_List (11,9) = index_List (11,9)+Label;
        % contempt - disgust
        [FT_Frequency(11,10),Label] = FT_Frequency_Correlation (contempt_Frequency,disgust_Frequency);
        index_List (11,10) = index_List (11,10)+Label;
        % contempt - contempt
        [FT_Frequency(11,11),Label] = FT_Frequency_Correlation (contempt_Frequency,contempt_Frequency);
        index_List (11,11) = index_List (11,11)+Label;
        % contempt - amusement
        [FT_Frequency(11,12),Label] = FT_Frequency_Correlation (contempt_Frequency,amusement_Frequency);
        index_List (11,12) = index_List (11,12)+Label;

     % amusement
        % amusement - arousal
        [FT_Frequency(12,1),Label] = FT_Frequency_Correlation (amusement_Frequency,arousal_Frequency);
        index_List (12,1) = index_List (12,1)+Label;
        % amusement - valence
        [FT_Frequency(12,2),Label] = FT_Frequency_Correlation (amusement_Frequency,valence_Frequency);
        index_List (12,2) = index_List (12,2)+Label;
        % amusement - power
        [FT_Frequency(12,3),Label] = FT_Frequency_Correlation (amusement_Frequency,power_Frequency);
        index_List (12,3) = index_List (12,3)+Label;
        % amusement - expectation
        [FT_Frequency(12,4),Label] = FT_Frequency_Correlation (amusement_Frequency,expectation_Frequency);
        index_List (12,4) = index_List (12,4)+Label;
        % amusement - intensity
        [FT_Frequency(12,5),Label] = FT_Frequency_Correlation (amusement_Frequency,intensity_Frequency);
        index_List (12,5) = index_List (12,5)+Label;
        % amusement - fear
        [FT_Frequency(12,6),Label] = FT_Frequency_Correlation (amusement_Frequency,fear_Frequency);
        index_List (12,6) = index_List (12,6)+Label;
        % amusement - anger
        [FT_Frequency(12,7),Label] = FT_Frequency_Correlation (amusement_Frequency,anger_Frequency);
        index_List (12,7) = index_List (12,7)+Label;
        % amusement - happiness
        [FT_Frequency(12,8),Label] = FT_Frequency_Correlation (amusement_Frequency,happiness_Frequency);
        index_List (12,8) = index_List (12,8)+Label;
        % amusement - saddness
        [FT_Frequency(12,9),Label] = FT_Frequency_Correlation (amusement_Frequency,saddness_Frequency);
        index_List (12,9) = index_List (12,9)+Label;
        % amusement - disgust
        [FT_Frequency(12,10),Label] = FT_Frequency_Correlation (amusement_Frequency,disgust_Frequency);
        index_List (12,10) = index_List (12,10)+Label;
        % amusement - contempt
        [FT_Frequency(12,11),Label] = FT_Frequency_Correlation (amusement_Frequency,contempt_Frequency);
        index_List (12,11) = index_List (12,11)+Label;
        % amusement - amusement
        [FT_Frequency(12,12),Label] = FT_Frequency_Correlation (amusement_Frequency,amusement_Frequency);
        index_List (12,12) = index_List (12,12)+Label;
end

% Peterson calculator 
% calculate the correlation
function [r, Label] = FT_Frequency_Correlation(target_List, temp_List)
    [m1,n1] = size(target_List);
    [m2,n2] = size(temp_List);
    
    if (1~=m1)&&(1~=m2)
        % set the length of the minumum list
        % just to overlap these two list 
        length = 0;

        if m1>m2
            length = m2;
        else
            length = m1;
        end

        % initialize the properties
        x_Mean = 0;
        y_Mean = 0;
        SSE = 0;
        SST = 0;
        x_Sum = 0;
        y_Sum = 0;

        for i = 1:length
            x_Mean = x_Mean+temp_List(i,1);
            y_Mean = y_Mean+target_List(i,1);
        end

        x_Mean = x_Mean/length;
        y_Mean = y_Mean/length;

        for i =1:length
            SSE = SSE + (temp_List(i,1)-x_Mean)*(target_List(i,1)-y_Mean);

            x_Sum = x_Sum+(temp_List(i,1)-x_Mean)^2;
            y_Sum = y_Sum+(target_List(i,1)-y_Mean)^2;
        end

        SST = sqrt(x_Sum*y_Sum);

        Label = 1;
        r = SSE/SST;    
    else
        Label = 0;
        r = NaN;
    end
end