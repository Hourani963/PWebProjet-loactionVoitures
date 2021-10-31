<?php
function touteVoiture(){
    
    require('./modele/voitureBD.php');
    $listV = getVoitures();
    require('./vue/site/touteV.tpl');
}

function touteVoitureAdmin(){

    require('./modele/voitureBD.php');
    $listV = getVoitures();
    //var_dump($listV); die("ok");
    require('./vue/site/vehicule/touteVadmin.tpl');
}

function ajoutPanier(){
    require("./modele/voitureBD.php");
    $id_v =isset($_GET['vtr'])?trim($_GET['vtr']):'';
    $voiture = getVoiture($id_v);
    $nbV = $_SESSION['nbV'];
    $_SESSION['panier'][$nbV] = $voiture;
    $_SESSION['nbV']=$_SESSION['nbV']+1;
    $listV = getVoitures();
    //var_dump($_SESSION['panier']);
    require('./vue/site/touteV.tpl');
}

function voirPanier(){
    
    $panier = $_SESSION['panier'];
    //var_dump($panier);
    require('vue/site/panier.tpl');
}

function accueilNAbon(){

    require('./vue/site/accueilNAbon.tpl');

    
}
function bye(){

    setcookie('panier_', json_encode($_SESSION['panier']), time()+3600*24, '/', '', false, false);
    setcookie('nb', json_encode($_SESSION['nbV']), time()+3600*24, '/', '', false, false);

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
    $_SESSION['nbV']=0;
    $_SESSION['panier']=array();
    $pseudo=isset($_POST['pseudo'])?trim($_POST['pseudo']):''; // trim pour enlever les espaces avant et apres
    $mdpNC=isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg="";
    $mdp = md5($mdpNC);
    if($pseudo=='admin' && $mdp== md5('admin')){
        $_SESSION['profil']['pseudo'] = $pseudo;
        $_SESSION['profil']['mdp'] = $mdp;
        
	//cokieeeeeeeeeeeeeeeeeeeeeeeeeeeees
        if(isset($_SESSION['panier'])){
            
            $_SESSION['panier'] = json_decode($_COOKIE['panier_'],1);
            $_SESSION['nb'] = json_decode($_COOKIE['nbV'],1);
    
        }
        header("Location: index.php?controle=clients&action=admin");
        
        
    }else{
        if (count($_POST)==0) require("vue/site/ident.tpl");
    else {
        
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
    $mdpNC=  isset($_POST['mdp'])?($_POST['mdp']):'';
    $email=  isset($_POST['email'])?($_POST['email']):'';
    $msg='';
    $mdp = md5($mdpNC);
    require('./modele/clientsBD.php');
    
    if(count($_POST)== 0) require("./vue/site/inscrire.tpl");
    else{
        if($pseudo=='' || $mdp==''){
            $msg = 'Merci de remplir les champs nom et identifiant';
            require('./vue/site/inscire.tpl');
        }
        else{
            if(verif_bd($pseudo, $mdp , $profil)){
                $msg = "il y a déjà un autilisateur de même nom et identifiant";
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
}


function addFacture(){
    //var_dump($_SESSION['profil']); die("ok");
    //require('/vue/site/accueilAbon.tpl');
    $id = isset($_POST['id_cli'])?($_POST['id_cli']):'';
    $id_vec = isset($_POST['Modele'])?($_POST['Modele']):'';
    $start_Date = isset($_POST['StartDate'])?($_POST['StartDate']):'';
    $end_Date = isset($_POST['EndDate'])?($_POST['EndDate']):'';
    $val = isset($_POST['valeur'])?($_POST['valeur']):'';
    $state = isset($_POST['Etat'])?($_POST['Etat']):'';

    if (count($_POST) == 0) {
        require("./modele/voitureBD.php");
        $Voiture = getVoitures();
        require("./modele/clientsBD.php");
        $Client = getId_cli();
        require('./vue/site/FormAjoutFacture.tpl') ;
    }
    else {
        require("./modele/voitureBD.php");
        insertFacture($id,$id_vec,$start_Date,$end_Date,$val,$state);
        $nexturl = "index.php?controle=clients&action=accueilAbon";
        header("Location:" .$nexturl);
    }
}


function profilClient(){
    $nom = $_SESSION['profil']['nom'];
    $prenom = $_SESSION['profil']['prenom'];
    $mail = $_SESSION['profil']['email'];
    $pseudo = $_SESSION['profil']['pseudo'];
    require('./vue/site/profilUser.tpl');
}
function switchPseudo(){
    if (count($_POST) == 0) {
        $msg = "";
        require('./vue/site/components/ChangePseudo.tpl');
    }
    else {
        require("./modele/clientsBD.php");
        if(verif_Pseudo($_POST['NewPseudo'])){
            sPSeudo($_POST['NewPseudo'],$_SESSION['profil']['id_cli']);
            $_SESSION['profil']['pseudo'] = $_POST['NewPseudo'];
            echo $_SESSION['profil']['pseudo'];
            $nexturl = "index.php?controle=clients&action=accueilAbon";
            header("Location:" .$nexturl);
        } else{
            $msg = "Pseudo déja utilisé";
            require('./vue/site/components/ChangePseudo.tpl');
        }
    }
}
function switchPSW(){
    if (count($_POST) == 0) {
        $msg = "";
        require('./vue/site/components/ChangeMDP.tpl');
    }
    else {
        require("./modele/clientsBD.php");
        //echo md5($_POST['AncienPSW']) . " " . $_SESSION['profil']['mdp'];
        if(md5($_POST['AncienPSW']) == $_SESSION['profil']['mdp']){
            //echo "c passer" ;
            if($_POST['NewPSW'] == $_POST['NewPSW2']){
                //echo "c passer" ; die();
                switchMdp(md5($_POST['NewPSW']), $_SESSION['profil']['id_cli']);
                $nexturl = "index.php?controle=clients&action=accueilAbon";
                header("Location:" .$nexturl);
            } else {
                $msg = "Nouveau mot de passe Incorrect";
                require('./vue/site/components/ChangeMDP.tpl');
                //echo "Nouveau mot de passe Incorrect"; die();
            }
        } else{
            //echo "Ancier mot de passe Incorrect"; die();
            $msg = "Ancien mot de passe Incorrect";
            require('./vue/site/components/ChangeMDP.tpl');
        }

    }

}

function voirFacture(){
    require("./modele/clientsBD.php");
    $id = $_SESSION['profil']['id_cli'];
    $Facture = getFacture($id);
    require("./modele/voitureBD.php");
    $i = 0;
    foreach($Facture as $f){
        $Voiture = getVoiture($f['id_vehi']);
        $Facture[$i]['id_vehi'] = $Voiture[0]['modele'];
        $i++;
    }
    require('./vue/site/components/VoirFacture.tpl');
}
?>