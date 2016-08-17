function LIWC_Sensitivity(fileName, pathName)
    for n = 1 : length(fileName)
        temp_Matrix = LIWC_Sensitivity_Collection(fileName{n},pathName);
        LIWC_Sensitivity_Merge(temp_Matrix);
    end
end

function [temp_Matrx]=LIWC_Sensitivity_Collection(fileName,pathName)
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    temp_Matrx = csvread(path,1,1);
end