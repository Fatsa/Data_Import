% Peterson calculator 
% calculate the correlation
function [frequency] = FR_Frequency_Calculation (data_Frequency, frequency)
    for i = 1 :9
        for j = 1: 9
           frequency(i,j) =  FR_Frequency_Calculation_Process(data_Frequency(:,i), data_Frequency(:,j));
        end
    end
end

function [r] = FR_Frequency_Calculation_Process(temp_List,target_List)
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