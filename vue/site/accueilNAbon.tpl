<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
	<link href="./vue/styleCSS/accueilNAbon.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>Accueil</title>
</head>
<body>
	
	<div><?php include "vue/site/components/MenuNAbon.tpl" ?></div>
	<section class="body">
		<div class="bouton-photo">
			<a href="./index.php?controle=vehicule&action=louerVoitureNAbon"><button type="button" class="btn btn-primary btn-lg">Voir les voitures</button></a>
			<a href="./index.php?controle=clients&action=ident"><button type="button" class="btn btn-secondary btn-lg">Nous Contacter</button></a>
		</div>
	</section>
</body>
<footer><?php require('vue/site/components/Footer.tpl');?></footer>
</html>
