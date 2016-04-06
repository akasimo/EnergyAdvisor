<!DOCTYPE html>

<html>

	<head>
      <title>Energy Advisor</title>
      <link href="res/css/bootstrap.css" rel="stylesheet">
      <script src="res/js/jquery.js"></script>
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

    </div>

    <div class="container">
      <div class="row jumbotron">
        <div class="col-md-3"><img class="img-responsive center-block" src="res/img/logo.png" id="logo" alt=""></div>
        <div class="col-md-9" id="mainTitle"><h2>Logiciel de prédiction de consommation de gaz</h2></div>
      </div>

      <div class="row">

        <div class="col-md-6 text-justify"><p>EnergyAdvisor est une solution en ligne permettant d'exécuter un algorithme d'apprentissage automatique basé sur un réseau de neurones à 5 couches. Ce réseau de neurones prédit la consommation du gaz en France, en se basant sur les données de GRTgaz</p>
        <p>Nous avons réalisé une étude de marché afin de déterminer les différentes variables à utiliser. Nous avons utilisé les données de température, de consommation ainsi que des variables qualitatives calendaires.</p>
        </div>

        <div class="col-md-6">
          <img class="center-block" src="res/img/machinelearning.png" alt="">
        </div>
      </div>
      <br>
      <div class="row">

        <div class="col-md-6">
          <img class="center-block" src="res/img/energrt.jpg" alt="">
        </div>

        <div class="col-md-6 text-justify"><p>Nous avons rencontré des professionnels du milieu : GRTgaz. Ils proposent un outil similaire s'appuyant sur des modèles statistiques et utilisant des variables d'entrée similaires.</p>
        <p>Nous avons réussi à atteindre le minimum utilisable par leur service. En effet, notre erreur a atteind 7%, ce qui représente leur résultat minimal. Notre projet pourra s'améliorer avec un jeu de données plus complet et plus ciblé par rapport au marché du gaz.</p>
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