
function [results] = universality_Draw(FT_Data, FR_Data)
    % resize the length
    m = size(FT_Data);
    n = size(FR_Data);
    length = 0;
    if m(1)>n(1)
        length = n(1);
    else
        length = m(1);
    end
    
    % resize the data sets
    FT_Data1 = zeros(length, 7);
    FR_Data1 = zeros(length, 7);
    universality_Gap = zeros(length,7);
    universality_Label = zeros (length,7);
    for i = 1: length
        for j =1 : 7
            FT_Data1(i,j) = FT_Data(i,j);
            FR_Data1(i,j) = FR_Data(i,j);
        end
    end
    
    % trabsfer to time frame units
    time = 0 : 0.02 :(length*0.02-0.02);
    for i =1 : 7
        figure(i);
        plot(time,FT_Data1(:,i),'r',time,FR_Data1(:,i),'g');
        if 1 == i
            title ('Arousal');
        elseif 2 == i
            title ('Valence');
        elseif 3 == i
            title ('Fear');
        elseif 4 == i
            title ('Anger');
        elseif 5 == i
            title ('Happy');
        elseif 6 ==i 
            title ('Sad');
        else
            title ('Disgusted');
        end
    end
    
    % calculate the gap value
    for i =1 : length-1
        for j =1 :7
            if (FR_Data(i+1,j) == FR_Data(i,j))
                a = 0;
            elseif FR_Data(i+1,j) > FR_Data(i,j)
                a = 1;
            else 
                a = -1;
            end
            if (FT_Data(i+1,j) == FT_Data(i,j))
                b = 0;
            elseif FT_Data(i+1,j) > FT_Data(i,j)
                b = 1;
            else
                b = -1;
            end
            universality_Label (i,j) = a*b;
            
            m = (FR_Data(i+1,j)-FR_Data(i,j));
            n = (FT_Data(i+1,j)-FT_Data(i,j));
            universality_Gap (i,j) = m-n;
        end
    end
    % draw the gap histogram
    for i = 1: 7
        figure(7+i);
        bar (time, universality_Gap(:,i));
        if 1 == i
            title ('Arousal');
        elseif 2 == i
            title ('Valence');
        elseif 3 == i
            title ('Fear');
        elseif 4 == i
            title ('Anger');
        elseif 5 == i
            title ('Happy');
        elseif 6 ==i 
            title ('Sad');
        else
            title ('Disgusted');
        end
    end
    
    results = zeros(1,7);
    for j = 1 : 7
        for i = 1 : length
            if 1 == universality_Label (i,j)
                results(1,j) = results(1,j)+1;
            end
        end
        results(1,j) = results(1,j)/length;
    end
end