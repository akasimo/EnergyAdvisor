<!DOCTYPE html>

<html>

	<head>

  <script type="text/javascript" src="res/js/jquery.js"></script>
  <script type="text/javascript" src="res/js/waitMe.js"></script>
  <script src="res/js/Pred.js"></script>
  <script src="res/js/bootstrap.min.js"></script>
  <link href="res/css/bootstrap.css" rel="stylesheet">
  <link type="text/css" href="res/css/waitMe.css" rel="stylesheet">
  <title>Energy Advisor</title>
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
    <div class = "page-header">
      <div class="pull-right" id="printButton"><button class="btn btn-default">Imprimer</button></div>
      <h1>Prédictions</h1>
	</div>

  <div class="container" id="predictResults"></div>
  <div class="jumbotron hidden-print" id="france">
    <h4 id="titleMap">Cliquez sur la carte pour faire une nouvelle prédiction</h4>
    <br/>
    <map name="mapfr">
      <area shape=RECT coords="0,0,400,186" onClick="$(this).popOver('north');">
      <area shape=RECT coords="186,0,400,372" onClick="$(this).popOver('south');">
    </map>

    <img src="res/img/map.png" width="400" height="372" alt="" usemap="#mapfr">

  </div>
  </div>
  <div id="predmodal" class="modal fade">

  <!-- Modal content -->
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h1 class="modal-title" id="zone-modal-title"></h1>
        </div>
        <div class="modal-body">
          <h4>Sélectionnez la période de prédiction :</h4>

          <form name="prediction" id="prediction">
            <fieldset class="form-group">
            <label for="exampleSelect1">Jours</label>
            <select class="form-control" id="duration" name="duration">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
            </select>
            <select class="form-control" id="zone" name="zone"></select>
            </fieldset>
          </form>
          <button class="btn btn-primary" id="submitbutton">Prédire</button>
        </div>

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
	</body>


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

</html>