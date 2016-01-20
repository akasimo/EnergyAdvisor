<html>

	<head>

	</head>

		<title>Energy Advisor</title>
    	<link href="css/bootstrap.min.css" rel="stylesheet">

	<body>

	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.php">Energy Advisor</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="prediction.php">Prediction</a></li>
            <li><a href="settings.php">Settings</a></li>
            <li><a href="mailto:guillaume.emery@edu.ece.fr">Contact</a></li>
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">
    <div class = "page-header">

   			<h1>Energy Advisor</h1>

	</div>
	</div>

    <div class="container">

    	<div class="jumbotron">

    		<form action= "<?php
matlabExecutor()?>" method="post">
          <p>Enter matlab formula : <input id="formula" name="formula"></p>
          <p><input type="submit" value="Analyse"></p>

        </form>

    	</div>

    </div>

  <?php
if (isset($_SESSION['return'])) {
	echo $_SESSION['return'] . "<br>";
}
?>

	</body>

  <?php

function matlabExecutor() {

	$command = $_POST['formula'];

	$_SESSION['return'] = shell_exec($command);
	//exec('matlab');
	//
}
?>


</html>