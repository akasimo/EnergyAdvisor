function [X] = powTransforms( X, puissance )
%UNTITLED3 Summary of this function goes here

%   Detailed explanation goes here


for j = 1 : size(X,2)
    for i = 1 : size(X,1)
        %puissances differentes suivant
         X(i,j) = X(i,j)^puissance;
         
    end
end



end

