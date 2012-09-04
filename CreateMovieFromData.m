function CreateMovieFromData(rootFilename,numberingVector)

vidObj = VideoWriter('peaks.avi');
open(vidObj);

counter=1;
for currentFilenumber = numberingVector
    grid = importdata([rootFilename,sprintf('%5.5i',currentFilenumber)]);
    scatter3(grid(:,1),grid(:,2),grid(:,3));
    axis([-2 12 -2 12 -2 12])
    movieFrames(counter) = getframe;
    writeVideo(vidObj,movieFrames(counter));
    counter=counter+1;
    
end
%movie(movieFrames,20,1)
close(vidObj);
end