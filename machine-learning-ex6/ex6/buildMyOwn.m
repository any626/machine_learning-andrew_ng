
clear; close all;

page_output_immediately (1);

fprintf('\nPreprocessing sample email (emailSample1.txt)\n');
[files, err, msg] = readdir('easy_ham');
if err ~= 0
    disp(err);
    disp(msg);
    quit;
end

% readdir returns . and .. in the list of files. 
% Starting loop at 3 to skip over those.
numOfFiles    = length(files);
numOfFileDisp = numOfFiles - 2;
for i = 3:numOfFiles
    file_contents = fileread(strcat('easy_ham/', files{i}));
    word_indices  = processEmail(file_contents);
    features      = emailFeatures(word_indices);
    fprintf('%d out of %d\n', i, numOfFileDisp);
end