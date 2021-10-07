<?php



function accueilNAbon(){

    require('./vue/site/accueilNAbon.tpl');

    
}

function accueilAbon(){
    require('/vue/site/accueilNAbon.tpl');
}
function admin(){
    require("./vue/site/menuAdmin.tpl");
}
function ident(){
    
    $pseudo=isset($_POST['pseudo'])?trim($_POST['pseudo']):''; // trim pour enlever les espaces avant et apres
    $mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg="";

    if($pseudo=='admin' && $mdp=='admin'){
        header("Location: index.php?controle=clients&action=admin");
        $_SESSION['profil']['nom'] = $psuedo;
        $_SESSION['profil']['mdp'] = $mdp;
    }else{
        if (count($_POST)==0) require("vue/site/ident.tpl");
    else {
        
        require ("./modele/clientsBD.php");
        
        if (verif_bd($pseudo, $mdp, $profil)) {
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
    
}
function inscrire(){
    require('./vue/site/inscrire.tpl');
}


?>