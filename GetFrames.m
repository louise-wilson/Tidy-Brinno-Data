function GetFrames(inputPath,outputPath)
%-------------------------------------------------------------------------
% 
% GetFrames(inputPath,outputPath)
% 
% Description: Function to deconstruct .avi files into composite frames.
% 
% Inputs:
% inputPath - location of .avi files e.g. ('X:\user\Video_data')
% outputPath - location to save output .jpg files e.g. ('X:\user\Frames')
% 
% Outputs:
% Frames stored in outputPath.
% 
% Author:
% Louise Wilson
% Leigh Marine Lab, University of Auckland
% Auckland, New Zealand
%--------------------------------------------------------------------------

d=dir(fullfile(inputPath, '*.avi')); 
fileCount=length(d); 

for j=1:fileCount 
    vidfile=d(j).name; 
    
    getdate=strsplit(d(j).date);
    thedate=getdate(1); 
    formatOut='yyyymmdd'; 
    filedate=datestr(thedate, formatOut); 
       
    videoObject=VideoReader(fullfile(inputPath,vidfile)); 
    
    numberOfFrames = videoObject.NumberOfFrames;
    vidHeight = videoObject.Height;
    vidWidth = videoObject.Width;

    for x=1 : numberOfFrames
    frame = read(videoObject,x);
    outputBaseFileName = sprintf('-%4.4d.jpg', x); 
    outputFullFileName = fullfile(outputPath, strcat(filedate, outputBaseFileName)); 
    imwrite(frame, outputFullFileName, 'jpg'); 
    end   
    
end

