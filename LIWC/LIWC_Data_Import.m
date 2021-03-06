
function LIWC_Data_Import (maindir)
    % exported file absolute path
    %export_FilePath=uigetdir( 'choose the export folder' );
    export_FilePath = '/Users/village/Desktop/Text/Prudence_Output/';
    % subfolder path
    subdir = dir (maindir);
    % process each subfolder
    for i = 1: length(subdir)
        
%         % it is not the path of folder, it will just skipped
%         if (isequal(subdir(i).name,'.')||...
%                 isequal(subdir(i).name,'..')||...
%                 ~subdir(i).isdir)
%             continue;
%         end

        % collect all the txt files under the subfolder
        subdirpath = fullfile( maindir, subdir(i).name,'*.txt' );
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
        %export_FilePath = strcat(export_FilePath,'/');
        %export_FileName = strcat(export_FilePath,subdir(i).name);

        % process each txt file
        if  ~iscell(fileName)
            fileName1 = cellstr(fileName);
            % calculate the sensitivity
            %LIWC_Sensitivity (fileName1, pathName);
            
            % process the txt file
            LIWC_TxtProcess(fileName1, maindir, export_FilePath);
        else
            % calculate the sensitivity
            %LIWC_Sensitivity (fileName, pathName);
            
            % process the txt file
             LIWC_TxtProcess(fileName, maindir, export_FilePath);
        end
        
%        LIWC_Sensitivity_Export(export_FileName, sensitivity);  
    end
end