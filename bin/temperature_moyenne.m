function [ temperature_moyenne ] = temperature_moyenne( vecteur_ligne_temperatures_toutes_les_stations )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% en vrai differenciation dans le calcul de temp moyenne pour le nord / le
% sud 

temperature_moyenne = 0;
for i = 1 : size( vecteur_ligne_temperatures_toutes_les_stations , 2)

    temperature_moyenne = temperature_moyenne +  vecteur_ligne_temperatures_toutes_les_stations( 1 , i) ;

end

vecteur_ligne_temperatures_toutes_les_stations;

 temperature_moyenne  =  temperature_moyenne / size( vecteur_ligne_temperatures_toutes_les_stations , 2);
 