<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="./vue/styleCSS/components/Facture.css">
        <script src="https://kit.fontawesome.com/fa3cb2061d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="SeeFacture">
            <?php  require('./vue/site/components/VoirFactureAdmin.tpl'); ?>
            <div id="main">
                <?php
                    if ($Facture != false) {
                        echo ('<table>');
                        echo ('<tr><th> ClIENT </th><th> VEHICULE </th><th> Date Début </th> <th> Date Fin </th> <th> Valeur </th><th> Etat </th> <th> DL </th></tr>');
                        foreach ($Facture as $f) {
                        //var_dump($Voiture); die("Ok");
                        echo "<tr class='facture'>";
                            echo ("<td>" . utf8_encode($f['id_cli']) . "</td>");
                            echo ("<td>" . utf8_encode($f['id_vehi']) . "</td>");
                            echo ("<td>" . utf8_encode($f['dateD']) . "</td>");
                            echo ("<td>" . utf8_encode($f['DateF']) . "</td>");
                            echo ("<td>" . utf8_encode($f['valeur']) . "</td>");
                            echo ("<td>" . utf8_encode($f['EtatR']). "</td>");
                            ?>
                    <td><a href="#" style="text-decoration: none; color: black"><i class="fas fa-file-download"></i></a></td>
                        <?php
                            echo "</tr>\n";
                        }
                        echo ('</table>');
                    }
                    else
                        echo ('pas de contact');
                    ?>
            </div>
            <a href="./index.php?controle=clients&action=admin">
                <button class="btn">Revenir a l'acceuil</button>
            </a>
        </div>
    </body>
</html>