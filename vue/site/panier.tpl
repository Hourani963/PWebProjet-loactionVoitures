<html>
<head>
	<meta charset="utf-8">
	<title>Voir les voitures</title>
	<link href="./vue/styleCSS/card.css" rel="stylesheet">
	<title></title>
</head>
<body>
    <?php require("./vue/site/components/menuAdmin.tpl");?>
    <div class ="tout">

    <?php

        echo("<div class = 'corpsPanier' style='width:260px; padding:5'>");
        echo("<ul>");
        echo("<li>Marque : </li>");
        echo("<li>Modele : </li>");
        echo("<li>Caracteristique : </li>");
        echo("<li>Quantité : </li>");
        echo("<li>Prix : </li>");
        echo("</ul>");
        for ($i = 1; $i <= $_SESSION['nbV']-1; $i++){
                echo("<ul>");
                echo("<div class='descPanier'>");
                    echo("<li>" . $panier[$i][0]['marque'] . "</li>");
                    echo("<li>" . $panier[$i][0]['modele'] . "</li>");
                    echo("<li>" . $panier[$i][0]['caract'] . "</li>");
                    echo("<li>" . $panier[$i][0]['val'] . "</li>");
                    echo("<li>qte</li>");
                    echo("<a href='index.php?controle=clients&action=suppVPanier&id=" . $panier[$i][0]['id_vehi'] . "'><button>X </button></a>");
                echo("</div>");
            echo("</ul>");
        }
        echo("</div>");

    ?>  
    <a href ='index.php?controle=clients&action=validerPanier'><button><div class='text'>Valider panier</div></button></a>

</div>
</body>