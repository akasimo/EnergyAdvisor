



% temp
% 
% temp(5)%premier test valide!




% 
% 
% % 
% % X
% % y
% % Theta1
% % Theta2
% 
% nn_params = [Theta1(:) ; Theta2(:)];
% 
% nn_params

% load('test2.mat');
% change = X;
% X = y;
% y = change;
% 
% X;
% y;
% 
% a = sigmoidGradient(1000) * 10000000000
% b =  2^2
% 
% Max_y = y(1,1)
% for i = 1 : size(y,1)
% 
%     if y(i,1) > Max_y
%     Max_y = y(i,1);
%     end
% 
% end
% 
% Max_y 
% 
% 
% Max_X = X(1,1)
% for i = 1 : size(X,1)
% 
%     if X(i,1) > Max_X
%     Max_X = X(i,1);
%     end
% 
% end
% 
% Max_X 
% 
% y = y * (1/Max_y);
% y
% 
% X = X * (1/Max_X);
% X



% 
% A = [1,2,3;4,5,6]
% B = [7,8,9;10,11,12]
% 
% grad = [A(:)]
% 
% grad = [A(:) ; B(:)]
% A
%  C = A.*1;
%  C
%  
%  D = [1]
%   E = [0.3]
%   
%   F = D' - E
% 
% r1 = rand(60,1);
% r1;
% 
% X = [X,r1];
% 
% Max_X = X(1,:);
% 
% 
% X = 2*60 + 61*60 + 61*1;
% 
% A = [1,2;3,4];
% B = [A(:)];
% 
% %test1 = sigmoidGradient(1000)* 1000000000000000000000000000
% %contrainte à respecter pour la fonction d'activation g(z)? doit exister z1
% %tel que g(z1) = 1 ???
% 
% A = [1,2;3,4]
% B = [5,6;7,8]
% C = [A;B]


%  
%  celluleGlobale{1};
%  
%  
% y =  celluleGlobale{1}(:,1);
%  y;
%  X = celluleGlobale{1}(:,2);
%  X;
% Global = [X , y];
% y;
% X;
% 
% Global;
% Global(1,1);
% 
% % teste = 0 / 0;
% % tagueule = 5;
% % 
% % if isnan(teste) == 1
% %     
% %   tagueule = 10;
% %   
% % end
% % 
% % tagueule
% % 
% % isnan(x) == 1%test verifier si NaN
% 
% 
% 
% % 
% 
% 
% 
% MatriceSansNan = [];
% reponse = 0;
%  for i = 1 : size(celluleGlobale{1},1)
%                            
%                                for j = 1 : size(celluleGlobale{1},2)
%                                reponse = reponse + isnan( celluleGlobale{1}(i,j) );
%                                end
%                                    
%                                      if reponse == 0
%   
%                                        MatriceSansNan = [MatriceSansNan ; celluleGlobale{1}(i, : )];
%                                          
%                                      end
%                                      
%                                reponse = 0;      
%                                 
%  end
% 
% MatriceSansNan
% 
% y =  MatriceSansNan(:,1);
% X = MatriceSansNan(:,2);

%  [X , y] = loader('input.csv');
%  
%  X ;
%  y;
%  
% reponse = [11,12,13,14,15,16]
% 
% % csvwrite('csvPrediction.csv',reponse)
% 
% 
% a = [-2 , 2 , -1]
% a = abs(a)
% 

% 
% reponse = [reponse , 17];
% reponse
% reponse = var(reponse)
% 
% sqrt(4)
% 
% D = 3.333
% D = cast(D,int8);
% D
% 
% [Xmaster , ymaster] = loader('vrai_input.csv');

% Xmaster; %marche !!!
% ymaster;

% % M = csvread('vrai_input.csv', 0 , 1);
% % M(:,1)
% jour_binaire = zeros(1,7);
% jour_binaire
% 
% h = 3
% 
% jour_binaire(1,h) = 1;
% jour_binaire;




X = [2.3 , 5 ; 5.6 , 7];
% 
% index_jour = X( : , size(X , 2) )
% X = X( : , 1 : size(X , 2) - 1 )
% 
% NewX = [];
% for i = 1 : size(X , 1)  
%     
%     jour_binaire = zeros( 1 , 7 );
%     jour_binaire( 1 , index_jour( i ) ) = 1;
%     NewX = [ NewX ; [ X( i , : ) , jour_binaire ] ];
%     
% end
% 
% NewX
% [Xmaster , ymaster] = loader('vrai_input.csv');
% X = Transformation_binaire( Xmaster );
% X


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
%fprintf('tagueule1')

   for i = 1 : size( matrice_des_dates , 1 )
       
        if temperatures_moyennes_sud( j , 1 ) == matrice_des_dates( i , 1)% les indices se correspondent pas
          % fprintf('tagueule2')
            matrice_temp_moyennes = [ matrice_temp_moyennes ; [ temperatures_moyennes_sud( j , 1 ) , temperatures_moyennes_sud( j , 3 )  ] ];% colonne 1 ^pir date et 2 pour temp moyenne
    
        end
    
   end
         

end
matrice_des_temperatures;
matrice_temp_moyennes( : , 1);
y = matrice_temp_moyennes( : , 2);
y;


yresolution = y( 1 : size( stations_sud , 1 ) , : );
matrice_des_temperatures_resolution = matrice_des_temperatures( 1 : size( stations_sud , 1 ) , : );

yevaluation = y( size( stations_sud , 1 ) + 1 : end , : );
matrice_des_temperatures_evaluation = matrice_des_temperatures( size( stations_sud , 1 ) + 1 : end , : );


y;
yresolution;
yevaluation;
matrice_des_temperatures;
matrice_des_temperatures_resolution;
matrice_des_temperatures_evaluation;


coeff = inv( matrice_des_temperatures_resolution )*yresolution;


test_calcul_de_temperatures_moyennes = matrice_des_temperatures_evaluation*coeff
yevaluation;

test_calcul_de_temperatures_moyennes = matrice_des_temperatures_resolution*coeff
yresolution;









% 
% A = size(matrice_des_temperatures  , 1);
% B = size(matrice_des_temperatures  , 2);
% matrice_des_temperatures_sans_defaut = [];
% probleme = 0;
% for i = 1 : size(matrice_des_temperatures  , 1)
% 
%     for j = 1 : size(matrice_des_temperatures  , 2)
%         
%         if abs ( matrice_des_temperatures( i , j ) ) > 50
%         
%         probleme = probleme + 1 ;
%             
%         end
%         
%     end
%     
%     if probleme == 0 
%     
%     matrice_des_temperatures_sans_defaut = [ matrice_des_temperatures_sans_defaut ; matrice_des_temperatures( i , : ) ];
%     
%     end
%    
%     probleme = 0;
% 
% end



%  matrice_des_temperatures_sans_defaut;
 
%  inv( matrice_des_temperatures_sans_defaut );
 
%  matrices_des_coefficients
 

% for i = 1 : size ( historique_du_sud_temp , 1 )
%   
%     if  abs( historique_du_sud_temp( i , 1) ) > 150
%     
%      historique_du_sud_temp( i , 1) = historique_du_sud_temp( i , 1) - 273.15
%     
%     end
%     
% end

%COMPARE LES DATES POUR AVOIR 
% 22031992 si peut comparer les dates c'est bon ! on pourra accoler les
% deux matrices en comparant leur dates !


x1 = [1 2 4; 1 1 1; 3 2 2; 0 0 0];
[x1,ps] = removerows(x1,'ind',[4]);

x1;

[MatriceSansNan] = loader('vrai_input.csv', 0 , 1);
ymaster =  MatriceSansNan(:,1);
Xmaster = [];
for i = 2 : size(MatriceSansNan , 2)

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
[ X , ps ] = removerows( X , 'ind' , [ r ] );
[ y , ps ] = removerows( y , 'ind' , [ r ] );

i = i + 1;
end

% 
% X
% y
% evaluation_X
% evaluation_y
% 

A = [ 1 , 2 ,3 ; 4 , 0 , 16 ]
M = max( A( : , 3 ) )

coeff = max( y ) / min( y )

% 1- faire temprature_moyenne.m qui renvoie la temp moyenne à partir temp
% come
%2 - en boucle pour avoir temp moyenne tous les jours toutes les zones 
% 3 - faire deux entrainement, 1 sur nord autre sur sud 
% à la fin de l'entrainement en sortie de chaque boucle ecrire resu dans
% dans .csv

A = [1 , 2 , 3 ; 4 , 5 ,6 ]

csvwrite('test.csv',A);
