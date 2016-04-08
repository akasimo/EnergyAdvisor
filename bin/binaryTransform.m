%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%																			 %%
%%																			 %%
%%				 				ENERGY ADVISOR 								 %%
%%																			 %%
%%		             binary transform for the calendar input				 %%
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




function [ NewX ] = binaryTransform( X )

index_jour = X( : , size(X , 2) );
X = X( : , 1 : size(X , 2) - 1 );

NewX = [];
for i = 1 : size(X , 1)  
    
    binaryDay = zeros( 1 , 7 );
    binaryDay( 1 , index_jour( i ) ) = 1;
    NewX = [ NewX ; [ X( i , : ) , binaryDay ] ];
    
end


end

