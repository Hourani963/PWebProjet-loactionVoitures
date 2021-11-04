<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Ajout voiture</title>
	<link href="./vue/styleCSS/identInscrire.css" rel="stylesheet">
	<title></title>
</head>
<body>
	<div><?php require('./vue/site/components/menuAdmin.tpl'); ?></div>

    <div class='corpsMarque'>
    
    <?php 
     $q=0;
    foreach($listeVBD as $l){
     $verif= isset($_GET["marque"]) && isset($_GET["modele"]);
     if($verif){
          echo("<form methode='GET' action='index.php?controle=clients&action=touteVoiture&mode=automatique&marque=" . $_GET["marque"] . "&modele="  . $l['modele'] . "'' >");
     }
    
    echo("<div class='wrapper'>");
    if(isset($_GET["marque"])){
         echo($_GET["marque"] . "\n");
         echo($l['modele']);
         echo("qte dispo :" . $qte[0]["count(modele)"]);
         echo("qte désiré : ");
         
         ?>
         <input name='qt' id='qt' type="number" min="0" max="100">

         <?php
         echo("<a href='index.php?controle=clients&action=touteVoiture&mode=automatique&marque=" . $_GET["marque"] . "&modele="  . $l['modele'] . "&qte=" . "'><button type='submit'>Ajouter au panier</button></a>");
    }else{
         echo("<a href='index.php?controle=clients&action=touteVoiture&mode=automatique&marque=" . $l['marque']  . "'>" . $l['marque'] . "</a> ");
    };
    
    echo('</div>');
    if($verif){
         echo("</form>");
     }
    
    }?>
    </div>
    
	
</body>
</html>