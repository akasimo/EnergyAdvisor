function [J ,grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda, nbweightmatrices)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of thelambda
%   partial derivatives of the neural network.grad c'est D dans le pdf
%unrolled vector comme nn_param veut  simplement dire que l'on deroule dans
%un vecteur colone toutes les derivees partielles en chacunes des variables
%des matrices de poids

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network


    Theta = cell(1, nbweightmatrices);

Theta{1} = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                  hidden_layer_size, (input_layer_size + 1));%gaffe elem inout output

incrementation = hidden_layer_size * (input_layer_size + 1); 
 
              

for i = 2 : nbweightmatrices - 1
    
    Theta{i} = reshape(nn_params( incrementation + 1 : incrementation + hidden_layer_size * (hidden_layer_size + 1)), ...
                  hidden_layer_size, (hidden_layer_size + 1));%gaffe elem inout output
    
    incrementation = incrementation + hidden_layer_size * (hidden_layer_size + 1);
end

Theta{nbweightmatrices} = reshape(nn_params( incrementation + 1 : incrementation + num_labels * (hidden_layer_size + 1)), ...
                  num_labels, (hidden_layer_size + 1));



m = size(X, 1);

J = 0;

h_theta_i = zeros(num_labels, 1); 


% ***** CODE MARCHE PART 1  *****

m = size(X,1);% en ligne donc dim 1 = nombre d'exemples
K = num_labels;
J = 0;

 for i = 1 : m


h_theta_i = predict(nn_params, X(i,:), hidden_layer_size, input_layer_size, num_labels, nbweightmatrices);


    J = J + (h_theta_i - y(i))^2;
   
end

J = J/m;

regulization = 0;

 for a = 1 : nbweightmatrices
     
    for j = 1 : size(Theta{a},1)
         for k = 1 : size(Theta{a},2)
        
              regulization = regulization + Theta{a}(j,k)^2;
        
         end
    end
    
 end


regulization = regulization * lambda/(2*m);

%regulization
J = J + regulization;
regulization;
% Jcout = J

   
% ***** CODE MARCHE PART 1  *****

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.


            nblayer = nbweightmatrices + 1;% verifier ça
            
            a = cell(1, nblayer);%tab de 3 matrices pour les 3 layers
            
            z = cell(1, nblayer); %besoin de z pour calculer erreur de chaque layer et l'erreur va evidemment till layer 2 donc z{1} ne sert à rien !
            delta = cell(1, nblayer); %delta(k) intuitivement est l'erreur liée à la couche k  l'erreur va evidemment till layer 2 donc delta{1} ne sert à rien !
                                      %car la premiere couche est le
                                      %vecteur d'entree et
                                   % il n'y a pas eu de calcul dessus 
                                   %avec les matruces de poids donc pas
                                   %d'erreur
            
            

            GradAccum = cell(1, nbweightmatrices);
            

           
           for i = 1 : nbweightmatrices
           GradAccum{i} = zeros(size(Theta{i}));
           end
            acum = zeros(size(Theta{1}));
            
      
               for t  =  1 : m %backpropa commence ici 
                   
                 a{1} = X(t,:);
%                  a{1}
                 %il n'y a pas de z{1}
                 
                 for i = 1 : nbweightmatrices % l'indice sert aux matrices de poids il y en a nblayer - 1
                 %pour les differents calcul de a / z / etc           
   
                       
                         a{i} = [ones(1, 1) a{i}];%plus tard je me ressers de ai et j'ai besoin que l'ajout du 1 soit enterine dans la forme de ai
                       
                         z{i + 1} = a{i} * Theta{i}'; %au niveau des z on ne rajoute pas de 1 

                        a{i+1} = fonction_activation(z{i+1});
                        
                 
                 end
                

                      % delta{nblayer} = 2*(a{nblayer}' - y(t)).*1;%possibilite que tout vienne de là 
                       delta{nblayer} = 2*(a{nblayer}' - y(t)).*derivee_fonction_activation(z{nblayer}');
                       %le 2 est là à cause de la forme de la fonction de  %coût
                       
                      
                       
                       
                         
                       

                      % delta{nblayer - 1} = Theta{nblayer - 1}'*delta{nblayer}.*1;
                      delta{nblayer - 1} = Theta{nblayer - 1}'*delta{nblayer}.*derivee_fonction_activation([1000 ; z{nblayer - 1}']); % nblayer - 1 = dernier matrice de poids
                     %J AI COMPRIS !!!! LE 1000 AJOUTE ON S EN FOUT PUISQU
                    
                      

                       
                       for i = nblayer - 2 : -1 : 2 % il n'y a pas d'erreur pour couche 1 et erreur de la derniere et avant derniere layer deja calculee
                       
       
                         delta{i + 1} = delta{i + 1}(2:end); % 61 --> 60
         
                         
          
          
            %*********DOUILLE************** %*********DOUILLE************** %*********DOUILLE**************
%                          delta{i} = Theta{i}'*delta{i+1}.*1  ;
                         delta{i} = Theta{i}'*delta{i+1}.*derivee_fonction_activation([1000 ; z{i}'])  ;
             %*********DOUILLE************** %*********DOUILLE************** %*********DOUILLE**************
                         
%                          ******DOUILLE******
% %                        delta{i} = delta{i}(2:end);
%                          ******DOUILLE******
                                 %on enleve le terme inutile pour preparer le calcul du terme suivant
                       
                       end
                       
                       %DOUILLE §!!!!!
                          delta{2} = delta{2}(2:end); 
                         %DOUILLE §!!!!!
                       
                       
                       %%%DOUILLE!!!!!!!!!!!!!!!!!
%                        for i = 1 : nbweightmatrices - 1
%                           
%                            delta{i + 1} = delta{i + 1}(2:end);
%                        end
                      %%%DOUILLE!!!!!!!!!!!!!!!!!
                      
                      
                      
                       
                       for i = 1 : nbweightmatrices
%                             size(GradAccum{i},1)
%                             size(GradAccum{i},2)
                           
%                             
%                              size(delta{i + 1},1)
%                              size(delta{i + 1},2)
%  
%                             size(a{i},1)
%                            size(a{i},2)
%                          x_concerne = t
%                          
% %                          deriv_test = delta{2 + 1}*a{2};
% %                          derivee_calculee_du_cout = deriv_test(1,20)
% %                          derivee_theorique_du_cout = 2*(a{nblayer} - y(t))*a{2}(1,20)
% %                          coeff_a = a{2}(1,2)
% %                          difference_initiale = a{nblayer} - y(t)
% 
% 
                         deriv_test = delta{1 + 1}*a{1};
                         derivee_calculee_du_cout = deriv_test(1,1);
                         derivee_theorique_du_cout = 2*(a{nblayer}' - y(t))*a{1}(1,1)*Theta{2}(1,2);
%                          coeff_a = a{2}(1,2)
                         difference_initiale = a{nblayer} - y(t);
%                          
%                      pause;
%                       test =  delta{i + 1}*a{i};

%                       if i == 1
%                       theorAvAd = GradAccum{i}
%                       AdTheor = delta{i + 1}*a{i}
%                       end

%                         dimE1i = size(GradAccum{i},1)
%                         dimE2i = size(GradAccum{i},2)
%                         i
% 
%                         dimF1i = size(delta{i + 1}*a{i},1)
%                         dimF2i = size(delta{i + 1}*a{i},2)   
%                         i

                     %  GradAccum{i} = GradAccum{i} + delta{i}*a{i};
                      GradAccum{i} = GradAccum{i} + delta{i + 1}*a{i};% voir si manque pas transposee par rapport formule tp
                      % probleme vient de delta{i + 1}*a{i} --> doit etre
                      % 60 X 2 au lieu de 61 X 2   =  61 X ? = 1  *   ? = 1 X 2
                      
%                         GradAccum{i} = GradAccum{i} + test;

%                      if i == 1
%                       theorApAd = GradAccum{i}
%                    
%                      end

                     
                      if i == 1
%                          acumAvAd = acum
%                           ad = delta{1 + 1}*a{1}
                      acum =  acum + deriv_test;
%                       acumApAd = acum
                      end
                      
                      
                 end
%                        acum_theor = acum
%                       acum_calc = GradAccum{1}
%                       pause;  
               end


%                       lambda deja defini plus haut
%                        for l = 1 : nbweightmatrices% partie finale du calcul du gradient et donc des derivees partielles
%                            GradAccum{l} = GradAccum{l} * (1/m);
%                        end

                    for k = 1 : nbweightmatrices
                          
                           for i = 1 : size(GradAccum{k},1)
                           
                               for j = 1 : size(GradAccum{k},2)
                               
                                     if j == 1 
                                     %GradAccum{1}(1,2)
                                     
                                     GradAccum{k}(i,j) = GradAccum{k}(i,j) * (1/m);
%                                         GradAccum{k}(i,j) = GradAccum{k}(i,j) * (2/m);
                                    % test0 = GradAccum{k}(i,j) * (1/m)
                                     
                                     end
                                     
                                      if j > 1 
                                     %GradAccum{1}(1,2)
                                     
                                      GradAccum{k}(i,j) = GradAccum{k}(i,j) * (1/m) + Theta{k}(i,j)*lambda/m;
%                                       GradAccum{k}(i,j) = GradAccum{k}(i,j) * (2/m) + Theta{k}(i,j)*lambda/m;
                                      %test1 = GradAccum{k}(i,j) * (1/m)
                                      %test2 = Theta{k}(i,j)*lambda/m
                                     
                                     end
                                     
                                end
                           end
                           
                           
                       
                  %   k                        
                   %  GradAccum{k}
                           
                     end
     
                      
                      
                 





%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% la cost function est 1 fonction qui dépend des poids des deux matrices.
% On peut donc calculer les derivees partielles par rapport à chacun de ces
% varibles et comme ici ces varibles ont une valeur precise on peut
% calculer la valeur numerique des derivees partielles en le point en
% lequel on se situe maintenant 

















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients

grad = [GradAccum{1}(:)];

for i = 2 : nbweightmatrices % deja unrollé la premiere
grad = [grad ; GradAccum{i}(:)] ;
end

% initial_nn_params
% grad = [GradAccum{1}(:) ; GradAccum{2}(:)];


end
