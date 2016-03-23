filename = 'input_moy.csv';
j=1;
%col=csvread(filename, ';',1,1);

f = fopen(filename);
%length = ftell(f);

y = textscan(f, '%*s %*s %*f %f', 'Delimiter',',','CollectOutput',1);
%X = textscan(f, '%s %f %f', 'Delimiter',',','CollectOutput',1);
%pour la lire:
y{1}(5) %avec i numéro de ligne

w = y{1}(:,1);

 for k = 1 : 20

        for i=j:j+19;
        
           prep=(prep, y{1}(i));
           
        end
    A=(A;prep);
   j=j+19;
   MLDeleteMatrix("prep");
 end

 