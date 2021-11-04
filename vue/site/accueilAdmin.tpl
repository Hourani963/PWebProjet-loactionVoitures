<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="./vue/styleCSS/accueilNAbon.css" rel="stylesheet">
	<title>Accueil</title>
	<link href="./vue/styleCSS/components/Menu.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<?php include "./vue/site/components/MenuAdmin.tpl" ?>
<section class="body">
	<div class="bouton-photo">
		<a href="./index.php?controle=clients&action=touteVoitureAdmin"><button type="button" class="btn btn-primary btn-lg">Gérer les voitures</button></a>
		<a href="./index.php?controle=clients&action=FactureAdmin"><button type="button" class="btn btn-secondary btn-lg">Voir les factures</button></a>
	</div>
</section>
<?php require('vue/site/components/Footer.tpl');?>
</body>
</html>
