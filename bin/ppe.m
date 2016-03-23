
%% Initialization
clear ; close all; clc

nombre_de_zones = 2;
nombre_de_jours = 5;
fichiers_training = cell(1, nombre_de_zones);

fichiers_training{1} = '../res/csv/nord.csv';
fichiers_training{2} = '../res/csv/sud.csv';

matrice_csv = [];

matrice_de_temperatures_previsionnelles_csv_come = loader('../res/csv/temp.csv', 0 , 0);
dates_previsions = matrice_de_temperatures_previsionnelles_csv_come( 1 : 5 , 1 );  % organiation ou premiere colone c'est les dates

matrice_csv = [ matrice_csv , dates_previsions];


for f = 1 : nombre_de_zones
    
    
[ matrice_des_temps_de_toutes_les_stations_par_jour ] = organiser_matrice_de_temperatures_previsionnelles(matrice_de_temperatures_previsionnelles_csv_come);

matrice_des_temps_de_toutes_les_stations_par_jour = matrice_des_temps_de_toutes_les_stations_par_jour( 1 : end , 2 : end );


matrices_X_a_predire = [];% les indices des temp moyennes doivent correspondre indices des dates

for i = 1 : nombre_de_jours

matrices_X_a_predire  = [ matrices_X_a_predire ; temperature_moyenne( matrice_des_temps_de_toutes_les_stations_par_jour( i , : ) ) ];

end

matrices_X_a_predire = [ matrices_X_a_predire , matrice_de_temperatures_previsionnelles_csv_come( 1 : 5 , 5 ) ];
matrices_X_a_predire = Transformation_binaire( matrices_X_a_predire );



[MatriceSansNan] = loader(fichiers_training{f}, 0 , 0);

ymaster =  MatriceSansNan(:,2);
Xmaster = [];
for i = 3 : size(MatriceSansNan , 2)

    Xmaster = [ Xmaster , MatriceSansNan( : , i ) ];

end

Xmaster = Transformation_binaire( Xmaster );


X = Xmaster;
y = ymaster;


input_layer_size  = size(X,2);
num_labels = size(y,2);

hidden_layer_size = 30;
nbweightmatrices = 5;

   
X = transfo_puissance( X, 1);%0.999 mieux que 1 // puissance 1 marche mieux ? %essayer de faire avec theta generalises

[ Max_X , Max_y ] = Maximum( X , y );

[X, y] = rapporte_a_un(X,y, Max_X, Max_y);
[matrices_X_a_predire , A ] = rapporte_a_un(matrices_X_a_predire,[1 , 2 ; 3 , 4 ], Max_X, 1);



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



options = optimset('MaxIter', 500);
lambda = 0; 
% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda, nbweightmatrices);


[nn_params , cost] = fmincg(costFunction, initial_nn_params, options);%ne fait rien pour l'instant



matrice_des_predictions = [];

for k = 1 : nombre_de_jours
    
matrice_des_predictions = [ matrice_des_predictions ;  Max_y*predict(initial_nn_params ,matrices_X_a_predire(k,:) , hidden_layer_size, input_layer_size, num_labels, nbweightmatrices) ];

end


matrice_csv = [ matrice_csv , matrice_des_predictions ];


end


dlmwrite('../res/csv/pred.csv',matrice_csv,'precision',14);





