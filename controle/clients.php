<?php



function accueilNAbon(){

    require('./vue/site/accueilNAbon.tpl');

    
}

function accueilAbon(){
    require('/vue/site/accueilNAbon.tpl');
}

function ident(){
    
    $pseudo=isset($_POST['pseudo'])?trim($_POST['pseudo']):''; // trim pour enlever les espaces avant et apres
    $email = isset($_POST['email'])?trim($_POST['email']):'';
    $mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg="";

    if (count($_POST)==0) require("vue/site/ident.tpl");
    else {
        
        require ("./modele/clientsBD.php");
        
        if (verif_bd($pseudo, $email, $mdp, $profil)) {
            $_SESSION['profil'] = $profil;
            $nexturl = "index.php?controle=clients&action=accueilAbon";
            header ("Location:" . $nexturl);
        }
        else {
            $msg = "Utilisateur inconnu !";
            require("vue/site/ident.tpl");
        }
    }
    
}
function inscrire(){
    require('./vue/site/inscrire.tpl');
}


?>