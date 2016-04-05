function g = derivee_fonction_activation(z)
%returns the activation function


%===== DERIVEE g(z) = z^p  ==============%%%%%%%%%
g = z;
p = 2;
for i = 1 : size(g,1)
    for j = 1 : size(g,2)
        
        g(i,j) = p*g(i,j)^(p-1);
    end
end
%===== DERIVEE g(z) = z^p   ==============%%%%%%%%%

end
