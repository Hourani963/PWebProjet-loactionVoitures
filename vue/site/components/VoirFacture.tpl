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
        <div class="SeeFacture">
            <h1 class="Title"> Vos Factures</h1>
            <div id="main">

                <?php

                if ($Facture != false) {
                    echo ('<table>');
                echo ('<tr><th> VEHICULE </th><th> Date Début </th> <th> Date Fin </th> <th> Valeur </th><th> Etat </th> <th> DL </th></tr>');
                foreach ($Facture as $f) {

                    //var_dump($f); die("Ok");
                    echo "<tr class='facture'>";
                    echo ("<td>" . utf8_encode($f['id_vehi']) . "</td>");
                    echo ("<td>" . utf8_encode($f['dateD']) . "</td>");
                    echo ("<td>" . utf8_encode($f['DateF']) . "</td>");
                    echo ("<td>" . utf8_encode($f['valeur']) . "</td>");
                    echo ("<td>" . utf8_encode($f['EtatR']). "</td>");
                    //echo ("<td>" . "<i class="fas fa-file-download"></i>" .  "</td>");
                    ?><td><a href="#" style="text-decoration: none; color: black"><i class="fas fa-file-download"></i></a></td>
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