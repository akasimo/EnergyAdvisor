%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%																			 %%
%%																			 %%
%%				 ENERGY ADVISOR MAIN SCRIPT / ALGORITHM						 %%
%%				LAUNCHED AS IS, WILL RETURN NEEDED FILES					 %%
%%																			 %%
%%																			 %%
%%			  				 Files are as follow							 %%
%%																			 %%
%%																			 %%
%%																			 %%
%%				   nord/sud.csv 						temp.csv 			 %%
%%		|DATE|CONSUMPTION|TEMP|WEEKINDEX		DATE|LAT|LON|TEMP|WEEKINDEX  %%
%%																			 %%
%%																			 %%
%%																			 %%
%%				 Any data provider respecting this format				 	 %%
%%					  can comply with our algorithm							 %%											
%%																			 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Initialization
clear ; close all; clc

zones = 2;
%days = 4;
trainingFiles = cell(1, zones);

trainingFiles{2} = '../res/csv/nord.csv';
trainingFiles{1} = '../res/csv/sud.csv';

csvMatrix = [];

previsionnalTempsMatrix = loader('../res/csv/temp.csv', 0 , 0);
days = size(previsionnalTempsMatrix,1)/62;
previsionsDates = previsionnalTempsMatrix( 1 : days , 1 );  % first column = dates

csvMatrix = [ csvMatrix , previsionsDates];


for f = 1 : zones
    
    
[ tempsPerDays ] = dataorganization(previsionnalTempsMatrix, trainingFiles{f});

tempsPerDays = tempsPerDays( 1 : end , 2 : size(tempsPerDays , 2) - 1);
%tempsPerDays;

%pause;

xToPredict = [];% forecast index must corresponds to dates

for i = 1 : days

xToPredict  = [ xToPredict ; avgTemp( tempsPerDays( i , : ) ) ];

end

%xToPredict;
%pause;

xToPredict = [ xToPredict , previsionnalTempsMatrix( 1 : days , 5 ) ];
xToPredict = binaryTransform( xToPredict );



[noNullMatrix] = loader(trainingFiles{f}, 0 , 0); %remove potential NaN in our matrix

ymaster =  noNullMatrix(:,2);
Xmaster = [];
for i = 3 : size(noNullMatrix , 2)

    Xmaster = [ Xmaster , noNullMatrix( : , i ) ];

end

Xmaster = binaryTransform( Xmaster );


X = Xmaster;
y = ymaster;


input_layer_size  = size(X,2);
num_labels = size(y,2);

hidden_layer_size = 30;
nbweightmatrices = 5;

   
X = powTransforms( X, 1);

[ Max_X , Max_y ] = Maximum( X , y );

[X, y] = toOne(X,y, Max_X, Max_y);
[xToPredict , A ] = toOne(xToPredict,[1 , 2 ; 3 , 4 ], Max_X, 1);



Theta = cell(1, nbweightmatrices); m = size(X, 1);

initial_Theta = cell(1, nbweightmatrices);



%%%%   Random weight initialization   %%%%%%%%%
initial_Theta{1} = randInitializeWeights(input_layer_size, hidden_layer_size) ;
for i = 2 : nbweightmatrices - 1
    
   initial_Theta{i} = randInitializeWeights(hidden_layer_size, hidden_layer_size) ;

end
initial_Theta{nbweightmatrices} = randInitializeWeights(hidden_layer_size, num_labels);




%%	Unroll the weight matrix
randomInitialize = [initial_Theta{1}(:)];

for i = 2 : nbweightmatrices % the first one is already unrolled

    randomInitialize = [randomInitialize ; initial_Theta{i}(:)];

end



options = optimset('MaxIter', 2);
lambda = 0; 
% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda, nbweightmatrices);


[nn_params , cost] = fmincg(costFunction, randomInitialize, options);



predictionsMatrix = [];

for k = 1 : days
    
predictionsMatrix = [ predictionsMatrix ;  Max_y*predict(randomInitialize ,xToPredict(k,:) , hidden_layer_size, input_layer_size, num_labels, nbweightmatrices) ];

end


csvMatrix = [ csvMatrix , predictionsMatrix ];


end


dlmwrite('../res/csv/pred.csv',csvMatrix,'precision',14);





