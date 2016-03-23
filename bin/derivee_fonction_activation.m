function g = derivee_fonction_activation(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function



%===== DERIVEE k*SIGMOID(z) ==============%%%%%%%%%
% k = 9.0121;
% sig_mat = sigmoid(z);
% sig_mat_carre = sig_mat;
% 
% for i = 1 : size(sig_mat_carre,1)
%     for j = 1 : size(sig_mat_carre,2)
%         sig_mat_carre(i,j) = sig_mat_carre(i,j)^2;
%     end
% end
% 
% g = sig_mat - sig_mat_carre;
% g = k*g;
%===== DERIVEE SIGMOID(z) ==============%%%%%%%%%








%===== DERIVEE g(z) = z^p  ==============%%%%%%%%%
g = z;
p = 2;
for i = 1 : size(g,1)
    for j = 1 : size(g,2)
        
        g(i,j) = p*g(i,j)^(p-1);
    end
end
%===== DERIVEE g(z) = z^p   ==============%%%%%%%%%






%===== DERIVEE g(z) = z  ==============%%%%%%%%%
% g = z;
% for i = 1 : size(g,1)
%     for j = 1 : size(g,2)
%         
%         g(i,j) = 1;
%     end
% end
%===== DERIVEE g(z) = z   ==============%%%%%%%%%








% ====================== YOUR CODE HERE ======================
% Instructions: Compute the gradient of the sigmoid function evaluated at
%               each value of z (z can be a matrix, vector or scalar).














% =============================================================




end
