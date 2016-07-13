% Writes cell array of FeelTrace data content into a *.csv file.
% 
% Export_Data_FeelTrace(data_FeelTrace)
% data_FeelTrace = Values of FeelTrace data
%
% in the code 
% filename      = Name of the file to save. [ i.e. 'text.csv' ]
% delimiter = seperating sign, normally:',' (default)

function Export_Data_FeelTrace(filename, data_FeelTrace)
    path = '/Users/village/Desktop/Data_MasterThesis';
    filePath = strcat(path,filename);
    csvwrite(filePath,data_FeelTrace);
    
%     % Initialization
%     path = '/Users/village/Desktop/Data_MasterThesis';
%     filePath = strcat(path,filename);
%     delimiter = ',';
%     
%     % Open the file or create the file if it doesn't exist
%     f = fopen(filePath,'w');
%     for i=1:size(data_FeelTrace,1)
%         for j=1:size(data_FeelTrace,2)
%             % Execute the matlab expression in text string 
%             var = eval(['data_FeelTrace{i,j}']);
%             % Check the null value or not
%             if size(var,1) == 0
%                 var = '*';
%             end
%             % Check the numeric value or not
%             if isnumeric(var) == 1
%                 var = num2str(var);
%             end
%             % input the data
%             fprintf(f,var);
%             % input the delimiter sign
%             if s ~= size(data_FeelTrace,2)
%                 fprintf(f,[delimiter]);
%             end
%         end
%         % input the line feed character  
%         fprintf(f,'\n');
%     end
%     fclose(f);
end