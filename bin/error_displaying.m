function [prevision_mat, variance_pourcen, erreur_moyenne_pourcen, erreur_moyenne_carre ] = error_displaying(X, y, Max_y, nn_params, hidden_layer_size, input_layer_size, num_labels, nbweightmatrices)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

nb_echantillons = size(X,1);% nb de lignes correspond au nb d echantillons
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

