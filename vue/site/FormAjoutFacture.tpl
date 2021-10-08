<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <form action="./index.php?controle=clients&action=addFacture" method="post">
        <label for="Modele">Modèle de voiture : </label>
        <select id="Modele" name="Modele">
            <option value="" selected="selected">Please Choose</option>
            <option value="1">test1</option>
            <option value="2">test2</option>
            <option value="3">test3</option>
            <?php
                 foreach($Voiture as $v){
                        echo '<option value="'. $v['id_v'] .'" ' . ' >'. $v['v_modele'] .'</option>';
                 }
            ?>

        </select>
        <label for="StartDate">Date Départ : </label>
        <input type="date" id="StartDate" name="StartDate"><br><br>
        <label for="EndDate">Date Fin</label>
        <input type="date" id="EndDate" name="EndDate"><br><br>
        <label for="valeur">Valeur : </label>
        <input type="text" id="valeur" name="valeur"><br><br>
        <label for="Etat">Etat : </label>
        <input type="text" id="Etat" name="Etat"><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>