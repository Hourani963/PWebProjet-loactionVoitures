<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Votre Profil</title>
      <link href="./vue/styleCSS/Profil.css" rel="stylesheet">
  </head>
  <body>
        <header>

        </header>
        <div class="Info-User">
            <div class="content">
                <h1 class="Title"> Votre Profil</h1>
                <div class="txt">
                    <div class="User--nom">
                        <h1>Nom : <?php echo $nom ?></h1>
                    </div>
                    <div class="User--prenom">
                        <h1>prenom : <?php echo $prenom ?></h1>
                    </div>
                    <div class="User--pseudo">
                        <h1>Pseudo : <?php echo $pseudo ?></h1>
                    </div>
                    <div class="User--mail">
                        <h1>Mail : <?php echo $mail ?></h1>
                    </div>
                    <div class="buttpn">
                        <button><a href="index.php?controle=clients&action=switchPSW">Changer Mot de passe</a></button>
                        <button><a href="index.php?controle=clients&action=switchPseudo"">Changer Pseudo</a></button>
                        <button><a href="#">Voir vos facture</a></button>
                        <button><a href="index.php?controle=clients&action=bye">Déconnection</a></button>
                    </div>
                </div>
            </div>
        </div>
  </body>
</html>