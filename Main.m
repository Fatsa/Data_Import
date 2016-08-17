% the main entrance of Data import which includes the functions selection 

function Main ()
    maindir = uigetdir('choose the input folder');
    
    LIWC_Data_Import(maindir);
end