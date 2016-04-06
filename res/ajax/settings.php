
<?php

chdir('../../bin');

shell_exec("bash PERIODIC_EXECUTE.sh");

//WARNING : PATH OF OCTAVE WOULD HAVE TO BE CHANGED HERE
shell_exec("/usr/local/Cellar/octave/4.0.0_5/bin/octave OCTAVE_EXECUTE.sh");

echo "<p>Résultats mis à jour.</p>";

?>