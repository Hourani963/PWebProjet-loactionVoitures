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
        $prixP=0;
        echo("<div class = 'corpsPanier' style='width:260px; padding:5'>");
        echo("<ul>");
        echo("<li>Marque : </li>");
        echo("<li>Modele : </li>");
        echo("<li>Caracteristique : </li>");
        echo("<li>Prix : </li>");
        echo("</ul>");
        $vide=true;
        for ($i = 0; $i <= count($panier)-1; $i++){
            if($panier[$i]!=""){
            $vide = false;
            echo("<ul>");
                echo("<div class='descPanier'>");
                $prixP += $panier[$i][0]['val'];
                    echo("<li>" . $panier[$i][0]['marque'] . "</li>");
                    echo("<li>" . $panier[$i][0]['modele'] . "</li>");
                    echo("<li>" . $panier[$i][0]['caract'] . "</li>");
                    echo("<li>" . $panier[$i][0]['val'] . "€". "</li>");
                    echo("<a href='index.php?controle=clients&action=suppVPanier&id=" . $panier[$i][0]['id_vehi'] . "'><button>X </button></a>");
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
        echo("</div>");


      ?>
        <form action="index.php?controle=clients&action=voirPanier" method="POST">
        <label for="meeting">Dete de debut:</label>
        <input type="date" 
        id="dated" 
        name="dated"
        min='<?php echo(date("Y/m/d")); ?>'
        defaultValue='<?php echo(date("Y/m/d")); ?>'>
        <label for="meeting">Dete de fin:</label>
        <input type="date" 
        id="datef" 
        name="datef"
        min='<?php echo(date("Y/m/d")); ?>'
        defaultValue='<?php echo(date("Y/m/d")); ?>'>
       <button type='submit'>verif date</button>
       

      <?php  

        if($vide){     
            echo("<a href ='#'><button ><div class='text'>Valider panier</div></button></a>");  
        }else{
            echo("<a href ='index.php?controle=clients&action=validerPanier'><button ><div class='text'>Valider panier</div></button></a>");
        }
        
    
        
    ?>  
    
 </form>
</div>
</body>