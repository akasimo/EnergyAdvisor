![alt tag](res/img/logo.png?raw=true "Title")

# Description

Energy Advisor is a powerful tool based on Machine Learning technologies. It uses a neural networks to predict gas consumption in France.
In order to make this product work, few steps are needed. They will be described later.

This project has been made during our 4th year at ECE Paris. It would be appreciated if it is re-used.

If you want to make it work in other contexts, you can modify the Java downloader sources to get your data from other providers.

# Installation (On Linux / OS X only)

For the installation, you'll need:

1. A working installation of Matlab and environment path correctly set (ie you can call Matlab from terminal)

2. A working installation of GNU Octave

3. A working Apache server

4. A working JVM (possibly change your java_home path in PERIODIC_EXECUTE.sh)

All you need to do is to put all the files in the /var/www folder (or ~/Sites), adapt the paths in bin/PERIODIC_EXECUTE.sh, bin/OCTAVE_EXECUTE.sh and res/ajax/settings.php in order to recover your matlab/octave executables.

Then you'll need to configure the PERIODIC_EXECUTE.sh file to run periodically (the scheduler CRON can be used).

Finally, the website will be able to run properly on your server. You can host it or make it run on your local machine.

# License

COVERED SOFTWARE IS PROVIDED UNDER THE CDDL LICENSE ON AN AS IS BASIS, WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, WITHOUT LIMITATION, WARRANTIES THAT THE COVERED SOFTWARE IS FREE OF DEFECTS, MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE OR NON-INFRINGING. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE COVERED SOFTWARE IS WITH YOU. SHOULD ANY COVERED SOFTWARE PROVE DEFECTIVE IN ANY RESPECT, YOU (NOT THE INITIAL DEVELOPER OR ANY OTHER CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY SERVICING, REPAIR OR CORRECTION. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL PART OF THIS LICENSE. NO USE OF ANY COVERED SOFTWARE IS AUTHORIZED HEREUNDER EXCEPT UNDER THIS DISCLAIMER.	