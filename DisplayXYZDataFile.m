function DisplayXYZDataFile(filename)
    import = importdata(filename,' ',1);
    grid = import.data;
    scatter3(grid(:,1),grid(:,2),grid(:,3));
end