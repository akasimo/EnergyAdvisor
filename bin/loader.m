function [ MatriceSansNan ] = loader(file, R, C)


celluleGlobale = csvread(file, R , C);% ranks start at index 0  for csvread and send back normalized matrix

MatriceSansNan = [];
reponse = 0;
 for i = 1 : size(celluleGlobale,1)
                           
                               for j = 1 : size(celluleGlobale,2)
                               reponse = reponse + isnan( celluleGlobale(i,j) );
                               end
                                   
                                     if reponse == 0
  
                                       MatriceSansNan = [MatriceSansNan ; celluleGlobale(i, : )];
                                         
                                     end
                                     
                               reponse = 0;      
                                
 end
