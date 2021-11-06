<html>
<head>
	<meta charset="utf-8">
	<title>Voir les voitures</title>
	<link href="./vue/styleCSS/card.css" rel="stylesheet">
	<title></title>
</head>
<body>
    <?php require("./vue/site/components/MenuAbon.tpl");?>
    <div class ="tout">

    <?php
        $prixP=0;
        echo("<div class = 'corpsPanier' style='width:260px; padding:5'>");
        echo("<ul>");
        echo("<li>Marque---- :</li>");
        echo("<li>Modele--- :.</li>");
        echo("<li>Caracteristique ----:         .</li>");
        echo("<li>DATE D---- : </li>");
        echo("<li>DATE F---- : </li>");
        echo("<li>Prix :---- </li>");
        echo("</ul>");
        $vide=true;



            foreach ($panier as $p){
                if($p!=''){
                $r=dateDiff(strtotime($p['dated']), strtotime($p['datef']));


                $p['valeurParJour']=$p['valeurParJour']* $r['day'];
                if($r['day']>30){
                    $p['valeurParJour']=$p['valeurParJour']*0.95;
                }
                $vide = false;
                echo("<ul>");
                    echo("<div class='descPanier'>");
                    $prixP += $p['valeurParJour'];
                        echo("<li>" . $p['marque'] . "</li>");
                        echo("<li>" . $p['modele'] . "</li>");
                        echo("<li>" . $p['caract'] . "</li>");
                        echo("<li>" . $p['dated'] . "</li>");
                        echo("<li>" . $p['datef'] . "</li>");
                        echo("<li>" . $p['valeurParJour'] . "€". "</li>");
                        echo("<a href='index.php?controle=clients&action=suppVPanier&id=" . $p['id_vehi'] . "'><button>Annuler </button></a>");
                    echo("</div>");
                echo("</ul>");
                }
            }



        if($_SESSION["nbV"]>10){
            $prixP=$prixP*0.90;
        }
        if(isset($_POST['dated']) && isset($_POST['datef'])){
            if($res['day']>15){
                for ($x = 0; $x <=$res['day']; $x++) {
                    $prixP=$prixP*0.999;
                }
            }
        }
        echo("<li>Prix  : </li>");
        echo("<li>" . $prixP . '€ par jour' . "</li>");
        echo("</ul>");





            echo("<a href ='index.php?controle=clients&action=validerPanier&price=" . $prixP ."'><button ><div class='text'>Valider panier</div></button></a>");





    ?>

 </form>
</div>
</body>