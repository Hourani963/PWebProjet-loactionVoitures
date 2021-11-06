<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>Se Connecter au site</title>
    <link href="./vue/styleCSS/identInscrire.css" rel="stylesheet">
	<title></title>
</head>
<body>

    <div class="form ident">
        <form action="./index.php?controle=clients&action=ident" method="POST">
           
            <div class="title">Bienvenue</div>
                <div class="subtitle">Se connecter pour voir les meilleures voitures !</div>
                <div class="msg"> <?php echo $msg; ?> </div> 
                <div class="input-container ic1">
                    <input name="pseudo" class="input" type="text" placeholder=" " required/>
                    <div class="cut"></div>
                    <label for="pseudo" class="placeholder">Pseudo ou e-mail</label>
                </div>
                <div class="input-container ic2">
                    <input name="mdp" class="input" type="password" placeholder=" " required/>
                    <div class="cut"></div>
                    <label for="mdp" class="placeholder">Mot de passe</label>
                </div>
                
                <button type="text" class="submit"><a href="./index.php?controle=clients&action=ident">submit</a></button>
            
        </form>
        <span class="returnInscrire">Vous n'êtes pas inscrit ? <a href="./index.php?controle=clients&action=inscrire">Inscrivez-vous</a></span>
        <a href="./index.php?controle=clients&action=accueilNAbon"><button type="text" class="submit accueil">Accueil</button></a>
    </div>
    
		
	
</body>
</html>