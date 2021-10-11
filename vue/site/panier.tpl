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
foreach ($panier as $p){
    echo("<div class = 'corps' style='width:260px; padding:5; margin:5'>");
        echo("<div class='img'>");
             echo("<img src=" . $p[0]['path_photo'] . " width='250'>");
        echo("</div>");
            echo("<div class='desc'>");
                echo("<p>Marque : " . $p[0]['marque'] . "</p>");
                echo("<p>Modele : " . $p[0]['modele']. "</p>");
                echo("<p>Caracteristique : " . $p[0]['caract'] . "</p>");
                echo("<label for='qte'>quantité :</label>");
            echo("</div>");
    echo("</div>");
}
?>  
</div>
</body>