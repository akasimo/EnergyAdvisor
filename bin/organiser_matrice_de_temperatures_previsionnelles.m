function [ matrice_des_temps_de_toutes_les_stations_par_jour] = organiser_matrice_de_temperatures_previsionnelles(matrice_de_temperatures_previsionnelles_csv_come, zone)


dates = matrice_de_temperatures_previsionnelles_csv_come( 1 : 4 , 1 ) ; % 5 parce que 5 jours
index = matrice_de_temperatures_previsionnelles_csv_come( 1 : 4 , size( matrice_de_temperatures_previsionnelles_csv_come , 2)  ); 


% date - lat - long - temp - index jour
matrice_de_temperatures_previsionnelles_csv_come = matrice_de_temperatures_previsionnelles_csv_come( 1 : end , 2 : size( matrice_de_temperatures_previsionnelles_csv_come , 2 ) - 1 );
% vire colonne date et colonne index garde que lat long et temp



resu1 = [];
if strcmp( zone , '../res/csv/nord.csv') == 1

stations = loader('../res/csv/stations_nord.csv', 1 , 1);

end


if strcmp( zone , '../res/csv/sud.csv' ) == 1

stations = loader('../res/csv/stations_sud.csv', 1 , 1);

end


%1,1 prend pas indice des stations

trouve = 0;
resu1 = [];
for i = 1 : size( matrice_de_temperatures_previsionnelles_csv_come , 1 ) 

    for j = 1 : size( stations , 1 )
    
    if matrice_de_temperatures_previsionnelles_csv_come( i , 1 ) == stations( j , 1 ) && matrice_de_temperatures_previsionnelles_csv_come( i , 2 ) == stations( j , 2 )
   
    trouve = 1;
        
    end
    
    
    if trouve == 1
    resu1  = [ resu1 ; matrice_de_temperatures_previsionnelles_csv_come( i , : ) ];
    trouve = 0;
    end
        
    end
    
end

resu1 = resu1( 1 : end , size( resu1 , 2 ) );% vire lat long garde only temp


resu2 = [];

for k = 1 : size ( stations , 1)

resu2 = [ resu2 , resu1( ( k - 1 )*4 + 1 : k*4 , 1 ) ];

end


matrice_des_temps_de_toutes_les_stations_par_jour = [ dates  , resu2 ,  index  ];




