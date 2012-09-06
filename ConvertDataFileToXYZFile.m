function ConvertDataFileToXYZFile(filename,outputFileame,element,scale)
grid = importdata(filename);

gridSize = length(grid);

fileId = fopen(outputFileame,'w');
    
    fprintf(fileId,'%i\n',gridSize);
    fprintf(fileId,[element,'%15.9f%15.9f%15.9f\n'],grid(:,2:4)'*scale);


fclose(fileId);
end