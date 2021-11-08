<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Changer votre pseudo</title>
        <link href="./vue/styleCSS/components/SwitchPseudo.css" rel="stylesheet">
    </head>
    <body>
        <form action="./index.php?controle=clients&action=switchPseudo" method="post">
            <div class="title">Changer de pseudo</div>
            <h3 style="color: red; text-align: center;"><?php echo $msg ?></h3>
            <div class="SwitchPseudo">
                <div class="input-container">
                    <input type="text" name="NewPseudo" id="NewPseudo" class="input" placeholder="Nouveau pseudo" required>
                </div>
                <input type="submit" value="Submit" class="submit">
                <a href="./index.php?controle=clients&action=profilClient" class="retourAcceuil">Retour</a>
            </div>
        </form>
    </body>
</html>