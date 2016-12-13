% function  aims to collect the CR data and merged them 
% after the collectio and merge, we will calculate its frequency
% fileName represents the file name
% pathName represents the path of the file
function [frequency]=CR_Frequency (fileName, pathName)   
    % Initialization 
    % recording of the frequency data
    frequency = zeros(9,9);
    data_Frequency = zeros (1,9);
    file_Num = 0;
    
    % collect all the data according to each feature
    for n = 1: length(fileName)    
        [count, temp_Frequency]=CR_Frequency_Collection(fileName{n}, pathName);
         
        % merage them into one matrix
        [data_Frequency, file_Num] = CR_Frequency_Merge (count, temp_Frequency, data_Frequency, file_Num); 
    end
    
    [frequency] = CR_Frequency_Calculation (data_Frequency, frequency);
end

% collect all the data in the file
function [count, temp_Frequency] = CR_Frequency_Collection(fileName, pathName)
    % count represent the count index of the line
    count=1;
    % define the temp matrix
    temp_Frequency=zeros(100000,9);
    
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    % input the mat file
    m = matfile(path);
    input_Values = m.features;

    n=size(input_Values);
    
    for i = 1:n(1)
        for j = 1:9
            temp_Frequency(i,j)=input_Values(i,j);
        end
        count = count+1;
    end
end

% merge all the collected value in the same data
function [data_Frequency, file_Num] = CR_Frequency_Merge (count, temp_Frequency, data_Frequency, file_Num)
    % Resize the matrix
    temp = zeros (count, 9);
    
            fprintf ('%d \n',count);
    for i = 1 : count
        for j = 1 : 9
            temp(i,j) = temp_Frequency(i,j);
        end
    end
    
    % merage the matrix
    M = size (data_Frequency);
    if count >= M(1)
        if 1 == M(1)
            data_Frequency = temp;
        else
            for i = 1 : M(1)
                for j = 1: 9
                    temp(i,j) = (temp(i,j) + data_Frequency(i,j)*file_Num) / (file_Num+1);
                end
            end
            data_Frequency = temp;
        end
    else
        for i = 1: count
            for j = 1: 9
                data_Frequency(i,j) = (data_Frequency(i,j)*file_Num + temp(i,j)) / (file_Num+1);
            end
        end
    end
    % record how many files have been processed 
    file_Num = file_Num +1 ;
end

% Peterson calculator 
% calculate the correlation
function [frequency] = CR_Frequency_Calculation (data_Frequency, frequency)
    for i = 1 :9
        for j = 1: 9
           frequency(i,j) =  CR_Frequency_Calculation_Process(data_Frequency(:,i), data_Frequency(:,j));
        end
    end
end

function [r] = CR_Frequency_Calculation_Process(temp_List,target_List)
    m = size(target_List);
    n = size(temp_List);
    
    if (1~=m(1))&&(1~=n(1))
        % set the length of the minumum list
        % just to overlap these two list 
        length = 0;

        if m(1)>n(1)
            length = n(1);
        else
            length = m(1);
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
            x_Sum = x_Sum + (temp_List(i,1)-x_Mean)^2;
            y_Sum = y_Sum + (target_List(i,1)-y_Mean)^2;
        end

        SST = sqrt(x_Sum*y_Sum);

        r = SSE/SST;   
    else 
        r = NaN;
        fprintf ('there is no avabile value to calculate the correlation of FaceReader\n');
    end
end