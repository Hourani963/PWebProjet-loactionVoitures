<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>S'inscrire</title>
	<link href="./vue/styleCSS/identInscrire.css" rel="stylesheet">
	<title></title>
</head>
<body>
	<div class="form">
		<form action="./index.php?controle=clients&action=inscrire" method="POST">
			<div class="title">Bienvenue</div>
				<div class="subtitle">Let's create your account!</div>

				<div class="input-container ic1">
				<input name="nom" class="input" type="text" placeholder=" " />
				<div class="cut"></div>
				<label for="nom" class="placeholder">Nom</label>
				</div>

				<div class="input-container ic2">
				<input name="prenom" class="input" type="text" placeholder=" " />
				<div class="cut"></div>
				<label for="prenom" class="placeholder">Prenom</label>
				</div>

				<div class="input-container ic3">
				<input name="pseudo" class="input" type="text" placeholder=" " />
				<div class="cut cut-short"></div>
				<label for="pseudo" class="placeholder">Pseudo</>
				</div>

				<div class="input-container ic4">
				<input name="mdp" class="input" type="text" placeholder=" " />
				<div class="cut"></div>
				<label for="mdp" class="placeholder">Mot de pass</label>
				</div>

				<div class="input-container ic5">
				<input name="email" class="input" type="text" placeholder=" " />
				<div class="cut"></div>
				<label for="email" class="placeholder">Email</label>
				</div>

				<button type="text" class="submit">submit</button>
				
			</div>
			
		</form>
		
	</div>
</body>
</html>