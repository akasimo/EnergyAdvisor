function g = fonction_activation(z)



%===== k*SIGMOID(z) ==============%%%%%%%%%
% k = 9.0121;
% g = 1.0 ./ (1.0 + exp(-z));
% g = k*g;
%===== SIGMOID(z) ==============%%%%%%%%%




%===== g(z) = z^p ==============%%%%%%%%%
g = z;
p = 2;
for i = 1 : size(g,1)
    for j = 1 : size(g,2)
        
        g(i,j) = g(i,j)^p;
    end
end
%ecrire dans un .txt le nom de la fonction d'activation pour pouvoir s'enreservir plus tard
%===== g(z) = z^p ==============%%%%%%%%%




%===== g(z) = z ==============%%%%%%%%%
% g = z;
% for i = 1 : size(g,1)
%     for j = 1 : size(g,2)
%         
%         g(i,j) = g(i,j);
%     end
% end
%===== g(z) = z ==============%%%%%%%%%




end
