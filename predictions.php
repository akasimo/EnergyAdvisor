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
            <li><a href="predictions.php">Prediction</a></li>
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

    		<form enctype="multipart/form-data" action="<?php uploader()?>" method="post">
                            <!-- MAX_FILE_SIZE doit précéder le champ input de type file -->
                            <input type="hidden" name="MAX_FILE_SIZE" value="30000" />
                            <!-- Le nom de l'élément input détermine le nom dans le tableau $_FILES -->
                            Path of Matlab script: <input type="file" name="userfile" id="userfile" /><br>
                            <input type="submit" value="Upload" name="submit" />
                    </form>

    	</div>

    </div>

  <?php
if (isset($_SESSION['return']) && $_SESSION['return']['validate']) {
	putenv('PATH=' . getenv('PATH') . ':/Applications/MATLAB_R2014b.app/bin/matlab:.');
	//echo shell_exec('env');
	exec("matlab -nodisplay -nosplash -nodesktop -r \"script;exit;\"");
}
?>

	</body>

  <?php

function uploader() {
	$uploadfile = "script.m";

	if (isset($_POST['submit'])) {

		if (file_exists($uploadfile) || $_FILES["userfile"]["size"] > 500000) {
			$_SESSION['return']['validate'] = false;
		}

		if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
			$_SESSION['return']['validate'] = true;
			$_SESSION['return']['path'] = $uploadfile;
		} else {
			$_SESSION['return']['validate'] = false;
		}

	}

}

?>


</html>