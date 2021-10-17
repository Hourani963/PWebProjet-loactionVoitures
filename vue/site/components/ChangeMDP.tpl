<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Changer Votre Mot de Passe</title>
        <link href="./vue/styleCSS/components/SwitchPSW.css" rel="stylesheet">
    </head>
    <body>
    <style>

    </style>
        <form action="./index.php?controle=clients&action=switchPSW" method="post">
            <div class="title">Changer de mot de passe</div>
            <h3 style="color: red; text-align: center;"><?php echo $msg ?></h3>
            <div class="SwitchPassword">
                <div class="input-container">
                    <input type="password" class="input" name="AncienPSW" id="AncienPSW" class="myInput" placeholder="Ancien Mot de Passe" required>
                </div>
                <div class="input-container">
                    <input type="password" class="input" name="NewPSW" id="NewPSW" placeholder="Nouveau Mot de Passe" required>
                </div>
                <div class="input-container">
                    <input type="password" class="input" name="NewPSW2" id="NewPSW2" placeholder="Nouveau Mot de Passe" required>
                </div>
                <div class="input-container" id="div-switch">
                    <input class="switch" type="checkbox" onclick="myFunction()">
                    <label for="s2" id="lblSwitch">Afficher les mots de Passe</label>
                </div>
                <input type="submit" value="Changer le mot de passe" class="submit">
                <a href="./index.php?controle=clients&action=profilClient" class="retourAcceuil">Retour</a>
            </div>
        </form>
        <script>
            function myFunction() {
                var x = document.getElementById("AncienPSW");
                var y = document.getElementById("NewPSW");
                var z = document.getElementById("NewPSW2");
                if (x.type === "password" && z.type === "password" && y.type === "password") {
                    x.type = "text";
                    y.type = "text";
                    z.type = "text";
                } else {
                    x.type = "password";
                    y.type = "password";
                    z.type = "password";
                }
            }
        </script>
    </body>
</html>