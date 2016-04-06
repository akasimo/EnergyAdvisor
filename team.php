<!DOCTYPE html>
<html>
    <head>
        <title>
            Energy Advisor
        </title>
        <meta charset="UTF-8"/>
        <script type="text/javascript" src="res/js/jquery.js">
        </script>
        <script src="res/js/bootstrap.min.js">
        </script>
        <link href="res/css/bootstrap.css" rel="stylesheet"/>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">
                            Toggle navigation
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                    </button>
                    <a class="navbar-brand" href="index.php">
                        Energy Advisor
                    </a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="predictions.php">
                                Prédiction
                            </a>
                        </li>
                        <li>
                            <a href="historic.php">
                                Historique
                            </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li>
                            <a href="settings.php">
                                Paramètres
                            </a>
                        </li>

                        <li>
                            <a href="team.php">
                                L'équipe
                            </a>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <div class="page-header">
                <h1>
                    Présentation de l'équipe
                </h1>
            </div>
            <div class="container text-center">
                <div class="row">
                    <div class="col-md-4 col-md-offset-1 v-align">
                        <h4>
                            Guillaume Ligner
                        </h4>
                        <p>
                            Guillaume L. est notre data scientist. Après avoir suivi un MOOC sur l'apprentissage automatique, il a conçu l'algorithme sur Matlab. Ce projet s'inscrit dans son projet professionnel, l'orientant vers les sciences des données.
                        </p>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/ligner.jpg" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/djelidi.jpg" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <h4>
                            Sana Djelidi
                        </h4>
                        <p>
                            Sana est la responsable de ce projet. Elle a supervisé la définition des contraintes inhérentes au milieu du gaz et a imaginé ce sujet.
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <h4>
                            Guillaume Emery
                        </h4>
                        <p>
                            <p>
                                Guillaume E. est le développeur co-chargé avec Côme de gérer la récupération des données et leur nettoyage. Il a également conçu le site web et a géré les liens entre le code Matlab et les différentes autres parties.
                            </p>
                        </p>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/emery.jpg" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                </div>

                
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/bobo.jpg" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <h4>
                            Alexandre Bollini
                        </h4>
                        <p>
                            Alexandre s'est occupé, tout le semestre, de la mise en place du contexte du gaz et a étudié le marché afin de déterminer quelles variables utiliser dans notre algorithme.
                        </p>
                    </div>
                </div>
                

                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <h4>
                            Côme Arvis
                        </h4>
                        <p>
                            Côme est le développeur co-chargé avec Guillaume E. de gérer la récupération des données et leur nettoyage. Ses compétences en Java ont permi d'obtenir un programme fonctionnel fournissant des données expoitables pour l'algorithme.
                        </p>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/arvis.jpg" class="img-circle" width="300" height="300" alt=""/>
                    </div>
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
