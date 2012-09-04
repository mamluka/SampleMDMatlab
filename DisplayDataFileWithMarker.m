function DisplayDataFileWithMarker(filename)
    grid = importdata(filename);
    scatter3(grid(:,2),grid(:,3),grid(:,4),(grid(:,1)==123)*50+30,(grid(:,1)==123)+2,'filled');
    axis([-1 12 -1 12 -1 12])
end