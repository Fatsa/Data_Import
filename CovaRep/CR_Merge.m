% merage the detail feature data into overall data set
function [ov_Data_CovaRep] = CR_Merge(data_CovaRep)
    ov_Data_CovaRep = zeros(1,74);
    [deepth, length]=size(data_CovaRep);
    
    sum =0;
    
    for j = 1: length
        for i =1: deepth
            sum = sum + data_CovaRep(i,j);
        end
        ov_Data_CovaRep(1,j) = sum/deepth;
    end
end