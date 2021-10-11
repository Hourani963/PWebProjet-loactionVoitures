<html>
<head>
	<meta charset="utf-8">
	<title>Voir les voitures</title>
	<link href="./vue/styleCSS/card.css" rel="stylesheet">
	<title></title>
</head>
<body>
<?php require("./vue/site/menuAdmin.tpl");?>
<div class ="tout">

<?php

    echo("<div class = 'corpsPanier' style='width:260px; padding:5; margin:5'>");
    echo("<ul>");
    echo("<li>Marque : </li>");
    echo("<li>Modele : </li>");
    echo("<li>Caracteristique : </li>");
    echo("<li>Quantité : </li>");
    echo("</ul>");
    foreach ($panier as $p){
        echo("<ul>");
            echo("<div class='descPanier'>");
                echo("<li>" . $p[0]['marque'] . "</li>");
                echo("<li>" . $p[0]['modele'] . "</li>");
                echo("<li>" . $p[0]['caract'] . "</li>");
                echo("<li>qte</li>");
            echo("</div>");
        echo("</ul>");
    }
    echo("</div>");

?>  
</div>
</body>