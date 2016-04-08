%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%																			 %%
%%																			 %%
%%				 				ENERGY ADVISOR 								 %%
%%																			 %%
%%					display the error of our predictions					 %%
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

function [prevision_mat, variance_pourcen, erreur_moyenne_pourcen, erreur_moyenne_carre ] = error_displaying(X, y, Max_y, nn_params, hidden_layer_size, input_layer_size, num_labels, nbweightmatrices)

nb_echantillons = size(X,1);% lines == nb of samples
erreur_moyenne_pourcen  = 0;
erreur_moyenne_carre = 0;
variance_pourcen = [];
prevision_mat = [];

for i = 1 : nb_echantillons



prevision = predict(nn_params, X(i,:), hidden_layer_size, input_layer_size, num_labels, nbweightmatrices);
prevision_mat = [prevision_mat , prevision ];
prevision = prevision*Max_y;
realite = y(i,1)*Max_y;

erreur_locale_pourcen = (abs(prevision - realite)/realite)*100;

variance_pourcen = [variance_pourcen , erreur_locale_pourcen];
erreur_locale_carre = (prevision - realite)^2;

erreur_moyenne_pourcen = erreur_moyenne_pourcen + (abs(prevision - realite)/realite)*100;
erreur_moyenne_carre = erreur_moyenne_carre + (prevision - realite)^2;

end

erreur_moyenne_pourcen = erreur_moyenne_pourcen / nb_echantillons;
erreur_moyenne_carre = erreur_moyenne_carre / nb_echantillons;

variance_pourcen = var(variance_pourcen);

