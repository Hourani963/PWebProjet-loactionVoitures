<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>Se Connecter au site</title>
    <link href="./vue/styleCSS/identInscrire.css" rel="stylesheet">
	<title></title>
</head>
<body>
    <div class="form">
    <form action="./index.php?controle=clients&action=ident" method="POST">
        <div class="title">Bienvenue</div>
            <div class="subtitle">Se connecter pour voir les meuilleur voitures!</div>
            <div class="input-container ic1">
                <input name="pseudo" class="input" type="text" placeholder=" " />
                <div class="cut"></div>
                <label for="pseudo" class="placeholder">Pseudo ou Mail</label>
            </div>
            <div class="input-container ic2">
                <input name="mdp" class="input" type="password" placeholder=" " />
                <div class="cut"></div>
                <label for="mdp" class="placeholder">Mot de pass</label>
                
            </div>
            <div id ="m" > <?php echo $msg; ?> </div>
            <div class="input-container ic2">
                
                <div class="cut cut-short"></div>
            </div>
        <a href="./index.php?controle=clients&action=ident"><button type="text" class="submit">submit</button></a>
        
    </form>
    <a href="./index.php?controle=clients&action=inscrire"><button type="text" class="submit">S'inscire</button></a>
    </div>
		
	
</body>
</html>