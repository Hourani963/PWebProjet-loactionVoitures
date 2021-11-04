<html>
<head>
	<meta charset="utf-8">
	<title>S'inscrire</title>
	<link href="./vue/styleCSS/vehicule/louerVoiture.css" rel="stylesheet">
	
</head>

<body>
    
        <div class="menu">
            <?php require("vue/site/components/menuAdmin.tpl");?></div>
        
        <div  class = 'corpsChoix'>
        <h1>Vous preferez</h1>
        <div class='contenu'>
        <a class ='gauche' href='index.php?controle=clients&action=touteVoiture&mode=choix'>Choisir mes modeles</a>
        <a class='droite' href='index.php?controle=clients&action=touteVoiture&mode=automatique'>Louer par paquet</a>
        </div>
        </div>

</body>