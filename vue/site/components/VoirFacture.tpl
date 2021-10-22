<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>TP contacts - mvc - liste des informations sur les contacts de l'utilisateur connecté.</title>
        <link href="./vue/styleCSS/Facture.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/fa3cb2061d.js" crossorigin="anonymous"></script>
        <!-- <script src="script.js"></script> -->
    </head>
    <body>
        <style>
            body {
                align-items: center;
                text-align: center;
                background: -webkit-gradient(linear, left top, left bottom,
                color-stop(0%, rgba(26, 49, 95, 1)),
                color-stop(10%, rgba(26, 49, 95, 1)),
                color-stop(24%, rgba(29, 108, 141, 1)),
                color-stop(37%, rgba(41, 136, 151, 1)),
                color-stop(77%, rgba(39, 45, 100, 1)),
                color-stop(90%, rgba(26, 49, 95, 1)),
                color-stop(100%, rgba(26, 49, 95, 1)));
                display: block;
                justify-content: center;
                height: 90vh;
            }
            .SeeFacture {
                background-color: #15172b;
                border-radius: 20px;
                box-sizing: border-box;
                height: 430px;
                width: 900px;
                margin: auto;
            }
            table {
                font-style: normal;
                font-weight: normal;
                margin: auto;
                background-color: #aaa;
                width: 80%;
                position: relative;
                top: 10%;
                border-radius: 6px;
                -webkit-border-radius: 6px;
                -moz-border-radius: 6px;
            }
            tr.contact:nth-child(odd) {
                background-color: #f2f2f2;
            }
            tr.contact:nth-child(even) {
                background-color: #ddd;
            }
            td {
                font-size: 14px;
                line-height: 20px;
                width : 30em;
                height: 3em;
                border-bottom: 1px solid #fff;
                border-top: 1px solid #fff;
            }
            td:hover {background-color: #fff;}
            th {
                font-size: 17px;
                line-height: 20px;
                width : 5em;
                text-align: center;
                text-shadow: white 1px 1px 1px;
            }
            .Title {
                display: inline-block;
                margin-bottom: 50px;
                color: white;
                border-bottom: 3px solid white;
                position: relative;
                top: 20px;
                bottom: 100px;
                font-size: 3rem;
            }
            #main{
                display: inline-block;
                margin-top: 5%;
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
                width: 40%;
            }
            .btn:hover {
                background-color: rgb(0, 221, 92);
            }

        </style>
        <div class="SeeFacture">
            <h1 class="Title"> Vos Factures</h1>
            <div id="main">

                <?php
                require("./modele/voitureBD.php");
                if ($Facture != false) {
                    echo ('<table>');
                echo ('<tr><th> VEHICULE </th><th> Date Début </th> <th> Date Fin </th> <th> Valeur </th><th> Etat </th> <th> DL </th></tr>');
                foreach ($Facture as $f) {

                    $Voiture = getVoiture($f['id_vehi']);
                    //var_dump($Voiture); die("Ok");
                    echo "<tr class='facture'>";
                    echo ("<td>" . utf8_encode($Voiture[0]['modele']) . "</td>");
                    echo ("<td>" . utf8_encode($f['dateD']) . "</td>");
                    echo ("<td>" . utf8_encode($f['DateF']) . "</td>");
                    echo ("<td>" . utf8_encode($f['valeur']) . "</td>");
                    echo ("<td>" . utf8_encode($f['EtatR']). "</td>");
                    //echo ("<td>" . "<i class="fas fa-file-download"></i>" .  "</td>");
                    ?><td><a href="#" style="text-decoration-color: black"><i class="fas fa-file-download"></i></a></td>
                    <?php
                    echo "</tr>\n";
                }
                echo ('</table>');
                }
                else
                echo ('pas de contact');
                ?>
            </div>
            <a href='./index.php?controle=clients&action=profilClient'>
                <button class="btn">Revenir a l'acceuil</button>
            </a>
        </div>

    </body>
</html>