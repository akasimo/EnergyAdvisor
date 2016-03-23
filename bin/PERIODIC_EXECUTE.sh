#! /bin/bash

##SUR LES LINUX NORMAUX
#"$JAVA_HOME"/bin/java -jar ppe_csv_parser_v2.jar 

##SUR OS X (merde sur la java_home, conflit de version)
/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/bin/java -jar ppe_csv_parser_v2.jar;


echo "DONE DOWNLOADING FILES, EXECUTING ALGORITHM...";

matlab -nodesktop -nosplash -r "ppe;quit";
