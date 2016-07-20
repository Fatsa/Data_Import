
function CR_Data_Import (maindir)
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
    export_FileName = strcat(export_FilePath,'/Obadiah');
    
    % process each txt file
    if  ~iscell(fileName)
        fileName1 = cellstr(fileName);
        [CR_Lines_Temp, lines_Num]=CR_File_Selection(fileName1,pathName);
    else
        [CR_Lines_Temp, lines_Num]=CR_File_Selection(fileName,pathName);
    end

    % structurize the final data 
    [data_CovaRep]=CR_Synchronization(CR_Lines_Temp, lines_Num);

    % export the proessed data into a csv.file
    CR_Export_Data(export_FileName,data_CovaRep);
    
    % export the overall data into a csv.file
    export_FileName = strcat(export_FilePath,'/Overall');
    [ov_Data_CovaRep] = CR_Merge(data_CovaRep);
    CR_Export_Data(export_FileName,ov_Data_CovaRep);
end