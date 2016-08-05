
function [data_FaceReader]=FR_Synchronization(FR_Lines_temp, lines_Num)
    data_FaceReader=zeros(lines_Num,10);
    for i=1:lines_Num
        for j=1:10
            data_FaceReader(i,j)=str2double(num2str(FR_Lines_temp{i,j}));
        end
    end
end