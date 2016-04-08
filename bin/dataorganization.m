%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%																			 %%
%%																			 %%
%%				 				ENERGY ADVISOR 								 %%
%%																			 %%
%%		       	organize data related to forecast stations					 %%
%%																			 %%
%%	COVERED SOFTWARE IS PROVIDED UNDER THE CDDL LICENSE ON AN AS IS BASIS, 	 %%
%%	WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,	 %% 
%%	WITHOUT LIMITATION, WARRANTIES THAT THE COVERED SOFTWARE IS FREE 		 %%
%%	OF DEFECTS, MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE OR 				 %%
%%	NON-INFRINGING. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE 		 %%
%%	OF THE COVERED SOFTWARE IS WITH YOU. SHOULD ANY COVERED SOFTWARE PROVE	 %%
%%	DEFECTIVE IN ANY RESPECT, YOU (NOT THE INITIAL DEVELOPER OR ANY OTHER	 %% 
%%	CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY SERVICING, REPAIR OR		 %%
%%	CORRECTION. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL 		 %%
%%	PART OF THIS LICENSE. NO USE OF ANY COVERED SOFTWARE IS AUTHORIZED		 %%
%%	HEREUNDER EXCEPT UNDER THIS DISCLAIMER.									 %%
%%																			 %%
%%																			 %%
%%																			 %%											
%%																			 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ tempsPerDay ] = dataorganization(previsionnalTempMatrix, zone)

% date - lat - long - temp - index jour
previsionnalTempMatrix = previsionnalTempMatrix( 1 : end , 2 : size( previsionnalTempMatrix , 2 ) - 1 );


% remove date && index
days = size(previsionnalTempMatrix,1)/62;

dates = previsionnalTempMatrix( 1 : days , 1 ) ;
index = previsionnalTempMatrix( 1 : days , size( previsionnalTempMatrix , 2)  ); 






resu1 = [];
if strcmp( zone , '../res/csv/nord.csv') == 1

stations = loader('../res/csv/stations_nord.csv', 1 , 1);

end


if strcmp( zone , '../res/csv/sud.csv' ) == 1

stations = loader('../res/csv/stations_sud.csv', 1 , 1);

end


%1,1 no stations index

trouve = 0;
resu1 = [];
for i = 1 : size( previsionnalTempMatrix , 1 ) 

    for j = 1 : size( stations , 1 )
    
    if previsionnalTempMatrix( i , 1 ) == stations( j , 1 ) && previsionnalTempMatrix( i , 2 ) == stations( j , 2 )
   
    trouve = 1;
        
    end
    
    
    if trouve == 1
    resu1  = [ resu1 ; previsionnalTempMatrix( i , : ) ];
    trouve = 0;
    end
        
    end
    
end

resu1 = resu1( 1 : end , size( resu1 , 2 ) );% remove lat long, keep only temp


resu2 = [];

for k = 1 : size ( stations , 1)

resu2 = [ resu2 , resu1( ( k - 1 )*days + 1 : k*days , 1 ) ];

end


tempsPerDay = [ dates  , resu2 ,  index  ];




