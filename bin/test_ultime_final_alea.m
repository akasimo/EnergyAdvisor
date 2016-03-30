
%% Initialization
clear ; close all; clc



[MatriceSansNan] = loader('../res/csv/sud.csv', 0 , 0);

ymaster =  MatriceSansNan(:,2);
Xmaster = [];
for i = 3 : size(MatriceSansNan , 2)

    Xmaster = [ Xmaster , MatriceSansNan( : , i ) ];

end

Xmaster = Transformation_binaire( Xmaster );


X = Xmaster;
y = ymaster;
evaluation_X = [];
evaluation_y = [];

taille_en_pourcentage_set_d_evaluation = 0.2;
i = 1;
rng('shuffle');% pour avoir seed different chaque fois
while i <= taille_en_pourcentage_set_d_evaluation * size( Xmaster , 1)    

r = randi([1 size( X , 1 ) ],1,1); %renvoyer des integers aleatoires dans intervalle [1 ; size(x1 ; 1) ] dans une matrice 1 x 1

evaluation_X = [ evaluation_X ; X( r , : ) ];
evaluation_y = [ evaluation_y ; y( r , : ) ];

X = [ X( 1 : r - 1 , : ) ; X( r + 1 : end , : ) ];
y = [ y( 1 : r - 1 , : ) ; y( r + 1 : end , : ) ];

% [ X , ps ] = removerows( X , 'ind' , [ r ] );
% [ y , ps ] = removerows( y , 'ind' , [ r ] );

i = i + 1;
end

input_layer_size  = size(Xmaster,2);
num_labels = size(ymaster,2);

hidden_layer_size = 30;
nbweightmatrices = 5;

somme_des_erreurs = 0;
mat_erreurs = [];
tours = 0;
   
X = transfo_puissance( X, 1);%0.999 mieux que 1 // puissance 1 marche mieux ? %essayer de faire avec theta generalises

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



   


options = optimset('MaxIter', 10);
lambda = 0; 
% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda, nbweightmatrices);


[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);%ne fait rien pour l'instant



[prevision_mat, variance_pourcen, erreur_moyenne_pourcen, erreur_moyenne_carre] = erreur_pourcentage_et_carre_moyen(evaluation_X , evaluation_y , Max_y, nn_params, hidden_layer_size, input_layer_size, num_labels, nbweightmatrices);


fprintf('moyenne des erreurs pourcentage :  %f   |   ecart type moyen pourcentage : %f  \n', erreur_moyenne_pourcen, sqrt(variance_pourcen) );


pause;
% if (erreur_moyenne_pourcen > 30 || sqrt(variance_pourcen) > 10 || isnan( erreur_moyenne_pourcen ) == 1 )
%     
%     X                                                           %SIGMOID 1.2 / 5 MAT POIDS / 30 UNITS ME SEMBLE / 10 JOURS
%     y = y'
%     evaluation_X 
%     evaluation_y 
%     prevision_mat
%   
% end


% x^2 / cost 2.33 -03 / err == 14.34 / ecart type == 11.99
% x^2 / Cost: 2.082761e-03 / moyenne des erreurs pourcentage :  12.458758/% % ecart type moyen pourcentage : 11.201416 // diffcile de descendre en % dessous niveau erreur
% 9.0121*sig / Cost: 2.944503e-03 / moyenne des erreurs pourcentage :  14.550664   |   ecart type moyen pourcentage : 12.254492 
% 9.0121*sig / Cost: Cost: 2.654314e-03 / moyenne des erreurs pourcentage :  13.918589   |   ecart type moyen pourcentage : 11.995657
% 9.0121*sig / Cost: 2.066934e-03 | 400 iters / moyenne des erreurs pourcentage :  13.116779   |   ecart type moyen pourcentage : 10.741641
% x^2 / Cost: 1.978556e-03 / moyenne des erreurs pourcentage :  12.192948   |   ecart type moyen pourcentage : 9.999349  | 500 iters
% x^2 /Cost: 2.077908e-03 / moyenne des erreurs pourcentage :  11.620533   |   ecart type moyen pourcentage : 10.287846  | 600 iters

% x^2 / Cost: 2.028271e-03 / moyenne des erreurs pourcentage :  11.277833  |   ecart type moyen pourcentage : 10.148178 | 400 iters




% faire code pour trouver meilleur demarrage de random initialisation pour
% trouver le min --> est visible au bout de 20 1terations je pense
% voir ensuite si ce demarrage en ce point est utile evey time pour
% configuration 5 mat poids / 30 units 



