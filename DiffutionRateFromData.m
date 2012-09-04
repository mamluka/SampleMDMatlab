function diffusion = DiffutionRateFromData(rootFilename,numberingVector,boxSize)
gridSize = length(importdata([rootFilename,sprintf('%7.7i',numberingVector(1))]));
numberOfSteps = length(numberingVector)-1;
counter=1;

diffusion = zeros(numberOfSteps,1);

for i = 1:numberOfSteps
    t0grid = sortrows(importdata([rootFilename,sprintf('%7.7i',numberingVector(i))]),1);
    tgrid = sortrows(importdata([rootFilename,sprintf('%7.7i',numberingVector(i+1))]),1);
    
%     norms = sum(abs((tgrid(:,2:4)-t0grid(:,2:4))).^2,2);
%     boundryFixnorms = norms > boxSize/2;
%     
%     norms = norms + sum(abs(tgrid(:,2:4)-t0grid(:,2:4)-ones(1,3)*boxSize).^2,2)*boundryFixnorms';
    
    delta = tgrid(:,2:4)-t0grid(:,2:4);
    boundryJumpingAtoms = abs(delta) > boxSize/2;
    delta = abs(delta) - boundryJumpingAtoms*boxSize;
    
    norms = sum(abs(delta).^2,2);
    positionVariance = sum(norms);
    
    diffusion(counter) = positionVariance/gridSize;
    counter = counter +1;
end

plot(numberingVector(1:end-1),diffusion);

end