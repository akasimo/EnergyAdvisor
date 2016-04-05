function W = randInitializeWeights(L_in, L_out)

%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the column row of W handles the "bias" terms
%
% You need to return the following variables correctly 


% les connections sont les units d'activations, paramètres d'entree pour la
% première couche et output pour l'avant derniere couche de units
%sachant qu'ici tout est mis en ligne

% il s'agit d'initialiser les matrices de poids, donc on rentre en dur L_in
% et L_out envyés en pramaètres


%epsilon_init = 0.12;
epsilon_init = sqrt(6)/sqrt(L_in + L_out);
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;

%W = zeros(L_out, 1 + L_in);

end
