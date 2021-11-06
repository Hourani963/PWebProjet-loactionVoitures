<?php
function touteVoiture(){
    require('./modele/voitureBD.php');
    $listV = getVoituresAbonne();
    require('./vue/site/touteV.tpl');
}

function touteVoitureAdmin(){

    require('./modele/voitureBD.php');
    //$listVNonLouer = getVoitures();
    $VoituresLeftJoinFacture = getVoituresLeftJoinFacture();
    //var_dump($listV); die("ok");
    require('./vue/site/vehicule/touteVadmin.tpl');
}



function accueilNAbon(){

    require('./vue/site/accueilNAbon.tpl');

    
}
function bye(){

    setcookie('session', json_encode($_SESSION), time()+3600*24, '/', '', false, false);

    session_destroy();
	$nexturl = "index.php?controle=utilisateur&action=accueilNAbon";
	header("Location:" .$nexturl);
}


function accueilAbon(){
    require('./vue/site/accueilAbon.tpl');
}
function admin(){
    require("./vue/site/accueilAdmin.tpl");
    
}
function ident(){
    $msg = "";
    $_SESSION['nbV']=0;
    $_SESSION['panier']=array();
    //******************************* Récupérer la session */
    if(isset($_SESSION['profil'])){ 
        //var_dump($_SESSION['profil']);
        //die;
        $pseudo=isset($_SESSION['profil']['pseudo'])?($_SESSION['profil']['pseudo']):'';
        $mdp=isset($_SESSION['profil']['mdp'])?($_SESSION['profil']['mdp']):'';
        $msg="";
    }
    else{
        if (count($_POST)==0) require("vue/site/ident.tpl");

        $pseudo=isset($_POST['pseudo'])?trim($_POST['pseudo']):''; // trim pour enlever les espaces avant et apres
        $mdpNC=isset($_POST['mdp'])?trim($_POST['mdp']):'';
        $msg="";
        $mdp = md5($mdpNC);
    }
//*************************************************** Fin récupérer la session */
//********************************Commencer new Session */
    
    if($pseudo=='admin' && $mdp== md5('admin')){
        $_SESSION['profil']['pseudo'] = $pseudo;
        $_SESSION['profil']['mdp'] = $mdp;
        
	//cokieeeeeeeeeeeeeeeeeeeeeeeeeeeees
        if(isset($_SESSION['panier'])){
            
            $_SESSION['panier'] = json_decode($_COOKIE['panier_'],1);
            $_SESSION['nb'] = json_decode($_COOKIE['nbV'],1);
    
        }
        header("Location: index.php?controle=clients&action=admin");
        
    }
    else{
        require ("./modele/clientsBD.php");
        
        if (verif_bd($pseudo, $mdp, $profil)) {
            $_SESSION['profil'] = $profil;
            $nexturl = "index.php?controle=clients&action=accueilAbon";
            //cokieeeeeeeeeeeeeeeeeeeeeeeeeeeees
        if(isset($_SESSION['panier'])){
            
            $_SESSION['panier'] = json_decode($_COOKIE['panier_'],1);
            $_SESSION['nb'] = json_decode($_COOKIE['nbV'],1);
    
        }
            header ("Location:" . $nexturl);
        }
        else if(count($_POST) != 0){
            $msg = "Utilisateur inconnu !";
            require("vue/site/ident.tpl");
        }
    
    }
    
}
function inscrire(){
    $nom=  isset($_POST['nom'])?($_POST['nom']):'';
    $prenom=  isset($_POST['prenom'])?($_POST['prenom']):'';
    $pseudo=  isset($_POST['pseudo'])?($_POST['pseudo']):'';
    $mdpNC=  isset($_POST['mdp'])?($_POST['mdp']):'';
    $email=  isset($_POST['email'])?($_POST['email']):'';
    $msg='';
    $mdp = md5($mdpNC);
    require('./modele/clientsBD.php');
    
    if(count($_POST)== 0) require("./vue/site/inscrire.tpl");
    else{
        if(verif_bdInscrire($pseudo, $email)){
            $msg = "il y a déjà un autilisateur de même pseudo ou mail !";
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







function voirVoitureLouerAdmin(){
    require('./modele/voitureBD.php');
    $listV = getVoitureLouer();
    //var_dump($listV); die("ok");
    require('./vue/site/touteVLouer.tpl');
}

function ClientVoitures(){ 
                            
    require('./modele/clientsBD.php');
    //require('./modele/voitureBD.php');
    //$listVClient = array();
    $idClient = $_SESSION['profil']['id_cli'];
    /*$facturesClient = getFacture($idClient);
    foreach($facturesClient as $f){
        array_push($listVClient, getVoiture($f['id_vehi']));
    }*/
    //var_dump($listVClient);die;
    $listVClient = getClientVoitures($idClient);
    require('./vue/site/client/mesVoitures.tpl');
}

?>