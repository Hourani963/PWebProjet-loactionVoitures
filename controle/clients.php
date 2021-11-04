<?php
function touteVoiture(){
    require('./modele/voitureBD.php');
    
    if(isset($_GET['mode'])){
        $mode = $_GET['mode'];
        if($mode == 'choix'){
            $listV = getVoitures();
            require('./vue/site/touteV.tpl');
        }else if($mode == 'automatique'){
            $listeVBD = getAllMarqueDispo();
            if(isset($_GET["marque"])){
                $m = $_GET["marque"];
                $qte = CountAllModelDispo($m);
                $listeVBD=getAllModelDispo($m);
                
            }
            require('./vue/site/touteVAutomatique.tpl');
        }
    }else{
        require('./vue/site/choix.tpl');
    }
    
    
}

function peutAjouter($voiture){
    $bool = true;
    if(isset($_SESSION['panier'])){
        foreach($_SESSION['panier'] as $p){
            if($p == $voiture){
                $bool=false;
            }
        }
    }
    return $bool;
}
function ajoutVo($voiture){
    if(peutAjouter($voiture)){
        if(isset($_SESSION['nbV'])){
            $nbV = $_SESSION['nbV'];
        }else{
            $nbV=0;
        }
        $_SESSION['panier'][$nbV] = $voiture;
        if(isset($_SESSION['nbV'])){
            $_SESSION['nbV']=$_SESSION['nbV']+1;
        }else{
            $_SESSION['nbV']=$nbV+1;
        }
    }

}
function suppVo($i){
        if(isset($_SESSION['nbV'])){
            $nbV = $_SESSION['nbV']-1;
        }else{
            $nbV=0;
        }

        $_SESSION['panier'][$i] = '';

        if(isset($_SESSION['nbV'])){
            $_SESSION['nbV']=$_SESSION['nbV']-1;
        }else{
            $_SESSION['nbV']=$nbV-1;
        }

}

function ajoutPanier(){
    require("./modele/voitureBD.php");
    if(isset($_GET['vtr'])){
        $id_v = $_GET['vtr'];
        $vo = getVoiture($id_v);
        ajoutVo($vo);
    }
    $listV = getVoitures();
    require('./vue/site/touteV.tpl');
}









function suppVPanier(){
    $desupp = false;
    if(isset($_GET['id'])){
        $id_v =$_GET['id'];
        for ($i = 0; $i <= count($_SESSION['panier'])-1; $i++) {
            if(isset($_SESSION['panier'][$i][0]['id_vehi'])){
                if($_SESSION['panier'][$i][0]['id_vehi']==$id_v){
                    if($desupp==false){
                        suppVo($i); 
                        $desupp=true;
                    }                 
            } 
            }
            
        }
    }
    
    $panier = $_SESSION['panier'];
    require('vue/site/panier.tpl');
}

function dateDiff($date1, $date2){
    $diff = abs($date1 - $date2); // abs pour avoir la valeur absolute, ainsi éviter d'avoir une différence négative
    $retour = array();
 
    $tmp = $diff;
    $retour['second'] = $tmp % 60;
 
    $tmp = floor( ($tmp - $retour['second']) /60 );
    $retour['minute'] = $tmp % 60;
 
    $tmp = floor( ($tmp - $retour['minute'])/60 );
    $retour['hour'] = $tmp % 24;
 
    $tmp = floor( ($tmp - $retour['hour'])  /24 );
    $retour['day'] = $tmp;
 
    return $retour;
}
function voirPanier(){
    $dated=0;
    $datef=0;
    $res=array();
    if(isset($_POST['dated']) && isset($_POST['datef'])){
        $dated=$_POST['dated'];
        $datef=$_POST['datef'];
        $date1=strtotime($dated);
        $date2=strtotime($datef);
        $res=dateDiff($date1, $date2);
    }
    if(isset($_SESSION['panier'])){
        $panier = $_SESSION['panier'];
        
        require("vue/site/panier.tpl");
    }else{
        require("vue/site/panierVide.tpl");
    }
    
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
function validerPanier(){
    require('./vue/site/validerPanier.tpl');
}
function panierValidé(){
    require('./vue/site/vue/panierValidé.tpl');
}
function gestion(){
    require('./modele/clientsBD.php');
    $res = getDevisAV();
    require('./vue/site/gestion.tpl');
}
function accueilAbon(){
    require('./vue/site/accueilAbon.tpl');
}
function admin(){
    require("./vue/site/accueilAdmin.tpl");
    
}
function ident(){
    $pseudo=isset($_POST['pseudo'])?trim($_POST['pseudo']):''; // trim pour enlever les espaces avant et apres
    $mdpNC=isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg="";
    $mdp = md5($mdpNC);
    if($pseudo=='admin' && $mdp== md5('admin')){
        if(isset($_COOKIE['session'])){
            $test=json_decode($_COOKIE['session'],1);
            if($test['profil']['pseudo']==$pseudo){
                $_SESSION=json_decode($_COOKIE['session'],1);
                
            }else{
                $_SESSION['profil']['pseudo'] = $pseudo;
                $_SESSION['profil']['mdp'] = $mdp;
            }
            
        }else{
            
            $_SESSION['profil']['pseudo'] = $pseudo;
            $_SESSION['profil']['mdp'] = $mdp;
            
        }
        var_dump($_SESSION);
        header("Location: index.php?controle=clients&action=admin");
    
        
        
    }else{
        if (count($_POST)==0) require("vue/site/ident.tpl");
    else {
        
        require ("./modele/clientsBD.php");
        
        if (verif_bd($pseudo, $mdp, $profil)) {
           
            $nexturl = "index.php?controle=clients&action=accueilAbon";
            //cokieeeeeeeeeeeeeeeeeeeeeeeeeeeees
            if(isset($_COOKIE['session'])){
                $test=json_decode($_COOKIE['session'],1);
                if($test['profil']['pseudo']==$pseudo){
                    $_SESSION=json_decode($_COOKIE['session'],1);
                    
                }else{
                    $_SESSION['profil'] = $profil;
                }
            }else{
                $_SESSION['profil'] = $profil;
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

?>