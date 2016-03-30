#!/bin/bash



		#######################################################
		###													###
		###		EnergyAdvisor DataMining script				###
		###		Comment/Uncomment necessary lines 			###
		###		Distribued "as is" under GPLv3 License		###
		###													###
		#######################################################






##--------------------Data Mining on Linux Systems-----------------------
#
##On Linux systems, uncomment this line (allow the bash to find java path)
#
#
#"$JAVA_HOME"/bin/java -jar ppe_csv_parser_v2.jar 
#
#
##-----------------------------------------------------------------------


##--------------------Data Mining on OS X Systems------------------------
#
##On OS X Systems: java_home is most of the time unset, find it manually
#
#
/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/bin/java -jar ppe_csv_parser_v2.jar;
#
#
##-----------------------------------------------------------------------




echo "DONE DOWNLOADING FILES, EXECUTING ALGORITHM...";




##-----------------Algorithm execution using MATLAB----------------------
#
#
##The path of matlab has to be set correctly on your machine
##On Linux system, you've nothing to do
##On OS X system, you have to modify the path (the file is /etc/paths) and 
##add the matlab 'bin' folder found in the App package
#
#
matlab -nodesktop -nosplash -r "ppe;quit";
#
#
##-----------------------------------------------------------------------



##---------------Algorithm execution using GNU Octave--------------------
#
#
#octave ppe.m
#
#
##-----------------------------------------------------------------------

