function [X, y] = rapporte_a_un(X,y, Max_X, Max_y)



if Max_y == 0
    y = y * 1;
end

if Max_y > 0;
y = y * (1/Max_y);
end



for i = 1 : size(X,2)

    if Max_X(1,i) == 0
    X(:,i) = X(:,i)*1; 
    end
    
    if Max_X(1,i) > 0
    
    X(:,i) = X(:,i)*(1/Max_X(1,i));
    
    end

end



end

