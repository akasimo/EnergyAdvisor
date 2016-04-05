function g = fonction_activation(z)



%===== g(z) = z^p ==============%%%%%%%%%
g = z;
p = 2;
for i = 1 : size(g,1)
    for j = 1 : size(g,2)
        
        g(i,j) = g(i,j)^p;
    end
end

%===== g(z) = z^p ==============%%%%%%%%%



end
