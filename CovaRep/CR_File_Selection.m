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
                    m = str2double(CR_Lines(i,j));
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