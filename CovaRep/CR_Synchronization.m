% package the data set into a fit cell variable
%
% CR_Lines_Temp [matrix] orignal Covarep data set
% lines_Num [double] the deepth of the data set
%
function [data_CovaRep]=CR_Synchronization(CR_Lines_Temp, lines_Num)
    data_CovaRep = zeros(lines_Num,74);
    
    for i = 1:lines_Num
        data_CovaRep(i,:) = CR_Lines_Temp(i,:);
    end
end