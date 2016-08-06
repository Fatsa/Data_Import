% Writes matrix of FeelTrace sensitivity content into a *.csv file.
%
% in the code 
% export_FileName      = Name of the file to save. [ i.e. 'text.csv' ]
% sensitivity = Values of FeelTrace sensitivity
% export_FileName = the export file path and the file name

function FT_Sensitivity_Export(export_FileName, sensitivity)
    csvwrite(export_FileName, sensitivity);
end