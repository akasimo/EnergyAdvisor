function [ Max_X, Max_y ] = Maximum( X, y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


Max_y = abs(y(1,1));
for i = 1 : size(y,1)

    if abs( y(i,1) ) > Max_y
    Max_y = abs( y(i,1) );
    end

end



Max_X = abs( X(1,:) );

for j = 1 : size(X,2)
   for i = 1 : size(X,1)
       
        if abs( X(i,j) ) > Max_X(1,j)
        Max_X(1,j) = abs( X(i,j) );
        end
        
   end



end

