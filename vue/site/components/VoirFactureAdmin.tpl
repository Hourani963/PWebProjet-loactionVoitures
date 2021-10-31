<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Voir Facture Admin</title>
        <link rel="stylesheet" href="./vue/styleCSS/components/FactureAdmin.css">
    </head>
    <body>
        <div class="ChoixListeFacture">
            <a href="./index.php?controle=clients&action=FactureAdmin&idU=all"><button>Afficher toute les factures</button></a>
            <form action="./index.php?controle=clients&action=FactureAdmin&idU=" method="POST">
                <div class="input-container">
                    <label for="idU" class="placeholder">Afficher Facture  : </label>
                    <select id="Modele" name="idU" class="input" required>
                        <option value="" selected="selected">Choissisez un client</option>
                        <?php
                         foreach($Client as $c){
                                echo '<option value="'. $c['id_cli'] .'" ' . ' >'. $c['nom'] . " " . $c['prenom'] .'</option>';
                         }
                        ?>
                    </select>
                    <input type="submit" value="Submit" class="submit">
                </div>
            </form>

        </div>
    </body>
</html>