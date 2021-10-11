<?php

function touteVoiture(){
    require('./modele/voitureBD.php');
    $listV = getVoitures();

    if($_SESSION['profil']['pseudo']== 'admin' && $_SESSION['profil']['mdp']== 'admin'){ // afficher les voitures pour le admon
        require('./vue/site/touteV.tpl');
    }
    else if(! isset($_SESSION['profil'])){ // afficher les voitures pour les personnes non connecté
        require('./vue/site/louerVoitureNAbon.tpl');
    }
    else{ // afficher les voitures pour les personnes connecté
        require('./vue/site/louerVoitureAbon.tpl');
    }
    
}

function accueilNAbon(){

    require('./vue/site/accueilNAbon.tpl');

    
}
function bye(){
    session_destroy();
	$nexturl = "index.php?controle=utilisateur&action=accueilNAbon";
	header("Location:" .$nexturl);
}

function accueilAbon(){
    require('./vue/site/accueilAbon.tpl');
}
function admin(){
    require("./vue/site/menuAdmin.tpl");
}
function ident(){
    
    $pseudo=isset($_POST['pseudo'])?trim($_POST['pseudo']):''; // trim pour enlever les espaces avant et apres
    $mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg="";

    if($pseudo=='admin' && $mdp=='admin'){
        $_SESSION['profil']['pseudo'] = $pseudo;
        $_SESSION['profil']['mdp'] = $mdp;
        header("Location: index.php?controle=clients&action=admin");
        
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
    $nom=  isset($_POST['nom'])?($_POST['nom']):'';
    $prenom=  isset($_POST['prenom'])?($_POST['prenom']):'';
    $pseudo=  isset($_POST['pseudo'])?($_POST['pseudo']):'';
    $mdp=  isset($_POST['mdp'])?($_POST['mdp']):'';
    $email=  isset($_POST['email'])?($_POST['email']):'';
    $msg='';

    require('./modele/clientsBD.php');
    
    if(count($_POST)== 0) require("./vue/site/inscrire.tpl");
    else{
        if(unique_bd($pseudo, $email)){
            $msg = "il y a déjà un autilisateur de même pseudo ou email";
            require('./vue/site/inscrire.tpl');
        }
        else{
            $idu = insertClient($nom, $prenom, $pseudo,$mdp , $email);
            $_SESSION['profil']['id_cli'] = $idu;
            $_SESSION['profil']['nom'] = $nom;
            $_SESSION['profil']['prenom'] = $prenom;
            $_SESSION['profil']['pseudo'] = $pseudo;
            $_SESSION['profil']['mdp'] = $mdp;
            $_SESSION['profil']['email'] = $email;
            $nexturl = "index.php?controle=clients&action=accueilAbon";
            header("Location:" .$nexturl);
        }
    }
}


function addFacture(){
    require('/vue/site/accueilAbon.tpl');
}

?>