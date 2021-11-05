<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Ajout voiture</title>
	<link href="./vue/styleCSS/identInscrire.css" rel="stylesheet">
	<title>Ajouter une voiture</title>
</head>
<body>
	<script src="vue/JS/ajoutVoiture.js"></script>
	<style>
		body {
			background: -webkit-gradient(linear, left top, left bottom,
			color-stop(0%, rgba(26, 49, 95, 1)),
			color-stop(10%, rgba(26, 49, 95, 1)),
			color-stop(24%, rgba(29, 108, 141, 1)),
			color-stop(37%, rgba(41, 136, 151, 1)),
			color-stop(77%, rgba(39, 45, 100, 1)),
			color-stop(90%, rgba(26, 49, 95, 1)),
			color-stop(100%, rgba(26, 49, 95, 1)));
		}
		.form {
			margin: auto;
		}
		.retourAcceuil {
			color: white;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	</style>

	<form  action="index.php?controle=vehicule&action=ajoutvoiture" method="POST" class="form" enctype="multipart/form-data">
		<div class="title">Ajout voiture</div>
			<div class="subtitle">voiture</div>
				<div class="msg"> 

				</div> 
				<div class="input-container ic1">
					<input name="marque" list="voitures" on class="input" type="text" placeholder=" " id="marque"/>
					<div class="cut"></div>
					<label for="marque" class="placeholder">Marque</label>
							<datalist id="voitures" >
								<?php
								foreach($listeMarque as $l){
									echo ("<option value='" .$l['marque'] . "' ></option>");
								} ?>
							</datalist>

				</div>
				<div class="input-container ic2"> <!-- Problème la liste de modele est la même que la liste des marque-->
					<input name="modele" list='voitures2'on class="input" type="text"  placeholder=" " id="modele"  />
					<div class="cut"></div>
					<label for="modele" class="placeholder">Modele</label>
							<datalist id="voitures2" >
								<?php foreach($listeModele as $l2){
									echo ("<option value='" .$l2['modele'] . "' ></option>");
								} ?>
							</datalist>
					
				</div>
				<div class="input-container ic2">
					<select name="etatL" class="input" type="text" placeholder=" " >
						<option disabled selected value> -- Etat -- </option>
						<option>Disponible</option>
						<option>En_revision</option>
						<div class="cut"></div>
					</select>
				</div>
				<div class="input-container ic3">
					<input name="caract" class="input" type="text" placeholder=" " />
					<div class="cut cut-short"></div>
					<label for="caract" class="placeholder">caracteristique</>
				</div>
				<div class="input-container ic2">
					<input name="img" class="input" type="file" placeholder=" " />
					<div class="cut"></div>
					<label for="file" class="placeholder">Image</label>
				</div>
				<input type="submit" class="submit" value="Valider">
		<a href="./index.php?controle=clients&action=admin" class="retourAcceuil">Retour</a>
	</form>

</body>

</html>
