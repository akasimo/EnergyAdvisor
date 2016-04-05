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
