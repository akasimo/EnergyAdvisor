![alt tag](res/img/logo.png?raw=true "Title")

This repository hosts all the sources used in our project.

For the installation, you'll need:

- A working installation of Matlab and environment path correctly set (ie you can call Matlab from terminal)
	--> This works only on Linux and OS X.

- A working installation of GNU Octave

- A working Apache server

- A working JVM (possibly change your java_home path in PERIODIC_EXECUTE.sh)

All you need to do is to put all the files in the /var/www folder (or ~/Sites), adapt the paths in bin/PERIODIC_EXECUTE.sh, bin/OCTAVE_EXECUTE.sh and res/ajax/settings.php in order to recover your matlab/octave executables.

Then you'll need to configure the PERIODIC_EXECUTE.sh file to run periodically (the scheduler CRON can be used).

Finally, the website will be able to run properly on your localhost.


CONTENT

bin
\	matlab algorithm (all the .m files)
\	scripts shell that will be executed
\	data optimization tool (java jar)
csv_parser
\	source code of the java data tool
res
\	ajax
\	\ asynchrone threatment for the web application (data recovery from csv files)
\	css
\	\ bootstrap and other stylesheets
\	csv
\	\ all the csv's of our project (predictions, historics and consumptions)
\	fonts
\	\ fonts needed by our css
\	img
\	\ imgs of the website
\	js
\	\ automatization for chart, historic, predictions and settings set/recovery
\
different webpages


