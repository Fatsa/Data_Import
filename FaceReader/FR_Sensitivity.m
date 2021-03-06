% this function used to match the file to the correct process
% FR_FileName only contains the name of the file
% FR_PathName only have the absolute path of the file
% 
% Features included in the calculation
% Video Time  - no more needed 
% Neutral	 1
% Happy	2
% Sad	3
% Angry	4
% Surprised	5
% Scared	6
% Disgusted	7
% Valence	8
% Arousal	9
% Stimulus	
% Event Marker

function [FR_sensitivity]=FR_Sensitivity (fileName, pathName, export_FileName)
    neutral_Sensitivity = zeros(1,1);
    happy_Sensitivity = zeros(1,1);
    sad_Sensitivity = zeros(1,1);
    angry_Sensitivity = zeros(1,1);
    surprised_Sensitivity = zeros(1,1);
    scared_Sensitivity = zeros(1,1);
    disgusted_Sensitivity = zeros(1,1);
    valence_Sensitivity = zeros(1,1);
    arousal_Sensitivity = zeros(1,1);
    
    for n = 1: length(fileName)
        fprintf('%s start to process file\n',fileName{n})
        [temp_Matrix, count]=FR_Sensitivity_Collection(fileName{n}, pathName);
        
        [neutral_Sensitivity, happy_Sensitivity, sad_Sensitivity, ... 
        angry_Sensitivity, surprised_Sensitivity, scared_Sensitivity, ... 
        disgusted_Sensitivity, valence_Sensitivity, arousal_Sensitivity] ... 
        = FT_Sensitivity_Merge ...
        (neutral_Sensitivity, happy_Sensitivity, sad_Sensitivity, ... 
        angry_Sensitivity, surprised_Sensitivity, scared_Sensitivity, ... 
        disgusted_Sensitivity, valence_Sensitivity, arousal_Sensitivity, ...
        temp_Matrix, count); 
    end
    
    % calculate the sensivitiy detalied value
    % sensitivity contains average value, SD, SD of SD from above features
    FR_sensitivity = FR_Sensitivity_Calculation (neutral_Sensitivity, ... 
        happy_Sensitivity, sad_Sensitivity, angry_Sensitivity, ...
        surprised_Sensitivity, scared_Sensitivity, disgusted_Sensitivity, ...
        valence_Sensitivity, arousal_Sensitivity);
    
    csvwrite(export_FileName, FR_sensitivity);
end

% collect the data 
% FileName only contains the name of the file
% PathName only have the absolute path of the file
% 
function [temp_Matrix, count]=FR_Sensitivity_Collection(fileName, pathName)
    % define the temp matrix
    temp_Matrix=zeros(50000,9);
    % record the length of the file 
    count = 0;
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
        % Neutral	 1
        % Happy	2
        % Sad	3
        % Angry	4
        % Surprised	5
        % Scared	6
        % Disgusted	7
        % Valence	8
        % Arousal	9
        
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
            
            for j=1:9
                % assign the feature value
                % the element of FR_Lines becomes double not cell
                if (0 == strcmp('FIT_FAILED',b{j+1})&&(0 == strcmp('FIND_FAILED', b{j+1})))
                    temp_Matrix(count,j)=str2double(b{j+1}); 
                else
                    temp_Matrix(count,j) = NaN;
                    fprintf('there is a FAILED data (FIT_FAILED/FIND_FAILED)\n');
                end
            end
        end
    end
    % close the file stream
    fclose(ioStream);
end

% merage differnt file data into one matrix
function [neutral_Sensitivity, happy_Sensitivity, sad_Sensitivity, ... 
        angry_Sensitivity, surprised_Sensitivity, scared_Sensitivity, ... 
        disgusted_Sensitivity, valence_Sensitivity, arousal_Sensitivity] ... 
        = FT_Sensitivity_Merge ...
        (neutral_Sensitivity, happy_Sensitivity, sad_Sensitivity, ... 
        angry_Sensitivity, surprised_Sensitivity, scared_Sensitivity, ... 
        disgusted_Sensitivity, valence_Sensitivity, arousal_Sensitivity, ...
        temp_Matrix, count)
    
    % divivd into each target matrix
    temp = zeros (count, 1);
    for i=1:9
        if 1 ==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [neutral_Sensitivity] = FR_Sensitivity_Matrix_Merge (neutral_Sensitivity, temp,count);
        elseif 2==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [happy_Sensitivity] = FR_Sensitivity_Matrix_Merge (happy_Sensitivity, temp,count);
        elseif 3==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [sad_Sensitivity] = FR_Sensitivity_Matrix_Merge (sad_Sensitivity, temp,count);
        elseif 4==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [angry_Sensitivity] = FR_Sensitivity_Matrix_Merge (angry_Sensitivity, temp,count);
        elseif 5==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [surprised_Sensitivity] = FR_Sensitivity_Matrix_Merge (surprised_Sensitivity, temp,count);
        elseif 6==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [scared_Sensitivity] = FR_Sensitivity_Matrix_Merge (scared_Sensitivity, temp,count);
        elseif 7==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [disgusted_Sensitivity] = FR_Sensitivity_Matrix_Merge (disgusted_Sensitivity, temp,count);            
        elseif 8==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [valence_Sensitivity] = FR_Sensitivity_Matrix_Merge (valence_Sensitivity, temp,count);            
        else
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [arousal_Sensitivity] = FR_Sensitivity_Matrix_Merge (arousal_Sensitivity, temp,count); 
        end
    end
end

function [target_Sensitivity]=FR_Sensitivity_Matrix_Merge(target_Sensitivity,temp_Matrix,count)    
    [M,N] = size(target_Sensitivity);
    index = count;
    
    % filter the size
    for i=1:count 
        if 1 == isnan(temp_Matrix(i,1))
            index = index - 1;
        end
    end
    % temp storage of value
    temp = zeros (index, 1);
    % reset the index position
    index = 0;
    % filter the value
    for i=1:count 
        if 1 == isnan(temp_Matrix(i,1))
            index = index + 1;
        else
            temp(i-index,1) = temp_Matrix(i,1);
        end
    end
    
    % merage the matrix
    if (1 == M)
        target_Sensitivity = temp;
    else
        target_Sensitivity = [target_Sensitivity;temp];
    end
end

% calculate the sensitivity
function [FR_sensitivity] = FR_Sensitivity_Calculation (neutral_Sensitivity, ... 
        happy_Sensitivity, sad_Sensitivity, angry_Sensitivity, ...
        surprised_Sensitivity, scared_Sensitivity, disgusted_Sensitivity, ...
        valence_Sensitivity, arousal_Sensitivity)
    % define the sensitivity matrix
    FR_sensitivity = zeros(9,3);
    
    % neutral
    FR_sensitivity(1,1) = FR_Sensitivity_AV (neutral_Sensitivity);
    FR_sensitivity(1,2) = FR_Sensitivity_SD (FR_sensitivity(1,1),neutral_Sensitivity);
    FR_sensitivity(1,3) = FR_Sensitivity_SK (FR_sensitivity(1,1),neutral_Sensitivity);
    % happy
    FR_sensitivity(2,1) = FR_Sensitivity_AV (happy_Sensitivity);
    FR_sensitivity(2,2) = FR_Sensitivity_SD (FR_sensitivity(2,1),happy_Sensitivity); 
    FR_sensitivity(2,3) = FR_Sensitivity_SK (FR_sensitivity(2,1),happy_Sensitivity);
    % sad
    FR_sensitivity(3,1) = FR_Sensitivity_AV (sad_Sensitivity);
    FR_sensitivity(3,2) = FR_Sensitivity_SD (FR_sensitivity(3,1),sad_Sensitivity);    
    FR_sensitivity(3,3) = FR_Sensitivity_SK (FR_sensitivity(3,1),sad_Sensitivity);  
    % angry
    FR_sensitivity(4,1) = FR_Sensitivity_AV (angry_Sensitivity);
    FR_sensitivity(4,2) = FR_Sensitivity_SD (FR_sensitivity(4,1),angry_Sensitivity);    
    FR_sensitivity(4,3) = FR_Sensitivity_SK (FR_sensitivity(4,1),angry_Sensitivity);      
    % surprised
    FR_sensitivity(5,1) = FR_Sensitivity_AV (surprised_Sensitivity);
    FR_sensitivity(5,2) = FR_Sensitivity_SD (FR_sensitivity(5,1),surprised_Sensitivity);    
    FR_sensitivity(5,3) = FR_Sensitivity_SK (FR_sensitivity(5,1),surprised_Sensitivity);    
    % scared
    FR_sensitivity(6,1) = FR_Sensitivity_AV (scared_Sensitivity);
    FR_sensitivity(6,2) = FR_Sensitivity_SD (FR_sensitivity(6,1),scared_Sensitivity);     
    FR_sensitivity(6,3) = FR_Sensitivity_SK (FR_sensitivity(6,1),scared_Sensitivity);   
    % disgusted
    FR_sensitivity(7,1) = FR_Sensitivity_AV (disgusted_Sensitivity);
    FR_sensitivity(7,2) = FR_Sensitivity_SD (FR_sensitivity(7,1),disgusted_Sensitivity);      
    FR_sensitivity(7,3) = FR_Sensitivity_SK (FR_sensitivity(7,1),disgusted_Sensitivity);   
    % valence
    FR_sensitivity(8,1) = FR_Sensitivity_AV (valence_Sensitivity);
    FR_sensitivity(8,2) = FR_Sensitivity_SD (FR_sensitivity(8,1),valence_Sensitivity);       
    FR_sensitivity(8,3) = FR_Sensitivity_SK (FR_sensitivity(8,1),valence_Sensitivity);  
    % arousal
    FR_sensitivity(9,1) = FR_Sensitivity_AV (arousal_Sensitivity);
    FR_sensitivity(9,2) = FR_Sensitivity_SD (FR_sensitivity(9,1),arousal_Sensitivity);  
    FR_sensitivity(9,3) = FR_Sensitivity_SK (FR_sensitivity(9,1),arousal_Sensitivity);    
end

% calculate the average value
function [AV] = FR_Sensitivity_AV(target_List)
    [M,N] = size(target_List);
    sum= double(0);
    for i = 1 :M
        sum = sum + target_List(i,1);
    end
    AV = sum/M;
end

% calculate the SD, average value
function [SD] = FR_Sensitivity_SD(AV, target_List)
    [M,N] = size(target_List);
    sum = 0;
    for i = 1 :M
        sum = sum + (AV-target_List(i,1))^2;
    end    
    SD = sqrt(sum/M);
end

% calculate the Skewness, average value
function [SK] = FR_Sensitivity_SK(AV, target_List)
    [M,N] = size(target_List);
    sum1 = 0;
    sum2 = 0;
    for i = 1 :M
        sum1 = sum1 + (AV-target_List(i,1))^3;
        sum2 = sum2 + (AV-target_List(i,1))^2;
    end    
    SK = (sum1/M)/((sqrt(sum2/(M-1)))^3);
end