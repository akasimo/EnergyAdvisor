%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%																			 %%
%%																			 %%
%%				 				ENERGY ADVISOR 								 %%
%%																			 %%
%%				randomly initialize the weight of the nth layer				 %%
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


function W = randInitializeWeights(L_in, L_out)

%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%

%epsilon_init = 0.12;
epsilon_init = sqrt(6)/sqrt(L_in + L_out);
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;

%W = zeros(L_out, 1 + L_in);

end
