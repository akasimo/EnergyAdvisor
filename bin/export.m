function [ reponse ] = export(reponse)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

 csvwrite('csvPrediction.csv',reponse);
 
end

