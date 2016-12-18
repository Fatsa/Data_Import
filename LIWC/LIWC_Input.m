function LIWC_Data_Import (maindir)
    % exported file absolute path
    %export_FilePath=uigetdir( 'choose the export folder' );
    export_FilePath = '/Users/village/Desktop/Text_Results';
    % subfolder path
    subdir = dir (maindir);
    % process each subfolder
    for i = 1: length(subdir)
        % collect all the txt files under the folder
        txtdirpath = fullfile( maindir, subdir(i).name,'*.csv' );
        % the set of filenames of txt files
        dat = dir( txtdirpath );
        
        % the set of file names
        b = length(dat);
        fileName = cell(b,1);
        for j = 1 : length( dat )
            fileName(j)= cellstr(dat(j).name);
        end    

        % process each txt file
        if  ~iscell(fileName)
            fileName1 = cellstr(fileName);
            % calculate the correlations of LIWC txt
%            Correlations_LIWC(fileName1, maindir, export_FilePath);
        else
            % calculate the correlations of LIWC txt
%             Correlations_LIWC(fileName, maindir, export_FilePath);
        end
    end
end