% the main entrance of Data import which includes the functions selection 

function Main ()
    %maindir = uigetdir('choose the input folder\n'); 
    maindir = '/Users/village/Desktop/Text/Obadiah';
    LIWC_Data_Import(maindir);
%    CR_Data_Import(maindir);
%    universality_Data_Import();
%    world_Cloud_Data_Import();
end
