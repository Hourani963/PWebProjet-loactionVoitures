<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./vue/styleCSS/AjoutFacture.css">
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
    }
</style>
    <form action="./index.php?controle=clients&action=addFacture" method="post">
        <div class="title">Bienvenue</div>
        <div class="input-container">
            <label for="id_cli" class="placeholder">Client : </label>
            <select id="id_cli" name="id_cli" class="input" required>
                <option value="" selected="selected">Choissisez un client</option>
                <?php
                 foreach($Client as $c){
                        echo '<option value="'. $c['id_cli'] .'" ' . ' >'. $c['nom'] . " " . $c['prenom'] .'</option>';
                }
                ?>
            </select>
        </div>
        <div class="input-container">
            <label for="Modele" class="placeholder">Modèle de voiture : </label>
            <select id="Modele" name="Modele" class="input" required>
                <option value="" selected="selected">Choissisez un modèle</option>
                <?php
                 foreach($Voiture as $v){
                        echo '<option value="'. $v['id_vehi'] .'" ' . ' >'. $v['modele'] .'</option>';
                }
                ?>
            </select>
        </div>
        <div class="input-container">
            <label for="StartDate" class="placeholder">Date Départ</label>
            <input type="date" id="StartDate" name="StartDate" class="input" required>
        </div>
        <div class="input-container">
            <label for="EndDate" class="placeholder">Date Fin</label>
            <input type="date" id="EndDate" name="EndDate" class="input" required>
        </div>
        <div class="input-container">
            <label for="valeur" class="placeholder">Valeur</label>
            <input type="text" id="valeur" name="valeur" class="input" placeholder="Valeur de la voiture" required>
        </div>
        <div class="input-container">
            <label for="Etat" class="placeholder">Etat</label>
            <input type="text" id="Etat" name="Etat" class="input" placeholder="Etat de la voiture" required>
        </div>
        <input type="submit" value="Submit" class="submit">

        <a href="./index.php?controle=clients&action=admin" class="retourAcceuil">Retour</a>
    </form>
</body>
</html>