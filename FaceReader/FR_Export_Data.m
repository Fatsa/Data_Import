% % Writes matrix of FaceReader data content into a *.csv file.
% %
% % in the code 
% % export_FileName      = Name and path of the file to save. [ i.e. 'text.csv' ]
% % data_FaceReader = Values of FaceReader data

function FR_Export_Data(export_FileName,data_FaceReader)
    csvwrite(export_FileName, data_FaceReader);
end