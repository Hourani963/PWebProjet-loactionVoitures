<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Voir Facture Admin</title>
        <link rel="stylesheet" href="./vue/styleCSS/components/FactureAdmin.css">
    </head>
    <body>
        <div class="ChoixListeFacture">
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
                    <input type="submit" value="Submit" class="submit">
                </div>
            </form>

        </div>
    </body>
</html>