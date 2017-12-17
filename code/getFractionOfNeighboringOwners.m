function[f] = getFractionOfNeighboringOwners(M,i,j,parameters)

%This function returns the fraction of people in the neighborhood, which already have the product. (Ebtry in Matrix == 1)
%In this case an infinite grid with periodic overlapp is used.

nnCondition = parameters.nnCondition;
l = parameters.sideLength;

%This function returns the corrected index for periodic boundary conditions
function[correctedIndex] = getInfIndex(index,l)
correctedIndex = index-l*floor((index-1)/l);
end

if(strcmp(nnCondition,'vonNeumann'))
f =(...
M(getInfIndex(i-1,l),getInfIndex(j,l))+...
M(getInfIndex(i,l),getInfIndex(j-1,l))+...
M(getInfIndex(i+1,l),getInfIndex(j,l))+...
M(getInfIndex(i,l),getInfIndex(j+1,l)))/4;
end

if(strcmp(nnCondition,'moore'))
f =(...
M(getInfIndex(i-1,l),getInfIndex(j,l))+...
M(getInfIndex(i+1,l),getInfIndex(j,l))+...
M(getInfIndex(i-1,l),getInfIndex(j-1,l))+...
M(getInfIndex(i+1,l),getInfIndex(j-1,l))+...
M(getInfIndex(i-1,l),getInfIndex(j-1,l))+...
M(getInfIndex(i+1,l),getInfIndex(j-1,l))+...
M(getInfIndex(i,l),getInfIndex(j+1,l))+...
M(getInfIndex(i,l),getInfIndex(j-1,l)))/8;
end

if(strcmp(nnCondition,'randomNetwork'))
f = (...
M(randi(l),randi(l))+...
M(randi(l),randi(l))+...
M(randi(l),randi(l))+...
M(randi(l),randi(l))+...
M(randi(l),randi(l))+...
M(randi(l),randi(l))+...
M(randi(l),randi(l))+...
M(randi(l),randi(l)))/8;
end
end
