<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Ajout voiture</title>
	<link href="./vue/styleCSS/identInscrire.css" rel="stylesheet">
	<title></title>
</head>
<body>
	<div><?php require('./vue/site/components/menuAdmin.tpl'); ?></div>

	<form  action="index.php?controle=vehicule&action=ajoutvoiture" method="POST" class="form" enctype="multipart/form-data">
		<div class="title">Ajout voiture</div>
			<div class="subtitle">voiture</div>
				<div class="msg"> 
					<p1><?php echo $msgWrong; ?></p1>
					<p2><?php echo $msgDone; ?></p2>
				</div> 
				<div class="input-container ic1">
					<select name="marque" class="input" type="text" placeholder=" " required>
					
					<?php foreach($listeVBD as $l){ ?>
						<option><? php echo $l['marque'] ?></option>
					<div class="cut"></div>
					<?php } ?>
					</select>
				</div>
				<div class="input-container ic2">
					<input name="modele" class="input" type="text" placeholder=" " />
					<div class="cut"></div>
					<label for="modele" class="placeholder">Modele</label>
				</div>
				<div class="input-container ic2">
					<select name="etatL" class="input" type="text" placeholder=" " >
						<option disabled selected value> -- Etat -- </option>
						<option>NEW</option>
						<option>OLD</option>
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
	</form>
</body>
</html>