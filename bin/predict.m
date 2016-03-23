function p = predict(nn_params, X, hidden_layer_size, input_layer_size, num_labels, nbweightmatrices)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)
% Theta1 Theta2 representent les poids du neural network ??
% X est le vecteur (matrice) d'entrée
% à mon avis X represente un ensembles de valeurs à tester, toutes en
% lignes

    Theta = cell(1, nbweightmatrices);
    h = cell(1, nbweightmatrices);
   

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


% % Useful values
% m = size(X, 1);% bizarrement quasi sûr que X est un vecteur ligne ici
% num_labels = size(Theta2, 1);% nb de chiffres possibles ???
% % signifie theta2 dim (10 x n)
% % You need to return the following variables correctly 
% p = zeros(size(X, 1), 1);% vecteur colone me semble



% h1 pas scalaire bizarrement puique represente new matrice activation
% logiquement (n,1). SUITE A UN TEST ON SE REN COMPTE QUE fonction_activation SUR UNE
% MATRICE FAIT QUE LA FONCITON fonction_activationE S APPLIQUE SUR CHACUN DES TERMES DE
% LA MATRICE

% [ones(m, 1) X] est une ligne avec 1 rajouté = x0 = 1, 
% on multiplie systematiquement tous les param xi par tous les poids d'une
% ligne de theta1' (comme on a une transposée, il faut faire gaffe que les
% poids de theta1 pour les units se trouvent bien sur les colones
% c'est le nombre de units (neuronnes d'activations) que l'on veut dans le
% hidden layer 1 qui determine le nombre de colonne de theta1'
%d'une couche à une autre on est en contrôles total du nombre de unit que
%l'on crèe, il suffit d'adapter Theta1 et Theta2 en consequence à la base
%même de l'algortyhme
%Theta1' et theta2' sont toujours des lignes et on a le contrôle total sur
%le nombre de colonnes de ces matrices, en fonction seuleement du nombre de
%units que l'on veut à chaque couche 
% discuter ici de l"interet de rajouter un "1" à h1 sauf si theta2 a ete
% construit en ce sens

%dans le cas regression il faut adapter la focntion de coût qui sera
%differente et maybe d'autres choses + h2 resu final, on s'arrange pour
%avoir scalaire et pas besoin de fonction fonction_activatione

% du coup dans le cas de la regression à la fin p = h2 tout simplement


% 
% 
% h1 = fonction_activation([ones(m, 1) X] * Theta1');%apostrophe pour transposer la matrice
% 
% 
% 
% h2 = fonction_activation([ones(m, 1) h1] * Theta2');% h2 c'est activ 2 c'est les probas pour 1,2, 3 etc
% 
% % cas ou indice 10 ?? return 0
% 
% [dummy1, p1] = max(h2, [], 2);% histoire du max revoie à  la proba max ici ???
% 
% if(p1) == num_labels
% 
% p1= 0;
% 
% end
% 
% p = p1;
% dimA1 = size([ones(1, 1) X],1)
% dimA2 = size([ones(1, 1) X],2)
% 
% dimB1 = size(Theta{1}',1)
% dimB2 = size(Theta{1}',2)

h{1} = fonction_activation( [ones(1, 1) X] * Theta{1}' );
%h{1} = [ones(1, 1) X] * Theta{1}';


% dimA1 = size([ones(1, 1) X],1)
% dimA2 = size([ones(1, 1) X],2)
% 
% dimB1 = size(Theta{1}',1)
% dimB2 = size(Theta{1}',2)

for i = 2 : nbweightmatrices

% dimA1i = size([ones(1, 1) X],1)
% dimA2i = size([ones(1, 1) X],2)
% i
% 
% dimB1i = size(Theta{i}',1)
% dimB2i = size(Theta{i}',2)   
% i

 h{i} =  fonction_activation( [ones(1, 1) h{i - 1}] * Theta{i}' );
% h{i} = [ones(1, 1) h{i - 1}] * Theta{i}';
    
end

% h1 = [ones(1, 1) X] * Theta1';%apostrophe pour transposer l
% h2 = [ones(1, 1) h1] * Theta2';

p = h{nbweightmatrices};





% dummy recoit les valeurs les plus grandes de chaque ligne
% p recoit le rang (colonne) de chacune de ces valeurs max
% si on suppose qu'il n 'y a qu'une  ligne alors dummy recoit un scalaire =
% la proba max sur la ligne et p recoit le rang de cette proba max = le
% chiffre predit sachant que rang 10 correspond au chiffre 0 ici.
%voir p  def dessus
%M = max(A,[],dim) returns the largest elements along dimension dim. For example, 
%if A is a matrix, then max(A,[],2) is a column vector containing the maximum value of each row.
%hello
% 2 donne max de chaque lignr
% 1 donne max de chaque colonne

% J AI COMPRIS : IL Y A UNE DIFFERENCE ENTRE LA FONCTION DE PREDICTION ET
% LA FONCTION D ENTRAINEMENT : LA FONCTION DE PREDICTION RETOURNE JUSTE LE
% RESULTAT, LE PLUS PROBABLE, FINAL. LA FONCTION D ENTRAINEMENT DANS COST
% NN FUNCTION ELLE RETOURNE TOUTES LES PROBAS ASSOCIES A CHACUN DES DIGITS 
% C EST h2 !!!!!!!!

% =========================================================================


end
