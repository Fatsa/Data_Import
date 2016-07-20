% merge different feature values into one cloumn

% data_FeelTrace zeros represents the detailed feature data sets
% ov_Data_FeelTrace [cell] represents the overall data set

% features list
% time length 1
% valence 2
% arousal 3
% power 4
% expectation 5
% intensity 6 
% fear 7
% anger 8
% happiness 9
% saddness 10
% disgust 11
% contempt 12
% amusement 13

function [ov_Data_FeelTrace]=FT_Data_Merge(data_FeelTrace)
    ov_Data_FeelTrace = cell(1, 13);
    [deepth, width]=size(data_FeelTrace);
    
    % 1 column represents the time
    ov_Data_FeelTrace{1,1} = data_FeelTrace(deepth,1);
    % 2-withth values transfer normally
    for j=2:width
        sum = 0;
        count = deepth;
        for i = 1: deepth
            a = data_FeelTrace(i,j);
            if (0 == isnan(a))
                sum = sum+a;
            else
                count = count -1;
            end
        end
        if (0 == count)
            ov_Data_FeelTrace{1,j} = NaN;
        else
            ov_Data_FeelTrace{1,j} = sum/count;
        end
    end
end