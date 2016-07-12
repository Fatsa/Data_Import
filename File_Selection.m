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
function [wordLevel_alignedTranscript_User,wordLevel_alignedTranscript_User_Line_Count,valence_Lines, valence_Count,arousal_Lines, arousal_Count,power_Lines, power_Count,expectation_Lines, expectation_Count,intensity_Lines, intensity_Count,fear_Lines, fear_Count,anger_Lines, anger_Count,happiness_Lines, happiness_Count,saddness_Lines, saddness_Count,disgust_Lines, disgust_Count,contempt_Lines, contempt_Count,amusement_Lines, amusement_Count]=File_Selection (fileName, pathName)
    %transcript_Label=0;
    wordLevel_alignedTranscript_Label= 0;
    valence_Label=0;
    arousal_Label=0;
    power_Label=0;
    expectation_Label=0;
    intensity_Label=0;
    fear_Label=0;
    anger_Label=0;
    happiness_Label=0;
    saddness_Label=0;
    disgust_Label=0;
    contempt_Label=0;
    amusement_Label=0;
    
    for n = 1: length(fileName)
%         % alignedTranscript means the text transcript used in the video
%         % fileName doesn't contain wordLevel 
%         % fileName contain alignedTranscript
%         if ((0~=isempty(strfind(fileName{n},'wordLevel')))&&(0==isempty(strfind(fileName{n},'alignedTranscript'))))
%             Transcript_Process (fileName{n}, pathName);
%             transcript_Label=1;
        % wordLevel_alignedTranscript_..._user means the user's transcript 
        % fileName contain User
        % fileName contain wordLevel_alignedTranscript
        % wordLevel_alignedTranscript_User stores all the user's text
        % count means (the num of text line + 1)
        if ((0==isempty(strfind(fileName{n},'user')))&&(0==isempty(strfind(fileName{n},'wordLevel_alignedTranscript'))))
            [wordLevel_alignedTranscript_User, wordLevel_alignedTranscript_User_Line_Count]=WordLevel_alignedTranscript_Process(fileName{n}, pathName);
            wordLevel_alignedTranscript_Label=1;
        % DV means the Valence
        elseif (0==isempty(strfind(fileName{n},'DV')))
            [valence_Lines, valence_Count]=Valence_Process(fileName{n}, pathName);
            valence_Label=1;
        % DA means the Activation/Arousal
        % fileName doesn't contain DAn
        % fileName doesn't contain DAm
        % fileName doesn't contain DAgre
        % fileName doesn't contain DAntg
        % fileName doesn't contain DASug
        % fileName doesn't contain DAInf
        % fileName doesn't contain DAnomSim   
        elseif ((0~=isempty(strfind(fileName{n},'DAn')))&&(0~=isempty(strfind(fileName{n},'DAm')))&&(0~=isempty(strfind(fileName{n},'DAgre')))&&(0~=isempty(strfind(fileName{n},'DAntg')))&&(0~=isempty(strfind(fileName{n},'DASug')))&&(0~=isempty(strfind(fileName{n},'DAInf')))&&(0~=isempty(strfind(fileName{n},'DAnomSim')))&&(0==isempty(strfind(fileName{n},'DA'))))
            [arousal_Lines, arousal_Count]=Arousal_Process(fileName{n}, pathName);
            arousal_Label=1;
        % DP means the Power
        elseif (0==isempty(strfind(fileName{n},'DP')))
            [power_Lines, power_Count]=Power_Process(fileName{n}, pathName);
            power_Label=1;
        % DE means the Anticipation/Expectation
        % fileName doesn't contain DEase
        elseif ((0~=isempty(strfind(fileName{n},'DEase')))&&(0==isempty(strfind(fileName{n},'DE'))))
            [expectation_Lines, expectation_Count]=Expectation_Process(fileName{n}, pathName);
            expectation_Label=1;
        % DI means the Intensity
        % fileName doesn't contain DIntr
        elseif ((0~=isempty(strfind(fileName{n},'DIntr')))&&(0==isempty(strfind(fileName{n},'DI'))))
            [intensity_Lines, intensity_Count]=Intensity_Process(fileName{n}, pathName);
            intensity_Label=1;
        % DFr means the fear
        elseif (0==isempty(strfind(fileName{n},'DFr')))
            [fear_Lines, fear_Count]=Fear_Process(fileName{n}, pathName);
            fear_Label=1;
        % DAn means the anger
        % fileName doesn't contain DAntg
        % fileName doesn't contain DAnomSim
        elseif ((0~=isempty(strfind(fileName{n},'DAntg')))&&(0~=isempty(strfind(fileName{n},'DAnomSim')))&&(0==isempty(strfind(fileName{n},'DAn'))))
            [anger_Lines, anger_Count]=Anger_Process(fileName{n}, pathName);
            anger_Label=1;
        % DHp means happiness
        elseif (0==isempty(strfind(fileName{n},'DHp')))
            [happiness_Lines, happiness_Count]=Happiness_Process(fileName{n}, pathName);
            happiness_Label=1;
        % DSd means saddness
        elseif (0==isempty(strfind(fileName{n},'DSd')))
            [saddness_Lines, saddness_Count]=Saddness_Process(fileName{n}, pathName);
            saddness_Label=1;
        % DDg means digust
        elseif (0==isempty(strfind(fileName{n},'DDg')))
            [disgust_Lines, disgust_Count]=Disgust_Process(fileName{n}, pathName);
            disgust_Label=1;
        % DCt means contempt
        elseif (0==isempty(strfind(fileName{n},'DCt')))
            [contempt_Lines, contempt_Count]=Contempt_Process(fileName{n}, pathName);
            contempt_Label=1;
        % DAm means amusement
        elseif (0==isempty(strfind(fileName{n},'DAm')))
            [amusement_Lines, amusement_Count]=Amusement_Process(fileName{n}, pathName);
            amusement_Label=1;
        else
            fprintf('%s is No matched file\n',fileName{n});
        end
    end
    
    % initialziation
    if (0==isempty(wordLevel_alignedTranscript_Label))    
        % read the text by each sentence
        wordLevel_alignedTranscript_User=cell(50000,1);
        % count represent the count index of the line
        wordLevel_alignedTranscript_User_Line_Count=1;
    end
    
    if (0==arousal_Label)
        % read the text by each sentence
        %arousal_Lines1=cell(50000,1);
        % count represent the count index of the line
        arousal_Count=1;
    end

    if (0==valence_Label) 
        % read the text by each sentence
        valence_Lines=cell(50000,1);
        % count represent the count index of the line
        valence_Count=1;
    end

    if (0==power_Label)    
        % read the text by each sentence
        power_Lines=cell(50000,1);
        % count represent the count index of the line
        power_Count=1;
    end    
    
    if (0==expectation_Label) 
        % read the text by each sentence
        expectation_Lines=cell(50000,1);
        % count represent the count index of the line
        expectation_Count=1; 
    end  
    
    if (0==intensity_Label) 
        % read the text by each sentence
        intensity_Lines=cell(50000,1);
        % count represent the count index of the line
        intensity_Count=1;
    end      
    
    if (0==isempty(fear_Label))    
        % read the text by each sentence
        fear_Lines=cell(50000,1);
        % count represent the count index of the line
        fear_Count=1; 
    end 
    
    if (0==anger_Label)    
        % read the text by each sentence
        anger_Lines=cell(50000,1);
        % count represent the count index of the line
        anger_Count=1;
    end     
    
    if (0==happiness_Label)
        % read the text by each sentence
        happiness_Lines=cell(50000,1);
        % count represent the count index of the line
        happiness_Count=1;
    end  
    
    if (0==saddness_Label)
        % read the text by each sentence
        saddness_Lines=cell(50000,1);
        % count represent the count index of the line
        saddness_Count=1; 
    end      
    
    if (0==disgust_Label)
        % read the text by each sentence
        disgust_Lines=cell(50000,1);
        % count represent the count index of the line
        disgust_Count=1; 
    end    
    
    if (0==contempt_Label)
        % read the text by each sentence
        contempt_Lines=cell(50000,1);
        % count represent the count index of the line
        contempt_Count=1; 
    end   

    if (0==amusement_Label)
        % read the text by each sentence
        amusement_Lines=cell(50000,1);
        % count represent the count index of the line
        amusement_Count=1;
    end 
end