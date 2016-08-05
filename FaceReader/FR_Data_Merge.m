% merge different feature values into one cloumn

% FaceReader zeros represents the detailed feature data sets
% ov_Data_FeelTrace [cell] represents the overall data set

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

function [Merge_FaceReader]=FR_Data_Merge(data_FaceReader)
    % initialization 
    [deepth, width]=size(data_FaceReader);
    % Merge_FaceReader only contain one column
    Merge_FaceReader = cell(1, width);
    
    % 1 column represents the time
    Merge_FaceReader{1,1} = data_FaceReader(deepth,1);
    % 2-withth values transfer normally
    for j=2:width
        sum = 0;
        count = deepth;
        for i = 1: deepth
            a = data_FaceReader(i,j);
            if (0 == isnan(a))
                sum = sum+a;
            else
                count = count -1;
            end
        end
        if (0 == count)
            Merge_FaceReader{1,j} = NaN;
        else
            Merge_FaceReader{1,j} = sum/count;
        end
    end
end