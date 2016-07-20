% the main entrance of Data import which includes the functions selection 

function Main ()
    maindir = uigetdir('choose the input folder');
    
    CR_Data_Import(maindir);
end