function DisplayDataFile(filename)
    grid = importdata(filename);
    scatter3(grid(:,2),grid(:,3),grid(:,4));
    axis([-1 12 -1 12 -1 12])
end