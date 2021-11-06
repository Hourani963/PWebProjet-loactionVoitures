
  <link href="./vue/styleCSS/components/Menu.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <body><header>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <a class="navbar-brand" href="#">Loueur&Co</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="./index.php?controle=clients&action=admin">Accueil <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Voiture
                      </a>
                      <div class="dropdown-menu dropdown-menu-right dropdown-cyan" aria-labelledby="navbarDropdownMenuLink-4">
                      <a class="dropdown-item" href="./index.php?controle=clients&action=touteVoitureAdmin">Voir toutes les voitures</a>
                          <a class="dropdown-item" href="./index.php?controle=clients&action=touteVoitureDispoAdmin">Voir les voiture DISPONIBLES</a>
                          <a class="dropdown-item" href="./index.php?controle=clients&action=voirVoitureLouerAdmin">Voir les voiture loué</a>
                          <a class="dropdown-item" href="./index.php?controle=vehicule&action=ajoutvoiture">Ajouter une voiture</a>
                      </div>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Facture
                      </a>
                      <div class="dropdown-menu dropdown-menu-right dropdown-cyan" aria-labelledby="navbarDropdownMenuLink-4">
                          <a class="dropdown-item" href="./index.php?controle=clients&action=FactureAdmin">Voir les Facture</a>
                          <a class="dropdown-item" href="./index.php?controle=clients&action=addFacture">Ajouter une facture</a>
                      </div>
                  </li>
              </ul>
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                      <a class="nav-link" href="./index.php?controle=clients&action=bye">Déconnecxion</a>
                  </li>
              </ul>
          </div>
      </nav>
  </header>
  </body>