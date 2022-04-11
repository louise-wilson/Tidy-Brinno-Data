function AddTimestamp(inputPath,outputPath,site,step,start_time)
%-------------------------------------------------------------------------
% 
% AddTimestamp(inputPath,outputPath,site,step,start_time)
% 
% Description: Function to deconstruct .avi files into composite frames.
% 
% Inputs:
% inputPath - location of .jpg frames e.g. ('X:\user\Frames')
% outputPath - location to save output .jpg files e.g. ('X:\user\Frames\timestamped')
% site - descriptor of data to be appended to each frame filename e.g.
% 'CoastalSite1'
% step - timelapse interval used e.g. minutes(1); 
% start_time - start time of time window used to collect data each day in
% datetime (HH:mm) e.g. datetime(0,0,0,6,0,0,'Format','HHmm');
% 
% Outputs:
% Labelled frames stored in outputPath.
% Files labelled as: 'site-date-time-framenumber.jpg'
% 
% Author:
% Louise Wilson
% Leigh Marine Lab, University of Auckland
% Auckland, New Zealand
%--------------------------------------------------------------------------

d=dir(fullfile(inputPath, '*.jpg')); %list all files in folder

for i=1:length(d) %for each image in folder
    
    %get date
    file=strsplit(d(i).name, {'-', '.'}); 
    filedate=file(1); %yyyymmdd
    
    %get frame number
    framenumber=char((file(2))); 

    %get time
    timeis = char(start_time+step*(str2double(framenumber)-1));
    
    %combine fileparts
    newfilename=char(strcat(site, '-', filedate, '-', timeis, '-', framenumber, '.jpg'));

    %rename file
    copyfile(fullfile(inputPath, d(i).name), fullfile (outputPath, newfilename)); 
    
end   

