% fileName means the file name
% path means the path of the file
% return 
%
function  Transcript_Process (fileName, pathName)
    % combine the file path and the file name
    path = fullfile(pathName,fileName);
    resultFile = fullfile(pathName,'transcript.txt');
    timeFile = fullfile(pathName, 'time.txt');
    
    % open the file and store the data in IOStream
    % message is used to label the error
    % path including the file name and its path
    [ioStream,message] = fopen(path,'r');
    
    % select the type of the file and judge whether IOStream is empty or not
    % different type will be processed differently 
    if (0 ~= message) 
        fprintf('It is a error to open the file in Transcript_Process.m)\n');
        exit(EXIT_FAILURE);
    else 
        % create the new txt file for results
        fileTime = fopen (timeFile,'wt');
        fileResult = fopen(resultFile,'wt');
        timeIndex = 0;
        % read the text by each sentence
        while 0 == feof(ioStream)
            titleLine = fgetl(ioStream);
            c = strsplit(titleLine,'\t');
            t = strsplit(c{1});
            if (0 == timeIndex)
                t1 = strsplit(t{1},':');
                timeIndex = 60*str2num(t1{1})+str2num(t1{2})+0.001*str2num(t1{3}); 
            end
            if (1 == strcmp('User',t{3}))
                t1 = strsplit(t{1},':');
                t2 = strsplit(t{2},':');
                t11 = 60*str2num(t1{1})+str2num(t1{2})+0.001*str2num(t1{3}); 
                t12 = 60*str2num(t2{1})+str2num(t2{2})+0.001*str2num(t2{3});
                fprintf(fileTime,'%f %f\n',t11 - timeIndex,t12-t11);
                fprintf(fileResult,'%s\n', c{2});
            end
        end
        fclose(fileTime);
        fclose(fileResult);
    end
    % close the ioStream (fileStream)
    fclose(ioStream);
end