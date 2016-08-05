% this function used to match the file to the correct process
% FR_FileName only contains the name of the file
% FR_PathName only have the absolute path of the file
% 
% Features included in the calculation
% names={'F0','VUV','NAQ','QOQ','H1H2','PSP','MDQ','peakSlope','Rd', ...
%    'Rd_conf','creak','MCEP_0','MCEP_1','MCEP_2','MCEP_3','MCEP_4','MCEP_5', ...
%    'MCEP_6','MCEP_7','MCEP_8','MCEP_9','MCEP_10','MCEP_11','MCEP_12', ...
%    'MCEP_13','MCEP_14','MCEP_15','MCEP_16','MCEP_17','MCEP_18', ...
%    'MCEP_19','MCEP_20','MCEP_21','MCEP_22','MCEP_23','MCEP_24',...
%    'HMPDM_0','HMPDM_1','HMPDM_2','HMPDM_3','HMPDM_4','HMPDM_5', ...
%    'HMPDM_6','HMPDM_7','HMPDM_8','HMPDM_9','HMPDM_10','HMPDM_11','HMPDM_12', ...
%    'HMPDM_13','HMPDM_14','HMPDM_15','HMPDM_16','HMPDM_17','HMPDM_18', ...
%    'HMPDM_19','HMPDM_20','HMPDM_21','HMPDM_22','HMPDM_23','HMPDM_24',...
%    'HMPDD_0','HMPDD_1','HMPDD_2','HMPDD_3','HMPDD_4','HMPDD_5', ...
%    'HMPDD_6','HMPDD_7','HMPDD_8','HMPDD_9','HMPDD_10','HMPDD_11','HMPDD_12'};
%

function [CR_Lines, lines_Num]=CR_File_Selection (fileName, pathName)    
    %initialization
    % lines_Num represent the lines num of the file
    lines_Num = 0; 
    % file_Num represent the number of the inputed file
    file_Num = 0;
    % define the data_Cluster for FaceReader transcript
    CR_Lines=cell(30000,74);
    for n = 1: length(fileName)
        path = fullfile(pathName,fileName{n});
        m = matfile(path);
        input_Values = m.features;

        [file_Num, CR_Lines, count] = CR_Data_Process(CR_Lines,input_Values,file_Num);

        % select the largest size of all different feature files
        [lines_Num] = CR_Maximum(lines_Num,count);
        
        fprintf('%s has been matched file\n',fileName{n})
    end 
end

function [file_Num, CR_Lines, count] = CR_Data_Process(CR_Lines,input_Values,file_Num)
    % receive the size
    a = size(input_Values);
    count = a(1);
    b = size(CR_Lines);
    length = b(1);
    
    if 0 == file_Num
        CR_Lines = input_Values;
    else
        if count>length
            % the part overlapped
            for i = 1:length
                for j = 1:74
                    m = CR_Lines(i,j);
                    n = input_Values(i,j);
                    CR_Lines(i,j) = (m*file_Num+n)/(file_Num+1);
                end
            end
            for i = (length+1):count
                for j = 1:74
                    CR_Lines(i,j) = input_Values(i,j);
                end
            end
        else
            % the whole input values overlap with CR_Lines
            for i = 1:count
                for j = 1:74
                    m = CR_Lines(i,j);
                    n = input_Values(i,j);
                    CR_Lines(i,j) = (m*file_Num+n)/(file_Num+1);
                end
            end            
        end
    end
    
    file_Num = file_Num +1 ;
    
end

function [lines_Num]=CR_Maximum(lines_Num,count)
    if 0==lines_Num
        lines_Num = count;
    else
        if lines_Num<count
            lines_Num=count;
        end
    end
end