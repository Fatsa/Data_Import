% wordLevel_alignedTranscript_User are the cell variables of wordLevel alignedTranscript 
% line_Count is the total number of the text lines
% arousal_Lines is the cell of the arousal data
% arousal_Count is the total number of the arousals

% anger_Lines
% anger_Count
% return
% wordLevel_Transcript means the transcript of the user
% wordLevel_Transcript_Timings means the timing of each word spoken by user
% arousal_Data means the value of arousal at each timing
% arousal_Timings means the timing point of each arousal
% valence_Data means the data of valence of each time point
% valence_Timing means the timing point of each valence
% power_Data means the data of power of each time point
% power_Timings means the timing point of each power
% intensity_Data, 
% intensity_Timings
% fear_Data
% fear_Timings
% anger_Data
% anger_Timings
% happiness_Data
% happiness_Timings
% saddness_Lines, 
% saddness_Count
% disgust_Lines, 
% disgust_Count
% contempt_Lines, 
% contempt_Count
% amusement_Lines,
% amusement_Count

function [valence_Data, valence_Timings,arousal_Data,arousal_Timings, power_Data, power_Timings,expectation_Data,expectation_Timings,intensity_Data,intensity_Timings,fear_Data,fear_Timings,anger_Data,anger_Timings,happiness_Data,happiness_Timings,saddness_Data,saddness_Timings,disgust_Data,disgust_Timings,contempt_Data,contempt_Timings,amusement_Data,amusement_Timings]=Data_Process(valence_Lines, valence_Count,arousal_Lines, arousal_Count,power_Lines, power_Count,expectation_Lines, expectation_Count,intensity_Lines, intensity_Count,fear_Lines, fear_Count,anger_Lines, anger_Count,happiness_Lines, happiness_Count,saddness_Lines, saddness_Count,disgust_Lines, disgust_Count,contempt_Lines, contempt_Count,amusement_Lines, amusement_Count)
    % wordLevel_alignedTranscript stores the detail data of each parameter
    % timing_List stores the start and end point of the speaking time
    if 1==wordLevel_alignedTranscript_User_Line_Count
        arousal_Data=zeros(1,1);
        arousal_Timings=zeros(1,1);
        valence_Data=zeros(1,1);
        valence_Timings=zeros(1,1);
        power_Data=zeros(1,1);
        power_Timings=zeros(1,1);
        expectation_Data=zeros(1,1);
        expectation_Timings=zeros(1,1);
        intensity_Data=zeros(1,1);
        intensity_Timings=zeros(1,1);
        fear_Data=zeros(1,1);
        fear_Timings=zeros(1,1);
        anger_Data=zeros(1,1);
        anger_Timings=zeros(1,1);
        happiness_Data=zeros(1,1);
        happiness_Timings=zeros(1,1);
        saddness_Data=zeros(1,1);
        saddness_Timings=zeros(1,1);
        disgust_Data=zeros(1,1);
        disgust_Timings=zeros(1,1);
        contempt_Data=zeros(1,1);
        contempt_Timings=zeros(1,1);
        amusement_Data=zeros(1,1);
        amusement_Timings=zeros(1,1);
    else 
        wordLevel_Transcript=cell(wordLevel_alignedTranscript_User_Line_Count-1,1);
        wordLevel_Transcript_Timings=zeros(wordLevel_alignedTranscript_User_Line_Count-1,2);
        % process the transcript into three columns
        % first two columns represent the start and end time of speaking
        % third column represent the text
        for i=1:wordLevel_alignedTranscript_User_Line_Count-1
            a = strsplit(wordLevel_alignedTranscript_User{i},' ');
            if (('-'~=a{1}(1))&&('.'~=a{1}(1)))
                wordLevel_Transcript_Timings(i,1)=(str2double(a{1}))/1000;
                wordLevel_Transcript_Timings(i,2)=(str2double(a{2}))/1000;
                wordLevel_Transcript(i)=cellstr(a{3});
                % '.' the end signal of each line
            elseif ('.'==a{1}(1))
                wordLevel_Transcript_Timings(i,1)=0;
                wordLevel_Transcript_Timings(i,2)=0;
                wordLevel_Transcript(i)=cellstr('***');
                % '-' the start singal of each line
            elseif ('-'==a{1}(1))
                wordLevel_Transcript_Timings(i,1)=0;
                wordLevel_Transcript_Timings(i,2)=0;
                wordLevel_Transcript(i)=cellstr('---');
            end
        end
        
        % arousal
        % initialization of arousal
        if 1==arousal_Count
            arousal_Data=zeros(1,1);
            arousal_Timings=zeros(1,1);
        else
            arousal_Data=zeros(arousal_Count-1,1);
            arousal_Timings=zeros(arousal_Count-1,1);
            [wordLevel_Transcript_Timings,arousal_Data,arousal_Timings]=data_Timing(wordLevel_Transcript_Timings,arousal_Count,arousal_Lines,arousal_Data,arousal_Timings);
        end
        
        % valence
        % initialization of valence
        if 1==valence_Count
            valence_Data=zeros(1,1);
            valence_Timings=zeros(1,1);
        else
            valence_Data=zeros(valence_Count-1,1);
            valence_Timings=zeros(valence_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,valence_Count,valence_Lines,valence_Data,valence_Timings);
        end
        
        % power
        % initialization of power
        if 1==power_Count
            power_Data=zeros(1,1);
            power_Timings=zeros(1,1);
        else
            power_Data=zeros(power_Count-1,1);
            power_Timings=zeros(power_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,power_Count,power_Lines,power_Data,power_Timings);
        end
        
        % expectation
        % initialization of expectation
        if 1==expectation_Count
            expectation_Data=zeros(1,1);
            expectation_Timings=zeros(1,1);
        else
            expectation_Data=zeros(expectation_Count-1,1);
            expectation_Timings=zeros(expectation_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,expectation_Count,expectation_Lines,expectation_Data,expectation_Timings);
        end
        
        % intensity
        % initialization of intensity
        if 1==intensity_Count
            intensity_Data=zeros(1,1);
            intensity_Timings=zeros(1,1);
        else
            intensity_Data=zeros(intensity_Count-1,1);
            intensity_Timings=zeros(intensity_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,intensity_Count,intensity_Lines,intesity_Data,intensity_Timings);
        end
        
        % fear
        % initialization of fear
        if 1==fear_Count
            fear_Data=zeros(1,1);
            fear_Timings=zeros(1,1);
        else
            fear_Data=zeros(fear_Count-1,1);
            fear_Timings=zeros(fear_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,fear_Count,fear_Lines,fear_Data,fear_Timings);
        end
        
        % anger
        % initialization of anger
        if 1==anger_Count
            anger_Data=zeros(1,1);
            anger_Timings=zeros(1,1);
        else
            anger_Data=zeros(anger_Count-1,1);
            anger_Timings=zeros(anger_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,anger_Count,anger_Lines,anger_Data,anger_Timings);
        end
        
        % happiness
        % initialization of happiness
        if 1==happiness_Count
            happiness_Data=zeros(1,1);
            happiness_Timings=zeros(1,1);
        else
            happiness_Data=zeros(happiness_Count-1,1);
            happiness_Timings=zeros(happiness_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,happiness_Count,happiness_Lines,happiness_Data,happiness_Timings);
        end
        
        % saddness
        % initialization of saddness
        if 1==saddness_Count
            saddness_Data=zeros(1,1);
            saddness_Timings=zeros(1,1);
        else
            saddness_Data=zeros(saddness_Count-1,1);
            saddness_Timings=zeros(saddness_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,saddness_Count,saddness_Lines,saddness_Data,saddness_Timings);
        end
        
        % disgust
        % initialization of disgust
        if 1==disgust_Count
            disgust_Data=zeros(1,1);
            disgust_Timings=zeros(1,1);
        else
            disgust_Data=zeros(disgust_Count-1,1);
            disgust_Timings=zeros(disgust_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,disgust_Count,disgust_Lines,disgust_Data,disgust_Timings);
        end
        
        % contempt
        % initialization of contempt
        if 1==contempt_Count
            contempt_Data=zeros(1,1);
            contempt_Timings=zeros(1,1);
        else
            contempt_Data=zeros(contempt_Count-1,1);
            contempt_Timings=zeros(contempt_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,contempt_Count,contempt_Lines,contempt_Data,contempt_Timings);
        end
        
        % amusement
        % initialization of amusement
        if 1==amusement_Count
            amusement_Data=zeros(1,1);
            amusement_Timings=zeros(1,1);
        else
            amusement_Data=zeros(amusement_Count-1,1);
            amusement_Timings=zeros(amusement_Count-1,1);
            data_Timing(wordLevel_Transcript_Timings,amusement_Count,amusement_Lines,amusement_Data,amusement_Timings);
        end
    end
end

function    [wordLevel_Transcript_Timings,data,data_Timings]=data_Timing(wordLevel_Transcript_Timings,data_Count,data_Line,data,data_Timings)
    
    if (1~=isempty(data_Count))
        % process the information of arousal
        for i=1:data_Count-1
            b = strsplit(data_Line{i},' ');
            data(i)=str2double(b{2});
            data_Timings(i)=str2double(b{1});
        end
        [wordLevel_Transcript_Timings,data,data_Timings]=Reset_Timing (wordLevel_Transcript_Timings,data,data_Timings);
    end
end

function [wordLevel_Transcript_Timings,data,data_Timings]=Reset_Timing(wordLevel_Transcript_Timings,data,data_Timings)
    % the timings of wordLevel_Transcript_User as the mark of the timeline 
    % each feature data will be reorganizaed according to this timeline
    % synchronization of the time and data
    time_Count = max(size(wordLevel_Transcript_Timings));
    data_Count = time_Count;
    index=1;
    if(0~=(data(1)))
        % synchronization of input feature
        for i=1:max(size(wordLevel_Transcript_Timings))-1
            if index<time_Count
                if wordLevel_Transcript_Timings(index,1)<wordLevel_Transcript_Timings(index,2)
                    if data_Timings(i)<wordLevel_Transcript_Timings(index,1)
                        data_Timings(i)=-1;
                        data(i)=-1;
                        time_Count=time_Count-1;
                    elseif ((wordLevel_Transcript_Timings(index,1)<=data_Timings(i))&&(data_Timings(i)<=wordLevel_Transcript_Timings(index,2)))
                    elseif wordLevel_Transcript_Timings(index,1)<data_Timings(i)
                        if data_Timings(i)<wordLevel_Transcript_Timings(index+1,1)
                            data_Timings(i)=-1;
                            data(i)=-1;
                            time_Count=time_Count-1;
                            index=index+1;
                        elseif (wordLevel_Transcript_Timings(index+1,1)<=data_Timings(i))&&(data_Timings(i)<=wordLevel_Transcript_Timings(index+1,2))
                            index=index+1;
                        else 
                            index=index+1;
                        end
                    end
                elseif wordLevel_Transcript_Timings(index,1)==wordLevel_Transcript_Timings(index,2)
                    if 0==wordLevel_Transcript_Timings(index,1)
                        if data_Timings(i)<wordLevel_Transcript_Timings(index+1,1)
                            data_Timings(i)=-1;
                            data(i)=-1;
                            time_Count=time_Count-1;
                        elseif (wordLevel_Transcript_Timings(index+1,1)<=data_Timings(i))&&(data_Timings(i)<=wordLevel_Transcript_Timings(index+1,2))
                            index=index+1;
                        else 
                            index=index+1;
                        end
                    else
                        fprintf('there is a time error in the wordLevel_Transcript_Timings at %s  to  %s', wordLevel_Transcript_Timings(index,1),wordLevel_Transcript_Timings(index,2));
                        index=index+1;
                    end
                else
                    fprintf('there is a time error in the wordLevel_Transcript_Timings at %s  to  %s', wordLevel_Transcript_Timings(index,1),wordLevel_Transcript_Timings(index,2));
                    index=index+1;
                end
            end
        end
    end

    temp_Data = zeros(time_Count-1,1);
    temp_Timings = zeros(time_Count-1,1);
    i=1;
    for j=1:data_Count
        if 0 ~= data_Timings(j)
            temp_Data(i)=data(j);
            temp_Timings(i)=data_Timings(j);
            i=i+1;
        end
    end
    
    data=temp_Data;
    data_Timings=temp_Timings;
end