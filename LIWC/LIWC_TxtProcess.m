function LIWC_TxtProcess(fileName, pathName, export_FilePath)
    for n = 1 : length(fileName)
        path = strcat(pathName,'/',fileName{n});
        str = textread(path,'%s');
        
        LIWC_TxtSegment(str, fileName{n}, export_FilePath);
    end
end

function LIWC_TxtSegment(data_Cells, fileID, export_FilePath)
    path = strcat(export_FilePath,fileID);
    fID=fopen(path,'w');
    %labeling the content of the real sentence
    % 0 means true
    % 1 means false
    Flag = 0;
    for n = 1 : length(data_Cells)
        % judge wheter this sentence is the words of the user
        if false == isempty(strfind(data_Cells{n},'---'))
            % 0 means true
            % 1 means false
            Flag = rem((Flag+1),2);
        else
            if 0 == Flag
                if 1 == isempty(str2num(data_Cells{n}))
                    if false == isempty(strfind(data_Cells{n},'.'))
                         fprintf(fID,'%s\n',data_Cells{n});
                    elseif false == isempty(strfind(data_Cells{n},'<'))
                        fprintf(fID,' ',data_Cells{n});
                    else
                        fprintf(fID,'%s ',data_Cells{n});
                    end
                end
            end
        end
    end
    fclose(fID);
end