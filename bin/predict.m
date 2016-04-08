%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%																			 %%
%%																			 %%
%%				 				ENERGY ADVISOR 								 %%
%%																			 %%
%%							prediction function								 %%
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



function p = predict(nn_params, X, hidden_layer_size, input_layer_size, num_labels, nbweightmatrices)


    Theta = cell(1, nbweightmatrices);
    h = cell(1, nbweightmatrices);
   

  Theta{1} = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                  hidden_layer_size, (input_layer_size + 1));%gaffe elem inout output

 incrementation = hidden_layer_size * (input_layer_size + 1);             
              
for i = 2 : nbweightmatrices - 1
    
    Theta{i} = reshape(nn_params( incrementation + 1 : incrementation + hidden_layer_size * (hidden_layer_size + 1)), ...
                  hidden_layer_size, (hidden_layer_size + 1));%gaffe elem inout output
    
    incrementation = incrementation + hidden_layer_size * (hidden_layer_size + 1);
end

Theta{nbweightmatrices} = reshape(nn_params( incrementation + 1 : incrementation + num_labels * (hidden_layer_size + 1)), ...
                  num_labels, (hidden_layer_size + 1));


              
              
              

h{1} = fonction_activation( [ones(1, 1) X] * Theta{1}' );

for i = 2 : nbweightmatrices

 h{i} =  fonction_activation( [ones(1, 1) h{i - 1}] * Theta{i}' );
    
end

p = h{nbweightmatrices};


end
