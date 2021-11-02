<?php
function touteVoiture(){
    
    require('./modele/voitureBD.php');
    $listV = getVoitures();
    require('./vue/site/touteV.tpl');
}
function ajoutVo($voiture){
    $nbV = $_SESSION['nbV'];
    $_SESSION['panier'][$nbV] = $voiture;
    $_SESSION['nbV']=$_SESSION['nbV']+1;

}
function suppVo($i){
    $_SESSION['panier'][$i][0]='';
    $_SESSION['nbV']=$_SESSION['nbV']-1;
}
function ajoutPanier(){
    require("./modele/voitureBD.php");
    $id_v =isset($_GET['vtr'])?trim($_GET['vtr']):'';
    $a=true;
    echo($_SESSION['nbV']);
    $test=$_SESSION['panier'];
    if($_SESSION['nbV']==0){
        $a=false;
    }else{
        foreach($test as $p){
            if($p[0]['id_vehi']==$id_v){
                $a=false;
            }
        }
    }
    
    if($a){
        $voiture = getVoiture($id_v);
        ajoutVo($voiture);
        
        //var_dump($_SESSION['panier']);
    }
    $listV = getVoitures();
    require('./vue/site/touteV.tpl');
}
function suppVPanier(){
    $id_v =isset($_GET['id'])?trim($_GET['id']):'';
    $b=true;
    if(isset($id_v)){
        if($_SESSION['nbV']==1){
            suppVo("");
        }
        for ($i = 1; $i <= $_SESSION['nbV']-1; $i++) {
            if($_SESSION['panier'][$i][0]['id_vehi']==$id_v){
                    suppVo($i);                            
            }

            
        }
    }
    $panier = $_SESSION['panier'];
    require('vue/site/panier.tpl');
}
function voirPanier(){
    if(isset($_SESSION['panier'])){
        $panier = $_SESSION['panier'];
        require('vue/site/panier.tpl');
    }else{
        require('vue/site/panierVide.tpl');
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