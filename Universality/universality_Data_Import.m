function universality_Data_Import()
    FT_maindir = uigetdir('choose the input folder\n');
    FR_maindir = uigetdir('choose the input folder\n');
    % exported file absolute path
    export_FilePath=uigetdir( 'choose the export folder' );
    FT_Data = FT_Data_Import(FT_maindir,export_FilePath);

    FR_Data = FR_Data_Import(FR_maindir,export_FilePath);
    
    [results] = universality_Draw(FT_Data, FR_Data);
end