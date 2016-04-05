histo_temp_stations = loader('temperatures_stations\meteofrance.csv', 0 , 0);
histo_temp_stations( : , 2);


% celluleGlobale = celluleGlobale( 1 : 58*58 , : )


stations_sud = loader('stations\stations_sud.csv', 1 , 0);
temperatures_moyennes_sud = loader('historiques_consommations_zones\sud.csv', 0 , 0);
trouve = 0;
historique_temp_stations_sud = [];
for i = 1 : size( histo_temp_stations , 1 ) 

    for j = 1 : size( stations_sud , 1 )
    
    if histo_temp_stations( i , 1 ) == stations_sud( j , 1 )
   
    trouve = 1;
        
    end
    
    
    if trouve == 1
    historique_temp_stations_sud  = [ historique_temp_stations_sud  ; histo_temp_stations( i , : ) ];
    trouve = 0;
    end
        
    end
    
end


historique_temp_stations_sud( : , 1 ); %% 31 jours parfait

compter_stations = [];
compter_stations = [ compter_stations , stations_sud( : , 1) , zeros( size( stations_sud , 1) , 1 ) ];
compter_stations;

for i = 1 : size ( historique_temp_stations_sud , 1 )

      for j = 1 : size( compter_stations , 1 )
      
      if historique_temp_stations_sud( i , 1 ) == compter_stations( j , 1 )
      
         compter_stations( j , 2 ) = compter_stations( j , 2 ) + 1;
      
      end
      
      end

end

compter_stations
size ( historique_temp_stations_sud , 1 );


historique_temp_stations_sud = sortrows(historique_temp_stations_sud,2);
historique_temp_stations_sud( : , 2)
historique_temp_stations_sud( : , 1)%yes ! dans bon ordre les stations aussi !!

historique_du_sud_temp = historique_temp_stations_sud( : , 3 );
historique_du_sud_dates = historique_temp_stations_sud( : , 2 );
historique_du_sud_stations = historique_temp_stations_sud( : , 1 );
historique_du_sud_stations;



%enlever les stations où pas même nombr de jours chaque fois




matrice_des_temperatures = [];
matrice_des_dates = [];
matrice_des_stations = [];
for i = 1 : size( historique_temp_stations_sud , 1 ) / size( stations_sud , 1 )

   matrice_des_temperatures = [ matrice_des_temperatures ; historique_du_sud_temp( (i - 1) * size( stations_sud , 1 ) + 1 : i * size( stations_sud , 1 ) )' ];
   matrice_des_dates = [ matrice_des_dates ; historique_du_sud_dates( (i - 1) * size( stations_sud , 1 )+ 1 : i * size( stations_sud , 1 ) )' ];
   matrice_des_stations = [ matrice_des_stations ; historique_du_sud_stations( (i - 1) * size( stations_sud , 1 ) + 1 : i * size( stations_sud , 1 ) )' ];

end

matrice_des_temperatures
matrice_des_dates
matrice_des_stations



temperatures_moyennes_sud( 33 , 1 )
matrice_des_dates( : , 2 )

if temperatures_moyennes_sud( 32 , 1 ) == matrice_des_dates( 1 , 1 )

fprintf('reconnait')

end

matrice_temp_moyennes = [];

for j = 1 : size( temperatures_moyennes_sud , 1 )


   for i = 1 : size( matrice_des_dates , 1 )
       
        if temperatures_moyennes_sud( j , 1 ) == matrice_des_dates( i , 1)
      
            matrice_temp_moyennes = [ matrice_temp_moyennes ; [ temperatures_moyennes_sud( j , 1 ) , temperatures_moyennes_sud( j , 3 )  ] ];
    
        end
    
   end
         

end
matrice_des_temperatures;
matrice_temp_moyennes( : , 1);
y = matrice_temp_moyennes( : , 2);
y;
y_conso = temperatures_moyennes_sud( : , 2 );


yresolution = y_conso( 1 : size( stations_sud , 1 ) , : );
matrice_des_temperatures_resolution = matrice_des_temperatures( 1 : size( stations_sud , 1 ) , : );

yevaluation = y_conso( size( stations_sud , 1 ) + 1 : end , : );
matrice_des_temperatures_evaluation = matrice_des_temperatures( size( stations_sud , 1 ) + 1 : end , : );


y
yresolution
yevaluation
matrice_des_temperatures
matrice_des_temperatures_resolution
matrice_des_temperatures_evaluation




somme_des_erreurs = 0;
mat_erreurs = [];
tours = 0;


X = matrice_des_temperatures_resolution;
y = yresolution;

input_layer_size  = size(X,2);
num_labels = size(y,2);

hidden_layer_size = 30;
nbweightmatrices = 5;

taille_set_entrainement = 1;% veut dire je predis un seul element  %taille_set_entrainement = 478;

X = transfo_puissance( X, 1);%0.999 mieux que 1 // puissance 1 marche mieux ? %essayer de faire avec theta generalises

evaluation_X = matrice_des_temperatures_evaluation;

evaluation_y = yevaluation;



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



   


options = optimset('MaxIter', 300);
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

fprintf(' moyenne des erreurs pourcentage :  %f   |   ecart type pourcentage : %f  \n', erreur_moyenne_pourcen, sqrt(variance_pourcen));



if (erreur_moyenne_pourcen > 30 || sqrt(variance_pourcen) > 10 || isnan( erreur_moyenne_pourcen ) == 1 )
    
    X                                                           %SIGMOID 1.2 / 5 MAT POIDS / 30 UNITS ME SEMBLE / 10 JOURS
    y = y'
    evaluation_X 
    evaluation_y 
    prevision_mat
  
end








