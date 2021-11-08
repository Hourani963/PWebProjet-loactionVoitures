<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Voir Facture Admin</title>
    <link rel="stylesheet" href="./vue/styleCSS/components/FactureAdmin.css">
</head>
<body>

<div class="ChoixListeFacture" style="background-color: #15172b">
    <div class="vFacture">
        <form action="./index.php?controle=clients&action=FactureAdmin method="POST">
        <div class="input-container">
            <label for="idU" class="placeholder">Afficher Facture  : </label>
            <select id="Modele" name="idU" class="input" required>
                <option value="All" selected="selected">Toutes les factures</option>

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
