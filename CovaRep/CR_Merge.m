% merage the detail feature data into overall data set
function [ov_Data_CovaRep] = CR_Merge(data_CovaRep)
    ov_Data_CovaRep = zeros(1,74);
    [deepth, length]=size(data_CovaRep);
    
    for j = 1: length
        sum = 0;
        count = deepth;
        for i =1: deepth
            a = data_CovaRep(i,j);
            if ( 0 == isnan(a))
                sum = sum + a;
            else
                count = count -1;
            end
        end
        if (0 == count)
            ov_Data_CovaRep(1,j) = NaN;
        else
            ov_Data_CovaRep(1,j) = sum/count;
        end
    end
end