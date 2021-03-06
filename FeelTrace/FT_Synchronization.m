% Synchronization function merge all the feauture data into one
% collaborative data strucutre
%
% parameter values of emotion parameters
% valence_Lines - valence 
% arousal_Lines - arousal
% power_Lines - power
% expectation_Lines - expectation
% intensity_Lines - intensity 

% facial expression values
% fear_Lines - fear expressoin
% anger_Lines - anger expressoin
% happiness_Lines - happy expression
% saddness_Lines - sad expression
% disgust_Lines - disgust expression
% contempt_Lines - contempt expression
% amusement_Lines - amusement expression

% data_Cluster represents all the parameters mentioned above 
% its list order as : 1 - time, 2 - valence, 3 - arousal, 4 - power,
% 5 - expectation, 6 - intensity, 7 - fear, 8 - anger, 9 - happiness
% 10 - saddness, 11 - disgust, 12 - contempt, 13 amusement

function [A]=FT_Synchronization(lines_Num, valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines)
    % Initialization
    data_Cluster=cell(50000,13);

    % among the cell's operation
    % data_Cluster {} is usually used to represent a single element
    % data_Cluster () is usually used to represent a set of elements
    data_Cluster(:,2)=valence_Lines(:,2);
    data_Cluster(:,3)=arousal_Lines(:,2);
    data_Cluster(:,4)=power_Lines(:,2);
    data_Cluster(:,5)=expectation_Lines(:,2);
    data_Cluster(:,6)=intensity_Lines(:,2);
    data_Cluster(:,7)=fear_Lines(:,2);
    data_Cluster(:,8)=anger_Lines(:,2);
    data_Cluster(:,9)=happiness_Lines(:,2);
    data_Cluster(:,10)=saddness_Lines(:,2);
    data_Cluster(:,11)=disgust_Lines(:,2);
    data_Cluster(:,12)=contempt_Lines(:,2);
    data_Cluster(:,13)=amusement_Lines(:,2);

    % setting the time range
    for i=1:lines_Num
        data_Cluster{i,1}=double(i)*0.02;
    end
    
    A = FT_convert2Matrix(lines_Num,data_Cluster);
end

function [A]=FT_convert2Matrix(lines_Num,data_Cluster)
    A=zeros(lines_Num,13);
    for i=1:lines_Num
        for j=1:size(data_Cluster,2)
            A(i,j)=str2double(num2str(data_Cluster{i,j}));
        end
    end
end
