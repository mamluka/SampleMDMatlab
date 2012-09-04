function d=DistanceDistributionFromFile(filename)

if nargin == 1
    limit=2.5;
end

grid = importdata(filename);
gridSize = size(grid,1);

d=zeros(gridSize^2,3);
counter=1;
for i=1:gridSize
    for j=1:gridSize
        if i ~= j
            p = norm(grid(i,2:4)-grid(j,2:4));
            if p < limit && p > 0
                d(counter,1) = p;
                d(counter,2:end) = [grid(i,1),grid(j,1)];
                counter = counter + 1;
            end
        end
    end
end
d=d(d(:,1) > 0,:);
d=sortrows(d,1);
end