<?php

//dummy values...
/*$comp = array(
'2015-01-01' => array(18, 20),
'2015-01-02' => array(19, 20),
'2015-01-03' => array(14, 16),
'2015-01-04' => array(12, 17),
'2015-01-05' => array(18, 15),
'2016-01-05' => array(18, 15),
);*/

//echo "Hello World<br>";

$pred = array();
$results = array();
$array = array();

//$duree = $_POST['duree'];
$zone = $_POST['zone'];

if (($file = fopen("../csv/pred.csv", "r")) !== false) {
	while (($data = fgetcsv($file, ",")) !== false) {

		if (strcmp($zone, 'north') == 0) {
			array_push($pred, array($data[0] => $data[1]));
		} else {
			array_push($pred, array($data[0] => $data[2]));
		}

	}
	fclose($file);
}

if (strcmp($zone, 'north') == 0) {
	$x = 'nord';
} else {
	$x = 'sud';
}

if (($file = fopen("../csv/" . $x . ".csv", "r")) !== false) {
	while (($data = fgetcsv($file, ",")) !== false) {
		for ($i = 0; $i < count($pred); $i++) {
			if (strcmp($data[0], key($pred[$i])) == 0) {
				array_push($results, array($data[0] => $data[1]));
			}

		}
	}
	fclose($file);
}
//print_r($pred);
//print_r($results);
//echo $pred[0]);
for ($i = 0; $i < count($pred); $i++) {
	//echo key($pred[$i]);
	$dateTime = strtotime(key($pred[$i]));
	//echo date('Y-m-d', $dateTime);
	$array[date('Y-m-d', $dateTime)] = array($pred[$i][key($pred[$i])], $results[$i][key($pred[$i])]);
	//echo $pred[$i][key($pred[$i])];
	/*array_push($array,
		key($pred[$i]) =>
		array($pred[$i][key($pred[$i])], $results[$i][key($pred[$i])]));*/
}

if (isset($zone)) {
	echo json_encode($array);
	//print_r($array);
	//echo "<br><br><br><br><br><br>";
	//print_r($comp);
}

?>
