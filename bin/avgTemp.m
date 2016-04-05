function [ avgTemp ] = avgTemp( tempLinesPerStations )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% en vrai differenciation dans le calcul de temp moyenne pour le nord / le
% sud 

avgTemp = 0;
for i = 1 : size( tempLinesPerStations , 2)

    avgTemp = avgTemp +  tempLinesPerStations( 1 , i) ;

end

tempLinesPerStations;

avgTemp  =  avgTemp / size( tempLinesPerStations , 2);
 