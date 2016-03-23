
%% Initialization
clear ; close all; clc


[MatriceSansNan] = loader('vrai_input.csv', 0 , 1);
ymaster =  MatriceSansNan(:,1);
Xmaster = [];
for i = 2 : size(MatriceSansNan , 2)

    Xmaster = [ Xmaster , MatriceSansNan( : , i ) ];

end

Xmaster = Transformation_binaire( Xmaster );

input_layer_size  = size(Xmaster,2);
num_labels = size(ymaster,2);

hidden_layer_size = 30;
nbweightmatrices = 5;


tailleXY = 7*2;
somme_des_erreurs = 0;
mat_erreurs = [];
tours = 0;
for j = 1 : size( Xmaster , 1 ) - tailleXY + 1    
% for j = 84 : size( Xmaster , 1 ) - tailleXY + 1    
    
rang = j +  tailleXY - 1; %rang de la prediction qui correspond au y(i) que l'on veut prédire

X = Xmaster( j : j +  tailleXY - 1  , : );%en prend un de plus
y = ymaster( j : j +  tailleXY - 1  , : );%en prend un de plus

taille_set_entrainement = 1;% veut dire je predis un seul element  %taille_set_entrainement = 478;

X = transfo_puissance( X, 1);%0.999 mieux que 1 // puissance 1 marche mieux ? %essayer de faire avec theta generalises

evaluation_X = X( size(X,1) - taille_set_entrainement + 1 : size(X,1) ,:);%en prend un de plus
X = X(1 :  size(X,1) - taille_set_entrainement ,:);%en prend un de plus

evaluation_y = y( size(y,1) - taille_set_entrainement + 1 : size(y,1) ,:);%verifier si ça passe !!
y = y(1 :  size(y,1) - taille_set_entrainement ,:);%en prend un de plus

[ Max_X , Max_y ] = Maximum( X , y );


[X, y] = rapporte_a_un(X,y, Max_X, Max_y);
[evaluation_X, evaluation_y] = rapporte_a_un(evaluation_X,evaluation_y, Max_X, Max_y);

Theta = cell(1, nbweightmatrices); m = size(X, 1);



initial_Theta = cell(1, nbweightmatrices);

%%%%   INITIALISATION ALEATOIRE DES POIDS   %%%%%%%%%
initial_Theta{1} = randInitializeWeights(input_layer_size, hidden_layer_size) ;
for i = 2 : nbweightmatrices - 1 % deja unrollé la premiere probleme je commencais à indice 1 !!!!
    
   initial_Theta{i} = randInitializeWeights(hidden_layer_size, hidden_layer_size) ;% +1 dans le code ??

end
initial_Theta{nbweightmatrices} = randInitializeWeights(hidden_layer_size, num_labels);




%%%%   DEROULE LES MATRICES DE POIDS   %%%%%%%%%
initial_nn_params = [initial_Theta{1}(:)]; %autant d elements foutus dans init

for i = 2 : nbweightmatrices % deja unrollé la premiere

    initial_nn_params = [initial_nn_params ; initial_Theta{i}(:)];

end



   


options = optimset('MaxIter', 200);
lambda = 0; 
% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda, nbweightmatrices);


[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);%ne fait rien pour l'instant



[prevision_mat, variance_pourcen, erreur_moyenne_pourcen, erreur_moyenne_carre] = erreur_pourcentage_et_carre_moyen(evaluation_X , evaluation_y , Max_y, nn_params, hidden_layer_size, input_layer_size, num_labels, nbweightmatrices);
somme_des_erreurs = somme_des_erreurs + erreur_moyenne_pourcen;
mat_erreurs = [ mat_erreurs , erreur_moyenne_pourcen];
tours = tours +1;

fprintf('rang prédiction :  %f  |   erreur prédiction pourcentage : %f   | moyenne des erreurs pourcentage :  %f   |   ecart type pourcentage : %f  \n', rang, erreur_moyenne_pourcen, somme_des_erreurs/tours, sqrt(var(mat_erreurs)));



if (erreur_moyenne_pourcen > 30 || sqrt(variance_pourcen) > 10 || isnan( erreur_moyenne_pourcen ) == 1 )
    
    X                                                           %SIGMOID 1.2 / 5 MAT POIDS / 30 UNITS ME SEMBLE / 10 JOURS
    y = y'
    evaluation_X 
    evaluation_y 
    prevision_mat
  
end

% c est DEUX / 2 semaines qui a donne les meilleurs resultats !!!!


%ce qu'on remarque c'est que sur 10 jours seulement il y a parfois des %%%resultats incoherents et l'algorithme apprend ces incoherences. Du coup
%mieux vaut repartir sur un peu plus de jours.

% dire le rang dis chaque fois et erreur moyenne

% reponse = [y(1,1),y(2,1),y(3,1),y(4,1)]*Max_y;
% 
% reponse = export(reponse);


% puissance probleme ecart type / pareil avec sigmoid 

%interessant iterations 100 --> moyenne 15 et surtout ecart type 12.7 --> %bonne reduction !!! 
% mat de poids : de 3 à 5 --> moyenne 15 à 14.6 et ecart type 11.9 à 11.9 % --> n a rien changé 

% set plus petit (60) -> moy 7.6% et ecart type 6.3% et pas de val wtf, % semble ameliorer les choses

% 17.52 sans printf % 18.52 avec --> pas determinant

% probleme a predit 2.4 de maniere inexplicable chiffre demesure, pas assez % d'entrainement maybe ? % c etait fonction puissance

% test avec 1 seule prediction chaque fois etait concluant
% voir  pourquoi a sorti des X > 0. 


% de s ameliorer

end




