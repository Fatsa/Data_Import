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

function [FT_sensitivity]=FT_Sensitivity (fileName, pathName)
    arousal_Sensitivity = zeros(1,1);
    valence_Sensitivity = zeros(1,1);
    power_Sensitivity = zeros(1,1);
    expectation_Sensitivity = zeros(1,1);
    intensity_Sensitivity = zeros(1,1);
    fear_Sensitivity = zeros(1,1);
    anger_Sensitivity = zeros(1,1);
    happiness_Sensitivity = zeros(1,1);
    saddness_Sensitivity = zeros(1,1);
    disgust_Sensitivity = zeros(1,1);
    contempt_Sensitivity = zeros(1,1);
    amusement_Sensitivity = zeros(1,1);
    
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
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [arousal_Sensitivity] = FT_Sensitivity_Merge (arousal_Sensitivity, temp_Matrix,count);
                
        % DV means the Valence
        elseif (0==isempty(strfind(fileName{n},'DV')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [valence_Sensitivity] = FT_Sensitivity_Merge (valence_Sensitivity, temp_Matrix,count);
                
        % DP means the Power
        elseif (0==isempty(strfind(fileName{n},'DP')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [power_Sensitivity] = FT_Sensitivity_Merge (power_Sensitivity, temp_Matrix,count);
                
        % DE means the Anticipation/Expectation
        % fileName doesn't contain DEase
        elseif ((0~=isempty(strfind(fileName{n},'DEase')))&& ... 
                (0==isempty(strfind(fileName{n},'DE'))))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [expectation_Sensitivity] = FT_Sensitivity_Merge (expectation_Sensitivity, temp_Matrix,count);
                
        % DI means the Intensity
        % fileName doesn't contain DIntr
        elseif ((0~=isempty(strfind(fileName{n},'DIntr')))&& ... 
                (0==isempty(strfind(fileName{n},'DI'))))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [intensity_Sensitivity] = FT_Sensitivity_Merge (intensity_Sensitivity, temp_Matrix,count);
                
        % DFr means the fear
        elseif (0==isempty(strfind(fileName{n},'DFr')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [fear_Sensitivity] = FT_Sensitivity_Merge (fear_Sensitivity, temp_Matrix,count);
                
        % DAn means the anger
        % fileName doesn't contain DAntg
        % fileName doesn't contain DAnomSim
        elseif ((0~=isempty(strfind(fileName{n},'DAntg')))&& ... 
                (0~=isempty(strfind(fileName{n},'DAnomSim')))&& ... 
                (0==isempty(strfind(fileName{n},'DAn'))))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [anger_Sensitivity] = FT_Sensitivity_Merge (anger_Sensitivity, temp_Matrix,count);
                
        % DHp means happiness
        elseif (0==isempty(strfind(fileName{n},'DHp')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [happiness_Sensitivity] = FT_Sensitivity_Merge (happiness_Sensitivity, temp_Matrix,count);
            
        % DSd means saddness
        elseif (0==isempty(strfind(fileName{n},'DSd')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [saddness_Sensitivity] = FT_Sensitivity_Merge (saddness_Sensitivity, temp_Matrix,count);
            
        % DDg means digust
        elseif (0==isempty(strfind(fileName{n},'DDg')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [disgust_Sensitivity] = FT_Sensitivity_Merge (disgust_Sensitivity, temp_Matrix,count);
            
        % DCt means contempt
        elseif (0==isempty(strfind(fileName{n},'DCt')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [contempt_Sensitivity] = FT_Sensitivity_Merge (contempt_Sensitivity, temp_Matrix,count);
            
        % DAm means amusement
        elseif (0==isempty(strfind(fileName{n},'DAm')))
            % collect all the related feature values
            [temp_Matrix, count]=FT_Sensitivity_Collection(fileName{n}, pathName);
            % merage them into one matrix
            [amusement_Sensitivity] = FT_Sensitivity_Merge (amusement_Sensitivity, temp_Matrix,count);
        else
            fprintf('%s is No matched file\n',fileName{n});
        end
    end
  
    % calculate the sensivitiy detalied value
    % sensitivity contains average value, SD, SD of SD from above features
    FT_sensitivity = FT_Sensitivity_Calculation (arousal_Sensitivity, ... 
        valence_Sensitivity, power_Sensitivity, expectation_Sensitivity, ...
        intensity_Sensitivity, fear_Sensitivity, anger_Sensitivity, ...
        happiness_Sensitivity, saddness_Sensitivity, disgust_Sensitivity, ...
        contempt_Sensitivity, amusement_Sensitivity);
end

% collect the data 
% FileName only contains the name of the file
% PathName only have the absolute path of the file
% 
function [temp_Matrix, count]=FT_Sensitivity_Collection(fileName, pathName)
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
                fprintf ('Boom! \n');
            else
                temp_Matrix(count,1)=str2double(b{2});
            end
            count=count+1;
        end
    end
    % close the file stream
    fclose(ioStream);
end

% merage differnt file data into one matrix
function [target_Sensitivity] = FT_Sensitivity_Merge (target_Sensitivity, temp_Matrix,count)
    [M,N] = size(target_Sensitivity);
    temp = zeros (count, 1);
    for i=1:count 
        temp(i,1) = temp_Matrix(i,1);
    end
    if (1 == M)
        target_Sensitivity = temp;
    else
        target_Sensitivity = [target_Sensitivity;temp];
    end
end

% calculate the sensitivity
function [FT_sensitivity] = FT_Sensitivity_Calculation (arousal_Sensitivity, ... 
        valence_Sensitivity, power_Sensitivity, expectation_Sensitivity, ...
        intensity_Sensitivity, fear_Sensitivity, anger_Sensitivity, ...
        happiness_Sensitivity, saddness_Sensitivity, disgust_Sensitivity, ...
        contempt_Sensitivity, amusement_Sensitivity)
    % define the sensitivity matrix
    FT_sensitivity = zeros(12,2);
    
    % arousal
    FT_sensitivity(1,1) = FT_Sensitivity_AV (arousal_Sensitivity);
    FT_sensitivity(1,2) = FT_Sensitivity_SD (FT_sensitivity(1,1),arousal_Sensitivity);
    % valence
    FT_sensitivity(2,1) = FT_Sensitivity_AV (valence_Sensitivity);
    FT_sensitivity(2,2) = FT_Sensitivity_SD (FT_sensitivity(2,1),valence_Sensitivity);   
    % power
    FT_sensitivity(3,1) = FT_Sensitivity_AV (power_Sensitivity);
    FT_sensitivity(3,2) = FT_Sensitivity_SD (FT_sensitivity(3,1),power_Sensitivity);    
    % expectation
    FT_sensitivity(4,1) = FT_Sensitivity_AV (expectation_Sensitivity);
    FT_sensitivity(4,2) = FT_Sensitivity_SD (FT_sensitivity(4,1),expectation_Sensitivity);    
    % intensity
    FT_sensitivity(5,1) = FT_Sensitivity_AV (intensity_Sensitivity);
    FT_sensitivity(5,2) = FT_Sensitivity_SD (FT_sensitivity(5,1),intensity_Sensitivity);    
    % fear
    FT_sensitivity(6,1) = FT_Sensitivity_AV (fear_Sensitivity);
    FT_sensitivity(6,2) = FT_Sensitivity_SD (FT_sensitivity(6,1),fear_Sensitivity);    
    % anger
    FT_sensitivity(7,1) = FT_Sensitivity_AV (anger_Sensitivity);
    FT_sensitivity(7,2) = FT_Sensitivity_SD (FT_sensitivity(7,1),anger_Sensitivity);    
    % happiness
    FT_sensitivity(8,1) = FT_Sensitivity_AV (happiness_Sensitivity);
    FT_sensitivity(8,2) = FT_Sensitivity_SD (FT_sensitivity(8,1),happiness_Sensitivity);    
    % saddness
    FT_sensitivity(9,1) = FT_Sensitivity_AV (saddness_Sensitivity);
    FT_sensitivity(9,2) = FT_Sensitivity_SD (FT_sensitivity(9,1),saddness_Sensitivity);    
   % disgust
    FT_sensitivity(10,1) = FT_Sensitivity_AV (disgust_Sensitivity);
    FT_sensitivity(10,2) = FT_Sensitivity_SD (FT_sensitivity(10,1),disgust_Sensitivity);  
   % contempt
    FT_sensitivity(11,1) = FT_Sensitivity_AV (contempt_Sensitivity);
    FT_sensitivity(11,2) = FT_Sensitivity_SD (FT_sensitivity(11,1),contempt_Sensitivity);  
   % amusement
    FT_sensitivity(12,1) = FT_Sensitivity_AV (amusement_Sensitivity);
    FT_sensitivity(12,2) = FT_Sensitivity_SD (FT_sensitivity(12,1),amusement_Sensitivity);  
end

% calculate the average value
function [AV] = FT_Sensitivity_AV(target_List)
    [M,N] = size(target_List);
    sum= double(0);
    for i = 1 :M
        sum = sum + target_List(i,1);
    end
    AV = sum/M;
end

% calculate the SD, average value
function [SD] = FT_Sensitivity_SD(AV, target_List)
    [M,N] = size(target_List);
    sum = 0;
    for i = 1 :M
        sum = sum + (AV-target_List(i,1))^2;
    end    
    SD = sqrt(sum/M);
end
