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
                            <a href="team.php">
                                L'équipe
                            </a>
                        </li>
                        <li>
                            <a href="#contactmodal" data-toggle="modal">
                                Contact
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
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non velit omnis quis blanditiis recusandae. Ipsum similique id aperiam, beatae iure harum maxime! Sint veritatis laboriosam recusandae illum odio, deleniti neque.
                        </p>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/ligner.png" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/djelidi.png" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <h4>
                            Sana Djelidi
                        </h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non velit omnis quis blanditiis recusandae. Ipsum similique id aperiam, beatae iure harum maxime! Sint veritatis laboriosam recusandae illum odio, deleniti neque.
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <h4>
                            Côme Arvis
                        </h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non velit omnis quis blanditiis recusandae. Ipsum similique id aperiam, beatae iure harum maxime! Sint veritatis laboriosam recusandae illum odio, deleniti neque.
                        </p>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/arvis.png" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/bobo.png" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <h4>
                            Alexandre Bollini
                        </h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non velit omnis quis blanditiis recusandae. Ipsum similique id aperiam, beatae iure harum maxime! Sint veritatis laboriosam recusandae illum odio, deleniti neque.
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
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi ducimus ea mollitia voluptates repellendus magni veritatis, expedita nostrum quam ipsum optio itaque obcaecati, incidunt quisquam fugit iusto, atque porro repudiandae?
                            </p>
                        </p>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <img src="res/img/emery.png" class="img-circle" width="300" height="300" alt=""/>
                    </div>
                </div>
            </div>
        </div>
        <div id="contactmodal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title">
                            Contact
                        </h4>
                    </div>
                    <form action="#" method="post">
                        <div class="modal-body">
                            <p>
                                Veuillez entrer votre adresse mail et votre message
                            </p>
                            <p>
                                Mail:
                                <input id="mailaddress" name="adr" type="email" value=""/>
                            </p>
                            <p>
                                Sujet:
                                <input id="subject" name="sub" type="text" value=""/>
                            </p>
                            <p>
                                Message:
                                <textarea id="message" name="txt">
                                </textarea>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Annuler
                            </button>
                            <input type="submit" value="Envoyer" class="btn btn-primary"/>
                        </button>
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
