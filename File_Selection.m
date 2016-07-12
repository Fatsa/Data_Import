  %this function used to match the file to the correct process
%FileName only contains the name of the file
%PathName only have the absolute path of the file
% 
% Features included in the calculation
% DV = Valence
% DA = Activation/Arousal
% DP = Power
% DE = Anticipation/Expectation
% DI = Intensity
% 
% DFr = Fear
% DAn = Anger
% DHp = Happiness
% DSd = Sadness
% DDg = Disgust
% DCt = Contempt
% DAm = Amusement
% 
% features not included in the calculation
% DCert = Certain / not certain
% DAgre = Agreeing / not agreeing
% DIntr = Interested / not interested
% DEase = At ease / not at ease
% DThgt = Thoughtful / not thoughtful
% DConc = Concentrating / not concentrating
% 
% DSldy = Shows Solidarity
% DAntg = Shows Antagonism
% DSTen = Shows Tension
% DRTen = Releases Tension
% DMSug = Makes Suggestion
% DASug = Asks for Suggestion
% DGOpn = Gives Opinion
% DAOpn = Asks for Opinion
% DGInf = Gives Information
% DAInf = Asks for Information
% 
% DBrkEng = Breakdo?wn of engagement
% DAnomSim = Anomalous simulation
% DSocCncl = Marked sociable concealment
% DSocSim = Marked sociable simulation

% return
% wordLevel_alignedTranscript_User means the user's text
% alignedTranscript_User_line_Count means the number of the lines
% valence_Lines means the value of the valence
% valence_Count
% arousal_Lines means the arousal data
% arousal_Count means the arousal lines 
% power_Lines means the value of power
% power_Count
% expectation_Lines means the value of expectation
% expectation_Count
% 
% happiness_Lines
% happiness_Count
%
% contempt_Lines, 
% contempt_Count
function [valence_Lines, arousal_Lines, power_Lines, expectation_Lines, intensity_Lines, fear_Lines, anger_Lines, happiness_Lines, saddness_Lines, disgust_Lines, contempt_Lines, amusement_Lines]=File_Selection (fileName, pathName)    
    %initialization
    valence_num=0;
    valence_Lines=cell(50000,2);
    
    arousal_num=0;
    arousal_Count=1;
    arousal_Lines=cell(50000,2);
    
    power_num=0;
    power_Count=1;
    power_Lines=cell(50000,2);

    expectation_num=0;
    expectation_Count=1;
    expectation_Lines=cell(50000,2);
    
    intensity_num=0;
    intensity_Count=1;  
    intensity_Lines=cell(50000,2);
        
    fear_num=0;
    fear_Count=1;
    fear_Lines=cell(50000,2);
    
    anger_num=0;
    anger_Count=1;
    anger_Lines=cell(50000,2);
        
    happiness_num=0;
    happiness_Count=1;
    happiness_Lines=cell(50000,2);
    
    saddness_num=0;
    saddness_Count=1;
    saddness_Lines=cell(50000,2);
        
    disgust_num=0;
    disgust_Count=1; 
    disgust_Lines=cell(50000,2);

    contempt_num=0;
    contempt_Count=1;
    contempt_Lines=cell(50000,2);
        
    amusement_num=0;
    amusement_Count=1;
    amusement_Lines=cell(50000,2);
    
    for n = 1: length(fileName)
        % DV means the Valence
        if (0==isempty(strfind(fileName{n},'DV')))
            [valence_Lines, valence_Count,valence_num]=Data_Process(valence_Lines,fileName{n}, pathName,valence_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DA means the Activation/Arousal
        % fileName doesn't contain DAn
        % fileName doesn't contain DAm
        % fileName doesn't contain DAgre
        % fileName doesn't contain DAntg
        % fileName doesn't contain DASug
        % fileName doesn't contain DAInf
        % fileName doesn't contain DAnomSim   
        elseif ((0~=isempty(strfind(fileName{n},'DAn')))&&(0~=isempty(strfind(fileName{n},'DAm')))&&(0~=isempty(strfind(fileName{n},'DAgre')))&&(0~=isempty(strfind(fileName{n},'DAntg')))&&(0~=isempty(strfind(fileName{n},'DASug')))&&(0~=isempty(strfind(fileName{n},'DAInf')))&&(0~=isempty(strfind(fileName{n},'DAnomSim')))&&(0==isempty(strfind(fileName{n},'DA'))))
            [arousal_Lines, arousal_Count,arousal_num]=Data_Process(arousal_Lines,fileName{n}, pathName,arousal_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DP means the Power
        elseif (0==isempty(strfind(fileName{n},'DP')))
            [power_Lines, power_Count, power_num]=Data_Process(power_Lines, fileName{n}, pathName, power_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DE means the Anticipation/Expectation
        % fileName doesn't contain DEase
        elseif ((0~=isempty(strfind(fileName{n},'DEase')))&&(0==isempty(strfind(fileName{n},'DE'))))
            [expectation_Lines, expectation_Count, expectation_num]=Data_Process(power_Lines, fileName{n}, pathName, expectation_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DI means the Intensity
        % fileName doesn't contain DIntr
        elseif ((0~=isempty(strfind(fileName{n},'DIntr')))&&(0==isempty(strfind(fileName{n},'DI'))))
            [intensity_Lines, intensity_Count, intensity_num]=Data_Process(intensity_Lines, fileName{n}, pathName, intensity_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DFr means the fear
        elseif (0==isempty(strfind(fileName{n},'DFr')))
            [fear_Lines, fear_Count, fear_num]=Data_Process(fear_Lines, fileName{n}, pathName,fear_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DAn means the anger
        % fileName doesn't contain DAntg
        % fileName doesn't contain DAnomSim
        elseif ((0~=isempty(strfind(fileName{n},'DAntg')))&&(0~=isempty(strfind(fileName{n},'DAnomSim')))&&(0==isempty(strfind(fileName{n},'DAn'))))
            [anger_Lines, anger_Count, anger_num]=Data_Process(anger_Lines, fileName{n}, pathName, anger_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DHp means happiness
        elseif (0==isempty(strfind(fileName{n},'DHp')))
            [happiness_Lines, happiness_Count, happiness_num]=Data_Process(anger_Lines, fileName{n}, pathName, happiness_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DSd means saddness
        elseif (0==isempty(strfind(fileName{n},'DSd')))
            [saddness_Lines, saddness_Count, saddness_num]=Data_Process(anger_Lines, fileName{n}, pathName, saddness_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DDg means digust
        elseif (0==isempty(strfind(fileName{n},'DDg')))
            [disgust_Lines, disgust_Count, disgust_num]=Data_Process(disgust_Lines, fileName{n}, pathName, disgust_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DCt means contempt
        elseif (0==isempty(strfind(fileName{n},'DCt')))
            [contempt_Lines, contempt_Count, contempt_num]=Data_Process(contempt_Lines, fileName{n}, pathName, contempt_num);
            fprintf('%s has been matched file\n',fileName{n})
        % DAm means amusement
        elseif (0==isempty(strfind(fileName{n},'DAm')))
            [amusement_Lines, amusement_Count,amusement_num]=Data_Process(amusement_Lines, fileName{n}, pathName, amusement_num);
            fprintf('%s has been matched file\n',fileName{n})
        else
            fprintf('%s is No matched file\n',fileName{n});
        end
    end 
end

function [lines, count, num]=Data_Process(lines,fileName, pathName,num)
    % count represent the count index of the line
    count=1;
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    % open the file and store the data in IOStream
    % message is used to label the error
    % path including the file name and its path
    [ioStream,message] = fopen(path,'r');
    % select the type of the file and judge whether IOStream is empty or not
    % different type will be processed differently 
    if (0 ~= message) 
        fprintf(message);
        exit(EXIT_FAILURE);
    else 
        if (0 == num)
            % check whehter the iosStream reach the end of the file stream
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                lines{count,1}=str2double(b{1});
                lines{count,2}=str2double(b{2});
                count=count+1;
            end
            num=num+1;
        else
            while ~feof(ioStream)
                %read each line
                titleLine = fgetl(ioStream);
                b = strsplit(titleLine,' ');
                % extract the time vlaue
                if(isempty(lines{count,1}))
                    lines{count,1}=str2double(b{1});
                % recalculated the repeated part of lines
                else
                    lines{count,1}=(lines{count,1}*num+str2double(b{1}))/(num+1);
                end
                % extract the value of each feature
                if(isempty(lines{count,2}))
                    lines{count,2}=str2double(b{2});
                % recalculated the repeated part of lines
                else
                    lines{count,2}=(lines{count,2}*num+str2double(b{2}))/(num+1);
                end
                
                count=count+1;
            end
            num=num+1;
        end
    end
    % close the file stream
    fclose(ioStream);
end