function [ MatriceSansNan ] = loader(file, R, C)


celluleGlobale = csvread(file, R , C);% les rangs et colonnes commencent à index 0  pour csvread et renvoie matrice normale

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
