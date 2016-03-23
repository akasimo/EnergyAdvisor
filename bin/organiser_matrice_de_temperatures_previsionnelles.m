function [ matrice_des_temps_de_toutes_les_stations_par_jour] = organiser_matrice_de_temperatures_previsionnelles(matrice_de_temperatures_previsionnelles_csv_come)

%traitement blablabla

dates = matrice_de_temperatures_previsionnelles_csv_come( 1 : 5 , 1 ) ; % 5 parce que 5 jours

A = [1 , 2 , 3 ; 4 , 5 , 6 ; 7 , 8 , 9 ; 10 ,  11 , 12 ; 13 , 14 , 15 ];
matrice_des_temps_de_toutes_les_stations_par_jour = [ matrice_de_temperatures_previsionnelles_csv_come( 1 : 5 , 1 )  , A ];