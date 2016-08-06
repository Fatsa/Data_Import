% the main entrance of Data import which includes the functions selection 

function Main ()
    maindir = uigetdir('choose the input folder');
    
    FR_Data_Import(maindir);
end