<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Voir Facture Admin</title>
        <!--<link rel="stylesheet" href="./vue/styleCSS/components/FactureAdmin.css">-->
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
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .ChoixListeFacture {
                border: 0;
                font-size: 15px;
                color: #ffffff;
                /*border: 3px solid red;*/
                background-color: #15172b;
                display: block;
                margin: auto;
                text-align: center;
                justify-content: center;
                align-items: center;
                border-radius: 12px;
                width: 30%;
            }
            .input-container {
                display: flex;
                justify-content: center;
                align-items: center;
                /*border: 3px solid yellow;*/
                margin: auto;
            }
            .input {
                margin: 5px;
                width: 40%;
                border-bottom-left-radius: 12px;
                border-top-left-radius: 12px;
                border: 0;
                box-sizing: border-box;
                color: #eee;
                background-color: #303245;
            }
            .vFacture {
                margin: auto;
                /*border: 3px solid rebeccapurple;*/
            }
            .DateSubmit {
                /*border: 3px solid green;*/
                margin: auto;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            a {
                color: white;
            }
            .submit {
                width: 20%;
                border-radius: 12px;
                border: 0;
                cursor: pointer;
                background-color: #08d;
                box-sizing: border-box;
                color: #eee;
            }
            .submit:hover{
                color: black;
                background-color: green;
            }
            a:hover {
                color: green;
            }
            .mounthDate {
                border-radius: 12px;
                width: 34%;
                border: 0;
                box-sizing: border-box;
                color: #eee;
                background-color: #303245;
            }
        </style>
        <div class="ChoixListeFacture" style="background-color: #15172b">
            <div class="vFacture">
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
                    <div class="DateSubmit">
                        <input type="month" id="start" name="mounthDate" class="mounthDate" min="2021-01" >
                    </div>
                    <input type="submit" value="Submit" class="submit">
                </form>
            </div>
            <div class="out">
                <a href="./index.php?controle=clients&action=admin">
                    Revenir a l'acceuil
                </a>
            </div>

        </div>


    </body>
</html>