% Features included in the calculation
% Neutral	 1
% Happy	2
% Sad	3
% Angry	4
% Surprised	5
% Scared	6
% Disgusted	7
% Valence	8
% Arousal	9

function [data_Frequency]=FR_Frequency (fileName, pathName)
    % Initialization    
    data_Frequency = zeros (1,9);
    file_Num = 0;
    data_Index_List = ones(1,1);
    % collect all the data according to each feature
    for n = 1: length(fileName)    
        [count, temp_Frequency, temp_List]=FR_Frequency_Collection(fileName{n}, pathName);
         
        % merage them into one matrix
        [data_Frequency, data_Index_List, file_Num] = FR_Frequency_Merge (count, temp_Frequency, temp_List, data_Frequency, data_Index_List, file_Num); 
    end
end

function [count, temp_Frequency1, temp_List1] = FR_Frequency_Collection(fileName, pathName)
    temp_Frequency=zeros (50000,9); 
    temp_List = ones (50000,1); 
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
            % index of the matrix
            count = count+1;
            % label  1 means the line contain NaN 
            label =0;
            % judge whether this line data contains any 
            % unregular value
            for j=1:9
                if 1 == isempty(b{j+1})
                    label = 1;
                elseif 1 == strcmp('FIT_FAILED',b{j+1})
                    label = 1;
                elseif 1 == strcmp('FIND_FAILED', b{j+1})
                    label = 1;
                elseif 1 == isnan(b{j+1})
                    label = 1;
                end
            end
            if 1 == label
                for j = 1 : 9
                    temp_Frequency(count,j)=0;
                end
            else
                for j = 1 : 9
                    temp_Frequency(count,j)=str2double(b{j+1}); 
                end
            end
            temp_List(count,1)=1 - label;
        end   
    end
    
    temp_Frequency1=zeros (count,9); 
    temp_List1 = ones (count,1); 
    
    for i = 1: count
        for j = 1 :9
            temp_Frequency1(i,j) = temp_Frequency (i,j);
        end
        temp_List1(i,1) = temp_List(i,1);
    end
    % close the file stream
    fclose(ioStream);
end

% file_Num represent the imported file number
function [data_Frequency, data_Index_List, file_Num] = FR_Frequency_Merge (count, temp_Frequency, temp_Index_List, data_Frequency, data_Index_List, file_Num)
    % measure the size if data_Frequency
    m = size (data_Frequency);    
    % temp_Frequency is larger than data_Frequency
    if count > m(1)
        if 1 ~= m(1)
            for i = 1: m(1)
                % this line is not regular
                if 0 == temp_Index_List(i,1)
                    for j =1:9
                        temp_Frequency (i,j) = data_Frequency(i,j);
                    end
                    continue;
                % start to record the data
                else
                    % when temp_Index_List(i,1)) = 1
                    % it means the line is regular
                    for j =1 :9
                        temp_Frequency(i,j) = ...
                        ( temp_Frequency(i,j) + ...
                          data_Frequency(i,j)*data_Index_List(i,1))...
                        / (data_Index_List(i,1)+temp_Index_List(i,1));
                    end
                end
                temp_Index_List(i,1) = temp_Index_List(i,1) + data_Index_List(i,1);
            end
        end
        data_Frequency = temp_Frequency;
        data_Index_List = temp_Index_List;
    else
         for i = 1: count
            % this line is not regular
            if 0 ~= temp_Index_List(i,1)
                for j = 1: 9
                    data_Frequency (i,j) = ...
                        ((data_Frequency(i,j)*data_Index_List(i,1))...
                        + temp_Frequency(i,j))/ ...
                        (data_Index_List(i,1)+temp_Index_List(i,1));
                end
                data_Index_List(i,1) = data_Index_List(i,1) + temp_Index_List(i,1);
            end
         end
    end
    
    file_Num = file_Num+1;
end
