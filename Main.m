% the main entrance of Data import which includes the functions selection 

function Main ()
    %maindir = uigetdir('choose the input folder\n'); 
    txtdir = '/Users/village/Desktop/Text_Results';
    semdir = '/Users/village/Desktop/Annotations';
%    LIWC_Data_Import(maindir);
%    CR_Data_Import(maindir);
%    universality_Data_Import();
%    world_Cloud_Data_Import();

    LIWC_Input (txtdir);
    SEM_Input (semdir);
end
