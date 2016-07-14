
function FR_Data_Import (maindir)
    % exported file absolute path
    export_FilePath=uigetdir( 'choose the export folder' );
    % subfolder path
    subdir  = dir( maindir );  
    % process each subfolder
    for i = 1 : length( subdir )
        % if it is not the path of folder, it will just be skipped
        if( isequal( subdir( i ).name, '.' )||...
                isequal( subdir( i ).name, '..')||...
                ~subdir( i ).isdir)               
            continue;
        end
        % collect all the txt files under the subfolder
        subdirpath = fullfile( maindir, subdir( i ).name, '*.txt' );
        % the set of filenames of txt files
        dat = dir( subdirpath );

        % the set of file names
        b = length(dat);
        fileName = cell(b,1);
        for j = 1 : length( dat )
            fileName(j)= cellstr(dat(j).name);
        end    
        
        % fullfile the absolute path of txt file
        pathName = fullfile( maindir, subdir( i ).name);
        % fullfile the absolute path export folder
        export_FilePath = strcat(export_FilePath,'/');
        export_FileName = strcat(export_FilePath,subdir( i ).name);
                
        % process each txt file
        if  ~iscell(fileName)
            fileName1 = cellstr(fileName);
            [FR_Lines_temp, lines_Num]=File_Selection(fileName1,pathName);
        else
            [FR_Lines_temp, lines_Num]=File_Selection(fileName,pathName);
        end
        
        % structurize the final data 
        [data_FaceReader]=FR_Synchronization(FR_Lines_temp, lines_Num);

    end
end