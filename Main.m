% the main entrance of Data import which includes the functions selection 

function Main ()
    maindir = uigetdir('choose the input folder');
    
    FT_Data_Import(maindir);
end