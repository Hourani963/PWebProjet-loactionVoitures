<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Votre Profil</title>
      <!--<link href="./vue/styleCSS/Profil.css" rel="stylesheet">-->
  </head>
  <body>
        <style>
            body {
                align-items: center;
                background: -webkit-gradient(linear, left top, left bottom,
                color-stop(0%, rgba(26, 49, 95, 1)),
                color-stop(10%, rgba(26, 49, 95, 1)),
                color-stop(24%, rgba(29, 108, 141, 1)),
                color-stop(37%, rgba(41, 136, 151, 1)),
                color-stop(77%, rgba(39, 45, 100, 1)),
                color-stop(90%, rgba(26, 49, 95, 1)),
                color-stop(100%, rgba(26, 49, 95, 1)));
                display: flex;
                justify-content: center;
                height: 90vh;
            }
            .Info-User{
                text-align: center;
                background-color: #15172b;
                border-radius: 20px;
                box-sizing: border-box;
                height: 550px;
                width: 450px;
            }

            .Title {
                display: inline;
                margin-bottom: 50px;
                color: white;
                border-bottom: 3px solid white;
                position: relative;
                top: 50px;
                font-size: 3rem;
            }
            .txt{
                color: white;
                margin-top: 100px;
            }
            .btn-1 {
                display: inline-flex;
                width: 100%;
                margin-bottom: 3%;
            }
            .btn-2 {
                width: 100%;
                display: inline-flex;
            }
            button a {
                color: #ffffff;
                text-decoration: none;
            }
            .btn {
                border: 0;
                margin: 10px;
                background-color: #08d;
                border-radius: 12px;
                box-sizing: border-box;
                color: #eee;
                cursor: pointer;
                font-size: 18px;
                height: 40px;
                text-align: center;
                width: 80%;
            }

            .btn:hover {
                background-color: rgb(0, 221, 92);
            }
            .retourAcceuil {
                color: white;
            }
        </style>
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
                        <div class="btn-1">
                            <button class="btn"><a href="index.php?controle=clients&action=switchPSW">Changer Mot de passe</a></button>
                            <button class="btn"><a href="index.php?controle=clients&action=switchPseudo"">Changer Pseudo</a></button>
                        </div>
                        <div class="btn-2">
                            <button class="btn"><a href="#">Voir vos facture</a></button>
                            <button class="btn"><a href="index.php?controle=clients&action=bye">Déconnection</a></button>
                        </div>
                        <a href="./index.php?controle=clients&action=accueilAbon" class="retourAcceuil">Retour à l'acceuil</a>
                    </div>
                </div>
            </div>
        </div>
  </body>
</html>