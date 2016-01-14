<html>

	<head>

	</head>

		<title>Energy Advisor</title>
    	<link href="css/bootstrap.css" rel="stylesheet">

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
            <li><a href="index.php">Prediction</a></li>
            <li class="active"><a href="setting.php">Settings</a></li>
            <li><a href="mailto:guillaume.emery@edu.ece.fr">Contact</a></li>
          </ul>
          
        </div><!--/.nav-collapse -->
      </div>
    </nav>

		<div class="container">

			<div class = "page-header">
   
   				<h1>Settings</h1>
   
			</div>

			<div class="jumbotron">
			<h2>Define a new data provider</h2>
			<form action="<?php downloader() ?>" method="post">
				<p>Enter URL of data provider : <input id="url" name="url"></p>
				<p>Select date pattern (as written in the URL) : <select name="select">
  					<option value="yyyy-mm-dd" selected>yyyy-mm-dd</option> 
  					<option value="yy-mm-dd" >yy-mm-dd</option>
  					<option value="dd-mm-yyyy">dd-mm-yyyy</option>
				</select></p>
				<p>Enter begin date : <input id="begin" name="begin" value=""></p>
				<p>Enter end date : <input id="end" name="end" value=""></p>
    			<p><input type="submit" value="Analyse"></p>
    		</form>
    		</div>
    	</div>

	</body>

	<?php

		function downloader(){
			set_time_limit(60);

    		$path = 'datas/';
    		$url = "http://www.smart.grtgaz.com/api/v1/fr/search?startDate=".$_POST['begin']."&endDate=".$_POST['end'];
    
    		$filename = $path ."downloaded.xml";
    		$datas = fopen ($url, "r");

    		if($datas){
    			$output = fopen ($filename, "w");
      			if ($output){
      				while(!feof($datas)) fwrite($output, fread($datas, 8192 ), 8192 );
      			}

				fclose($f);
    		}

    		if ($datas && $output) {
     			fclose($datas);
      			fclose($output);
    		}
		}

	?>


</html>