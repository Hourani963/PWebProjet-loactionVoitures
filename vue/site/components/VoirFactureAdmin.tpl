<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Voir Facture Admin</title>
        <link rel="stylesheet" href="./vue/styleCSS/components/FactureAdmin.css">
    </head>
    <body>
        <style>
            body {
                background: -webkit-gradient(linear, left top, left bottom,
                color-stop(0%, rgba(26, 49, 95, 1)),
                color-stop(10%, rgba(26, 49, 95, 1)),
                color-stop(24%, rgba(29, 108, 141, 1)),
                color-stop(37%, rgba(41, 136, 151, 1)),
                color-stop(77%, rgba(39, 45, 100, 1)),
                color-stop(90%, rgba(26, 49, 95, 1)),
                color-stop(100%, rgba(26, 49, 95, 1)));
                height: 90vh;
            }
            .ChoixListeFacture {
                margin-top: 5px;
                width: 40%;
            }
            form {
                font-size: 15px;
                color: #ffffff;
                background-color: #15172b;
                border-radius: 20px;
                box-sizing: border-box;
                width: 100%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
            }
            .submit {
                margin-top: 3%;
                width: 40%;
                height: 30px;
                border: 0;
                background-color: #08d;
                border-radius: 12px;
                box-sizing: border-box;
                color: #eee;
                cursor: pointer;
            }
            .input-container {
                text-align: center;
            }
            .input {
                width: 80%;
                height: 30px;
                background-color: #303245;
                border-radius: 6px;
                border: 0;
                box-sizing: border-box;
                color: #eee;
            }
            a {
                color: white;
            }
        </style>
        <div class="ChoixListeFacture" style="background-color: #15172b">
            <form action="./index.php?controle=clients&action=FactureAdmin&idU=" method="POST">
                <div class="input-container">
                    <label for="idU" class="placeholder">Afficher Facture  : </label>
                    <select id="Modele" name="idU" class="input" required>
                        <option value="All" selected="selected">Toute les factures</option>

                        <?php
                         foreach($Client as $c){
                                echo '<option value="'. $c['id_cli'] .'" ' . ' >'. $c['nom'] . " " . $c['prenom'] .'</option>';
                         }
                        ?>
                    </select>
                </div>
                <input type="submit" value="Submit" class="submit">
            </form>

        </div>
        <a href="./index.php?controle=clients&action=admin">
            Revenir a l'acceuil
        </a>

    </body>
</html>