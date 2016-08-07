% calculate the sensitivity of features
% FileName only contains the name of the file
% PathName only have the absolute path of the file

% - features - 
% F0 - 1
% VUV - 2
% NAQ - 3
% QOQ - 4 
% H1H2 - 5
% PSP - 6
% MDQ - 7
% peakSlope - 8 
% Rd - 9

function [CR_Sensitivity]=CR_Sensitivity (fileName, pathName)
    F0_Sensitivity = zeros(1,1);
    VUV_Sensitivity = zeros(1,1);
    NAQ_Sensitivity = zeros(1,1);
    QOQ_Sensitivity = zeros(1,1);
    H1H2_Sensitivity = zeros(1,1);
    PSP_Sensitivity = zeros(1,1);
    MDQ_Sensitivity = zeros(1,1);
    peakSlope_Sensitivity = zeros(1,1);
    Rd_Sensitivity = zeros(1,1);
    
    % collect all the data according to each feature
    for n = 1: length(fileName)
        fprintf('%s start to process file\n',fileName{n})

        [temp_Matrix, count]=CR_Sensitivity_Collection(fileName{n}, pathName);
        
        [F0_Sensitivity, VUV_Sensitivity, NAQ_Sensitivity, QOQ_Sensitivity, ...
        H1H2_Sensitivity, PSP_Sensitivity, MDQ_Sensitivity, ...
        peakSlope_Sensitivity, Rd_Sensitivity] ... 
        = CR_Sensitivity_Merge ...
        (F0_Sensitivity, VUV_Sensitivity, NAQ_Sensitivity, QOQ_Sensitivity, ...
        H1H2_Sensitivity, PSP_Sensitivity, MDQ_Sensitivity, ...
        peakSlope_Sensitivity, Rd_Sensitivity,temp_Matrix, count); 
    end
    % calculate the sensivitiy detalied value
    % sensitivity contains average value, SD, SD of SD from above features
    CR_Sensitivity = CR_Sensitivity_Calculation ... 
        (F0_Sensitivity, VUV_Sensitivity, NAQ_Sensitivity, QOQ_Sensitivity, ...
        H1H2_Sensitivity, PSP_Sensitivity, MDQ_Sensitivity, ...
        peakSlope_Sensitivity, Rd_Sensitivity);
end

% collect the data 
% FileName only contains the name of the file
% PathName only have the absolute path of the file
% 
function [temp_Matrix, count]=CR_Sensitivity_Collection(fileName, pathName)
    % count represent the count index of the line
    count=1;
    % define the temp matrix
    temp_Matrix=zeros(50000,9);
    
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    % input the mat file
    m = matfile(path);
    input_Values = m.features;

    [M,N]=size(input_Values);
    
    for i = 1:M
        for j = 1:9
            temp_Matrix(i,j)=input_Values(i,j);
        end
    end
    count = M;
end

% merage differnt file data into one matrix
function [F0_Sensitivity, VUV_Sensitivity, NAQ_Sensitivity, QOQ_Sensitivity, ...
        H1H2_Sensitivity, PSP_Sensitivity, MDQ_Sensitivity, ...
        peakSlope_Sensitivity, Rd_Sensitivity] ...  
        = CR_Sensitivity_Merge ...
        (F0_Sensitivity, VUV_Sensitivity, NAQ_Sensitivity, QOQ_Sensitivity, ...
        H1H2_Sensitivity, PSP_Sensitivity, MDQ_Sensitivity, ...
        peakSlope_Sensitivity, Rd_Sensitivity,temp_Matrix, count)
    
    % divivd into each target matrix
    temp = zeros (count, 1);
    for i=1:9
        if 1 ==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [F0_Sensitivity] = CR_Sensitivity_Matrix_Merge (F0_Sensitivity, temp,count);
        elseif 2==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [VUV_Sensitivity] = CR_Sensitivity_Matrix_Merge (VUV_Sensitivity, temp,count);
        elseif 3==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [NAQ_Sensitivity] = CR_Sensitivity_Matrix_Merge (NAQ_Sensitivity, temp,count);
        elseif 4==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [QOQ_Sensitivity] = CR_Sensitivity_Matrix_Merge (QOQ_Sensitivity, temp,count);
        elseif 5==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [H1H2_Sensitivity] = CR_Sensitivity_Matrix_Merge (H1H2_Sensitivity, temp,count);
        elseif 6==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [PSP_Sensitivity] = CR_Sensitivity_Matrix_Merge (PSP_Sensitivity, temp,count);
        elseif 7==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [MDQ_Sensitivity] = CR_Sensitivity_Matrix_Merge (MDQ_Sensitivity, temp,count);            
        elseif 8==i
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [peakSlope_Sensitivity] = CR_Sensitivity_Matrix_Merge (peakSlope_Sensitivity, temp,count);            
        else
            for j =1 : count
                temp(j,1)= temp_Matrix(j,i);
            end
            [Rd_Sensitivity] = CR_Sensitivity_Matrix_Merge (Rd_Sensitivity, temp,count); 
        end
    end
end

function [target_Sensitivity]=CR_Sensitivity_Matrix_Merge(target_Sensitivity,temp_Matrix,count)    
    [M,N] = size(target_Sensitivity);
    index = count;
    
    % filter the size
    for i=1:count 
        if 0 == (temp_Matrix(i,1))
            index = index - 1;
        end
    end
    % temp storage of value
    temp = zeros (index, 1);
    % reset the index position
    index = 0;
    % filter the value
    for i=1:count 
        if 0 == (temp_Matrix(i,1))
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
function [CR_Sensitivity] = CR_Sensitivity_Calculation ...
        (F0_Sensitivity, VUV_Sensitivity, NAQ_Sensitivity, QOQ_Sensitivity, ...
        H1H2_Sensitivity, PSP_Sensitivity, MDQ_Sensitivity, ...
        peakSlope_Sensitivity, Rd_Sensitivity)
    
    % define the sensitivity matrix
    CR_sensitivity = zeros(9,3);
    
    % F0_Sensitivity
    CR_Sensitivity(1,1) = CR_Sensitivity_AV (F0_Sensitivity);
    CR_Sensitivity(1,2) = CR_Sensitivity_SD (CR_Sensitivity(1,1),F0_Sensitivity);
    CR_Sensitivity(1,3) = CR_Sensitivity_SK (CR_Sensitivity(1,1),F0_Sensitivity);
    % VUV_Sensitivity
    CR_Sensitivity(2,1) = CR_Sensitivity_AV (VUV_Sensitivity);
    CR_Sensitivity(2,2) = CR_Sensitivity_SD (CR_Sensitivity(2,1),VUV_Sensitivity); 
    CR_Sensitivity(2,3) = CR_Sensitivity_SK (CR_Sensitivity(2,1),VUV_Sensitivity);
    % NAQ_Sensitivity
    CR_Sensitivity(3,1) = CR_Sensitivity_AV (NAQ_Sensitivity);
    CR_Sensitivity(3,2) = CR_Sensitivity_SD (CR_Sensitivity(3,1),NAQ_Sensitivity);    
    CR_Sensitivity(3,3) = CR_Sensitivity_SK (CR_Sensitivity(3,1),NAQ_Sensitivity);  
    % QOQ_Sensitivity
    CR_Sensitivity(4,1) = CR_Sensitivity_AV (QOQ_Sensitivity);
    CR_Sensitivity(4,2) = CR_Sensitivity_SD (CR_Sensitivity(4,1),QOQ_Sensitivity);    
    CR_Sensitivity(4,3) = CR_Sensitivity_SK (CR_Sensitivity(4,1),QOQ_Sensitivity);      
    % H1H2_Sensitivity
    CR_Sensitivity(5,1) = CR_Sensitivity_AV (H1H2_Sensitivity);
    CR_Sensitivity(5,2) = CR_Sensitivity_SD (CR_Sensitivity(5,1),H1H2_Sensitivity);    
    CR_Sensitivity(5,3) = CR_Sensitivity_SK (CR_Sensitivity(5,1),H1H2_Sensitivity);    
    % PSP_Sensitivity
    CR_Sensitivity(6,1) = CR_Sensitivity_AV (PSP_Sensitivity);
    CR_Sensitivity(6,2) = CR_Sensitivity_SD (CR_Sensitivity(6,1),PSP_Sensitivity);     
    CR_Sensitivity(6,3) = CR_Sensitivity_SK (CR_Sensitivity(6,1),PSP_Sensitivity);   
    % MDQ_Sensitivity
    CR_Sensitivity(7,1) = CR_Sensitivity_AV (MDQ_Sensitivity);
    CR_Sensitivity(7,2) = CR_Sensitivity_SD (CR_Sensitivity(7,1),MDQ_Sensitivity);      
    CR_Sensitivity(7,3) = CR_Sensitivity_SK (CR_Sensitivity(7,1),MDQ_Sensitivity);   
    % peakSlope_Sensitivity
    CR_Sensitivity(8,1) = CR_Sensitivity_AV (peakSlope_Sensitivity);
    CR_Sensitivity(8,2) = CR_Sensitivity_SD (CR_Sensitivity(8,1),peakSlope_Sensitivity);       
    CR_Sensitivity(8,3) = CR_Sensitivity_SK (CR_Sensitivity(8,1),peakSlope_Sensitivity);  
    % Rd_Sensitivity
    CR_Sensitivity(9,1) = CR_Sensitivity_AV (Rd_Sensitivity);
    CR_Sensitivity(9,2) = CR_Sensitivity_SD (CR_Sensitivity(9,1),Rd_Sensitivity);  
    CR_Sensitivity(9,3) = CR_Sensitivity_SK (CR_Sensitivity(9,1),Rd_Sensitivity);      
end

% calculate the average value
function [AV] = CR_Sensitivity_AV(target_List)
    [M,N] = size(target_List);
    sum= double(0);
    for i = 1 :M
        sum = sum + target_List(i,1);
    end
    AV = sum/M;
end

% calculate the SD, average value
function [SD] = CR_Sensitivity_SD(AV, target_List)
    [M,N] = size(target_List);
    sum = 0;
    for i = 1 :M
        sum = sum + (AV-target_List(i,1))^2;
    end    
    SD = sqrt(sum/M);
end

% calculate the Skewness, average value
function [SK] = CR_Sensitivity_SK(AV, target_List)
    [M,N] = size(target_List);
    sum1 = 0;
    sum2 = 0;
    for i = 1 :M
        sum1 = sum1 + (AV-target_List(i,1))^3;
        sum2 = sum2 + (AV-target_List(i,1))^2;
    end    
    SK = (sum1/M)/((sqrt(sum2/(M-1)))^3);
end
