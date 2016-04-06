<!DOCTYPE html>

<html>
<head>
<!-- ATTENTION BUG SUR LA TAILLE DU GRAPHIQUE QUAND ON REDUIT LA FENETRE-->
      <link href="res/css/bootstrap.css" rel="stylesheet">
      <link type="text/css" href="res/css/waitMe.css" rel="stylesheet">
      <script type="text/javascript" src="res/js/Chart.js"></script>
      <script type="text/javascript" src="res/js/jquery.js"></script>
      <script type="text/javascript" src="res/js/waitMe.js"></script>
      <script src="res/js/Historic.js"></script>
      <script src="res/js/bootstrap.min.js"></script>
      <meta charset="UTF-8">

</head>
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
            <li><a href="predictions.php">Prédiction</a></li>
            <li><a href="historic.php">Historique</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          <li><a href="settings.php">Paramètres</a></li>
            <li><a href="team.php">L'équipe</a></li>
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">
      <div class="page-header">
        <h1>Historique de consommation</h1>
      </div>
    </div>

    <div class="container" id="chartContainer">
      <div class="row">
        <div class="col-md-9">
            <div id="myChartContainer">
              <canvas id="myChart"></canvas>
            </div>
        </div>
        <div class="col-md-3">
        <h4>Choisissez la zone de prédiction</h4>
        <form name="prediction" id="prediction">
          <fieldset class="form-group">
            
            <label for="exampleSelect1">Zone</label>
            <select class="form-control" id="zone" name="zone">
              <option>Nord</option>
              <option>Sud</option>
            </select>
            </fieldset>
        </form>

          <button class="btn btn-primary" id="submitbutton">Valider</button>

        </div>
      </div>
    </div>


   

<div class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <p class="navbar-text pull-left">
                2016 - PPE 1535 - ECE Paris
            </p>
            <a href="https://github.com/EnergyAdvisorECE/EnergyAdvisor" class="navbar-btn btn-info btn pull-right">
                GitHub Repo
            </a>
        </div>
    </div>
</body>
</html>