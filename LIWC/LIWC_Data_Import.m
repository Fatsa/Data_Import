
function LIWC_Data_Import (maindir)
    % exported file absolute path
    export_FilePath=uigetdir( 'choose the export folder' );
    % subfolder path
    subdir = dir (maindir);
    % process each subfolder
    for i = 1: length(subdir)
        % it is not the path of folder, it will just skipped
        if (isequal(subdir(i).name,'.')||...
                isequal(subdir(i).name,'..')||...
                ~subdir(i).isdir)
            continue;
        end
        % collect all the txt files under the subfolder
        subdirpath = fullfile( maindir, subdir(i).name,'*.csv' );
        % the set of filenames of txt files
        dat = dir( subdirpath );
        
        % the set of file names
        b = length(dat);
        fileName = cell(b,1);
        for j = 1 : length( dat )
            fileName(j)= cellstr(dat(j).name);
        end    

        % fullfile the absolute path of txt file
        pathName = fullfile( maindir, subdir(i).name);
        export_FilePath = strcat(export_FilePath,'/');
        export_FileName = strcat(export_FilePath,subdir(i).name);

        % process each txt file
        if  ~iscell(fileName)
            fileName1 = cellstr(fileName);
            LIWC_Sensitivity (fileName1, pathName);
        else
            LIWC_Sensitivity (fileName, pathName);
        end

%        LIWC_Sensitivity_Export(export_FileName, sensitivity);  
    end
end