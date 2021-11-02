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

            .ChoixListeFacture {
                color: white;
                margin : auto;
                height: 20%;
                width: 80%;
            }
            .submit:hover {
                background-color: #20b302;
            }
            .submit {
                border: 0;
                background-color: #08d;
                border-radius: 12px;
                box-sizing: border-box;
                color: #eee;
                cursor: pointer;
                font-size: 18px;
                height: 50%;
                width: 70%;
            }
            .input-container {
                margin: auto;
                height: 50px;
                position: relative;
                width: 80%;
            }

            .input {
                background-color: #303245;
                border-radius: 12px;
                border: 0;
                box-sizing: border-box;
                color: #eee;
                font-size: 18px;
                height: 50%;
                outline: 0;
                padding: 4px 20px 0;
                width: 100%;
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
    </body>
</html>