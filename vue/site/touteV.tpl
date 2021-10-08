<html>
<head>
	<meta charset="utf-8">
	<title>S'inscrire</title>
	<link href="./vue/styleCSS/card.css" rel="stylesheet">
	<title></title>
</head>
<body>
<?php require("./vue/site/menuAdmin.tpl");?>
<div class ="tout">

<?php
foreach ($listV as $l){
    echo("<div class = 'corps' style='width:300px'>");
        echo("<div class='img'>");
             echo("<img src=" . $l['path_photo'] . " width='250'>");
        echo("</div>");
            echo("<div class='desc'>");
                echo("<p>Marque : " . $l['marque'] . "</p>");
                echo("<p>Modele : " . $l['modele']. "</p>");
                echo("<p>Caracteristique : " . $l['caract'] . "</p>");
                echo("<label for='qte'>quantité :</label>");
                echo("<input type='number' id='qte' name='qte' min='0' max='100' placeholder='0'>");
                echo("<input type='submit' value='Ajout panier'>");
            echo("</div>");
    echo("</div>");
}
?>  
</div>
</body>