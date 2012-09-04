function CreateMovieFromDataWithTracker(rootFilename,numberingVector)

vidObj = VideoWriter('peaks3d.avi');
open(vidObj);

counter=1;
for currentFilenumber = numberingVector
    
    grid = importdata([rootFilename,sprintf('%7.7i',currentFilenumber)]);
    scatter3(grid(:,2),grid(:,3),grid(:,4),(grid(:,1)==123)*50+30,(grid(:,1)==1)+2,'filled');
    axis([-2 12 -2 12 -2 12])
    movieFrames(counter) = getframe;
    writeVideo(vidObj,movieFrames(counter));
    counter=counter+1;
    
end
close(vidObj);

vidObj = VideoWriter('peaksXY.avi');
open(vidObj);

counter=1;
for currentFilenumber = numberingVector
    
    grid = importdata([rootFilename,sprintf('%7.7i',currentFilenumber)]);
    scatter3(grid(:,2),grid(:,3),grid(:,4),(grid(:,1)==123)*50+30,(grid(:,1)==1)+2,'filled');
    axis([-2 12 -2 12 -2 12])
    view([0,90])
    movieFrames(counter) = getframe;
    writeVideo(vidObj,movieFrames(counter));
    counter=counter+1;
    
end
close(vidObj);
end