
function FR_Data_Import (maindir)
    % exported file absolute path
    export_FilePath=uigetdir( 'choose the export folder' );

    % collect all the txt files under the subfolder
    subdirpath = fullfile( maindir, '*.mat' );
    % the set of filenames of txt files
    dat = dir( subdirpath );

    % the set of file names
    b = length(dat);
    fileName = cell(b,1);
    for j = 1 : length( dat )
        fileName(j)= cellstr(dat(j).name);
    end    

    % fullfile the absolute path of txt file
    pathName = fullfile( maindir);
    export_FileName = strcat(export_FilePath,'/Overall');
    
    % process each txt file
    if  ~iscell(fileName)
        fileName1 = cellstr(fileName);
        %[FR_Lines_temp, lines_Num]=FR_File_Selection(fileName1,pathName);
    else
        %[FR_Lines_temp, lines_Num]=FR_File_Selection(fileName,pathName);
    end

    % structurize the final data 
    %[data_FaceReader]=FR_Synchronization(FR_Lines_temp, lines_Num);

    % export the proessed data into a csv.file
    %FR_Export_Data(export_FileName,data_FaceReader);
end