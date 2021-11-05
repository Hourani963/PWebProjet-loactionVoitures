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
                <h1 class="Title">Votre Profil</h1>
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
                        <div class="btn-1">
                            <a href="index.php?controle=clients&action=switchPSW"><button class="btn" id="bt1">Changer Mot de passe</button></a>
                            <a href="index.php?controle=clients&action=switchPseudo"> <button class="btn" id="bt1">Changer Pseudo</button></a>
                        </div>
                        <div class="btn-2">
                            <a href="index.php?controle=clients&action=voirFacture"><button class="btn">Voir vos facture</button></a>
                            <a href="index.php?controle=clients&action=bye"><button class="btn">Déconnexion</button></a>
                        </div>
                        <a href="./index.php?controle=clients&action=accueilAbon" class="retourAcceuil">Retour à l'acceuil</a>
                    </div>
                </div>
            </div>
        </div>
  </body>
</html>