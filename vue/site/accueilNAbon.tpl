<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="./vue/styleCSS/accueilNAbon.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title></title>
</head>
<body>
	<div><?php include "vue/site/components/MenuNAbon.tpl" ?></div>
	<section class="body">
		<div class="bouton-photo">
			<button type="button" class="btn btn-primary btn-lg">Voir les voitures</button>
			<button type="button" class="btn btn-secondary btn-lg">Nous Contacter</button>
		</div>
	</section>
</body>
<footer><?php require('vue/site/components/Footer.tpl');?></footer>
</html>
