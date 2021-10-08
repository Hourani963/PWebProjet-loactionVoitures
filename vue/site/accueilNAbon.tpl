<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="./vue/styleCSS/accueilNAbon.css" rel="stylesheet">
	<title></title>
</head>
<body>
	<div class="connectOrinscrit">
		<a href="./index.php?controle=clients&action=ident"><button>Se connecter</button></a>
		<a href="./index.php?controle=clients&action=inscrire"><button>S'inscrire</button></a>
	</div>

	<div class="slideshow-container">

		<!-- Full-width images with number and caption text -->
		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img src="./vue/images/voitures/metso.jpg" style="width:100%">
			<div class="text">Caption Text</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img src="./vue/images/voitures/voiture2.jpg" style="width:100%">
			<div class="text">Caption Two</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 3</div>
			<img src="./vue/images/voitures/voiture3.jpg" style="width:100%">
			<div class="text">Caption Three</div>
		</div>

		<!-- Next and previous buttons -->
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
		<br>

		<!-- The dots/circles -->
		<div style="text-align:center">
		<span class="dot" onclick="currentSlide(1)"></span>
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
	</div>
	<script src="./vue/JS/accueil.js"></script>
</body>
</html>
