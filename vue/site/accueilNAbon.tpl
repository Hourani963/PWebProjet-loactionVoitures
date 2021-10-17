<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="./vue/styleCSS/accueilNAbon.css" rel="stylesheet">
	<title></title>
</head>
<body>
	<div><?php include "vue/site/components/MenuNAbon.tpl" ?></div>

	<div class="slideshow-container">

		<!-- Full-width images with number and caption text -->
		<div class="mySlides fade">
			<img src="vue/images/voitures/car1.jpg" style="width:100%">
			<div class="text c1">Louer une voiture</div>
		</div>

		<div class="mySlides fade">
			<img src="vue/images/voitures/car2.jpg" style="width:100%">
			<div class="text c2">choisissez votre voiture</div>
		</div>

		<div class="mySlides fade">
			<img src="vue/images/voitures/car3.jpg" style="width:100%">
			<div class="text c3">Meuilleur prix</div>
		</div>

		
	</div>
	
	<script src="vue/JS/accueil.js"></script>

</body>
<footer><?php require('vue/site/components/Footer.tpl');?></footer>
</html>
