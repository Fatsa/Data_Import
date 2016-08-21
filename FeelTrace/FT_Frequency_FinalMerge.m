% reset the frequency data

function [frequency] = FT_Frequency_FinalMerge (temp_Frequency, frequency, index_List)
    for i=1:12
        for j=1:12
            l = isnan( temp_Frequency(i,j));
            if (0~=index_List(i,j)) && (1~=index_List(i,j))
                if 0 == isnan( temp_Frequency(i,j))
                    frequency(i,j)=(frequency(i,j)*(index_List(i,j)-1)+temp_Frequency(i,j))/index_List(i,j);
                end
            elseif 1 == index_List(i,j)
                if 0 == isnan( temp_Frequency(i,j))
                    frequency(i,j) = temp_Frequency(i,j);
                end
            else
                frequency(i,j) = NaN;
            end
        end
    end
end