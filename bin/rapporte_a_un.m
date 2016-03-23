function [X, y] = rapporte_a_un(X,y, Max_X, Max_y)

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Max_y = y(1,1)
% for i = 1 : size(y,1)
% 
%     if y(i,1) > Max_y
%     Max_y = y(i,1);
%     end
% 
% end
% 
% 
% 
% Max_X = X(1,:)
% 
% for j = 1 : size(X,2)
%    for i = 1 : size(X,1)
%        
%         if X(i,j) > Max_X(1,j)
%         Max_X(1,j) = X(i,j);
%         end
%         
%    end
% 
% end

if Max_y == 0
    y = y * 1;
end

if Max_y > 0;
y = y * (1/Max_y);
end


%partie mise a un pour la matrice des X
% A = 'avant'
for i = 1 : size(X,2)

    if Max_X(1,i) == 0
    X(:,i) = X(:,i)*1; 
%    fprintf('ta gueule 1')
%     pause;
    end
    
    if Max_X(1,i) > 0
    
    X(:,i) = X(:,i)*(1/Max_X(1,i));
    
%     fprintf('ta gueule 2')
%     pause;
    end
%     test = Max_X(1,i)

end
% B = 'apres'

% X(:,1) = X(:,1)*(1/Max_X(1,1));
% X(:,2) = X(:,2)*(1/Max_X(1,2));

end

