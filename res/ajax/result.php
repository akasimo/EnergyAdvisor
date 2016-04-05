<?php
sleep(2);

if (isset($_POST['duree'])) {
	echo "<table class=\"table table-striped table-bordered\">";
	echo "<caption>Résultats pour la zone <i>" . $_POST['zone'] . "</i> sur une durée de " . $_POST['duree'] . " jours</caption>";
	echo "<thead><tr><th>Date</th><th>Zone</th><th>Consommation</th></tr></thead>";

	//$date = new DateTime();
	$i = $_POST['duree'];
	$k = 0;


	if (($file = fopen("../csv/pred.csv", "r")) !== FALSE) {
		while (($data = fgetcsv($file, ",")) !== FALSE) {
			//for ($c = 0; $c < $_POST['duree']; $c++) {
			//$date->modify('+1 day');
			//$date = date_create_from_format('yyyyMMdd', $data[0]);

			if (strcmp($_POST['zone'], 'north') == 0) {
				echo "<tr><td>" . date_create_from_format('Ymd', $data[0])->format('d-m-Y') . "</td><td>Nord</td><td>" . $data[1] . " kWh, 25°C</td></tr>";
			} else {
				echo "<tr><td>" . date_create_from_format('Ymd', $data[0])->format('d-m-Y') . "</td><td>Sud</td><td>" . $data[2] . " kWh, 25°C</td></tr>";
			}

			$k++;
			if ($k == $i) {
				goto end;
			}

		}
		end:
		echo "</table>";
		fclose($file);
		//fclose($handle);
	}
}

?>