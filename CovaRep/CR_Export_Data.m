% exports the file data
% export_FileName represent the export file path
% ov_Data_CovaRep represent the overall file data
%
function CR_Export_Data(export_FileName,ov_Data_CovaRep)
    csvwrite(export_FileName, ov_Data_CovaRep);
end