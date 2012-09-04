function g=RadialDisrtibutionFunctionFromData(filename,limit)
if nargin == 1
    limit=2.5;
end
grid = importdata(filename);
gridSize = size(grid,1);

d=zeros(gridSize^2,1);
counter=1;
for i=1:gridSize
    for j=1:gridSize
        if i ~= j
            p = norm(grid(i,2:4)-grid(j,2:4));
            if p < limit
                d(counter) = p;
                counter = counter + 1;
            end
        end
    end
end

r = 0:0.1:2.5;
d = d(d~=0);
n = histc(d,r)/2;
vol = ((4*pi/3)*((r(2:end)).^3-r(1:end-1).^3))';
g = n(2:end)./(vol);
g=g/sum(n);

plot(r(2:end)',g)

end