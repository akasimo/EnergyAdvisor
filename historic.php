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
            <li><a href="team.php">L'équipe</a></li>
            <li><a href="#contactmodal" data-toggle="modal">Contact</a></li>
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
            <div>
              <canvas id="myChart"></canvas>
            </div>
        </div>
        <div class="col-md-3">
        <h4>Choisissez la zone de prédiction</h4>
        <form name="prediction" id="prediction">
          <fieldset class="form-group">
            <!--<label for="exampleSelect1">Durée (semaines)</label>
            <select class="form-control" id="duration" name="duration">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
            </select>-->
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


    <div id="contactmodal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Contact</h4>
                    </div>
                    <form action="#" method="post">
                        <div class="modal-body">
                            <p>Veuillez entrer votre adresse mail et votre message</p>
                            <p>Mail: <input id="mailaddress" name="adr" type="email" value=""></p>
                            <p>Sujet: <input id="subject" name="sub" type="text" value=""></p>
                            <p>Message: <textarea id="message" name="txt"></textarea></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                            <input type="submit" value="Envoyer" class="btn btn-primary"></button>
                        </div>
                    </form>
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