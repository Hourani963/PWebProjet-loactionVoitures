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
function touteVoitureAdmin(){

    require('./modele/voitureBD.php');
    $listV = getVoitures();
    //var_dump($listV); die("ok");
    require('./vue/site/vehicule/touteVadmin.tpl');
}

function touteVoitureDispoAdmin(){

    require('./modele/voitureBD.php');
    $VoituresLeftJoinFacture = getVoituresLeftJoinFacture();
    //var_dump($listV); die("ok");
    require('./vue/site/vehicule/touteVDispoAdmin.tpl');
}

function FactureAdmin(){
    if (count($_POST) == 0) {
        require("./modele/clientsBD.php");
        $Client = getId_cli();
        require('./vue/site/components/VoirFactureAdmin.tpl');
    }else {
        require("./modele/clientsBD.php");
        require("./modele/voitureBD.php");
        $Client = getId_cli();
        $valTotal = 0;
        if(isset($_POST['idU'])){
            if($_POST['idU'] == "All"){
                $Facture = getAllFacture();
                if($_POST['mounthDate']!= ''){
                    $Facture2 = array();
                    $j=0;
                    foreach ($Facture as $F){
                        if(strpos($F['dateD'], $_POST['mounthDate']) !== false){
                            $Facture2[$j] = $F;
                            $j++;
                        }
                    }
                    $Facture =$Facture2;
                }
                $i = 0;

                foreach ($Facture as $f) {
                    $Voiture = getVoiture($f['id_vehi']);
                    $Facture[$i]['id_vehi'] = $Voiture['modele'];
                    $i++;
                }
                foreach ($Facture as $f){
                    $valTotal = $valTotal + $f['valeur'];

                }
                //var_dump($valTotal); die("ok");
            } else {
                $Facture = getFacture($_POST['idU']);
                if($_POST['mounthDate']!= ''){
                    $Facture2 = array();
                    $j=0;
                    foreach ($Facture as $F){
                        if(strpos($F['dateD'], $_POST['mounthDate']) !== false){
                            $Facture2[$j] = $F;
                            $j++;
                        }
                    }
                    $Facture =$Facture2;
                }
                $i = 0;
                foreach ($Facture as $f) {
                    $Voiture = getVoiture($f['id_vehi']);
                    $Facture[$i]['id_vehi'] = $Voiture['modele'];
                    $i++;
                }
                foreach ($Facture as $f){
                    $valTotal = $valTotal + $f['valeur'];
                }
            }
            require('./vue/site/components/ListeFactureAdmin.tpl');
        } else{
            require('./vue/site/components/VoirFactureAdmin.tpl');
        }

    }
    
}

function peutAjouter($voiture){
    if(isset($_SESSION['panier'])){
        if(is_array($_SESSION['panier'])){
            if(isset($_SESSION['panier'][0])  && $_SESSION['panier'][0] == $voiture){
                return false;
                
             } 
            foreach($_SESSION['panier'] as $p){
                if($p!=''){
                    if($p['id_vehi'] == $voiture['id_vehi']){
                        return false;;
                   }
                }
                
            }

           
      }
    }
    return true;
}


function ajoutVo($voiture,$dated,$datef){
    if(peutAjouter($voiture)){
        if(isset($_SESSION['nbV'])){
            $nbV = $_SESSION['nbV'];
        }else{
            $nbV=0;
        }
        /******************/
        

        $_SESSION['panier'][$nbV] = $voiture;
        $_SESSION['panier'][$nbV]['datef']=$datef;
        $_SESSION['panier'][$nbV]['dated']=$dated;
        
        
        
        
        
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
    $msg = '';
    
    if((isset($_GET['dateD']) && ($_GET['dateD']=='')) ){
        $msg ="Il faut choisir une date de départ pour ajouter la voiture dans le panier";
        
    }
    else{
        if(isset($_GET['vtr']) && isset($_GET['dateF'])){
            $id_v = $_GET['vtr'];
            $datef=$_GET['dateF'];
            $dated=$_GET['dateD'];
            $vo = getVoiture($id_v);
            ajoutVo($vo,$dated,$datef);
        }
    }

    $listV = getVoituresLeftJoinFacture(); // uniquement les voitures dispo
    require('./vue/site/vehicule/louerVoitureAbon.tpl');
}





function suppVPanierS(){
    $desupp = false;
    $etat=false;
    if(isset($_GET['id'])){
        $id_v =$_GET['id'];
            if(isset($_SESSION['panier']['id_vehi'])){
                if($_SESSION['panier']['id_vehi']==$id_v){
                    if($desupp==false){
                        suppVo(0); 
                        $desupp=true;
                    }                 
            } 
            }   
    }
    
    $panier = $_SESSION['panier'];
    require('vue/site/panier.tpl');
}



function suppVPanier(){
    $desupp = false;
    $etat=false;
    if(isset($_GET['id'])){
        $id_v =$_GET['id'];
        for ($i = 0; $i <= count($_SESSION['panier'])-1; $i++) {
            if(isset($_SESSION['panier'][$i]['id_vehi'])){
                if($_SESSION['panier'][$i]['id_vehi']==$id_v){
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
    $etat = false;
    $dated = 0;
    $datef = 0;
    $afficherPanier = true;
    $res = array();
    if (isset($_SESSION['panier'])) {
        $panier = $_SESSION['panier'];

    }

        if (isset($_GET['valide'])) { // probleme de sécurité
            //Nouvelle facture
            require("./modele/voitureBD.php");
            $test = 0;
            foreach ($panier as $p) {
                if ($p != '') {
                    $id = $_SESSION['profil']['id_cli'];
                    $id_vec = $p['id_vehi'];
                    $start_Date = $p['dated'];
                    $end_Date = $p['datef'];
                    if($end_Date != 'unlimited'){
                        $r = dateDiff(strtotime($p['dated']), strtotime($p['datef']));
                        $p['valeurParJour'] = $p['valeurParJour'] * $r['day'];
                        if ($r['day'] > 30) {
                            $p['valeurParJour'] = $p['valeurParJour'] * 0.95;
                        }
                        $val = $p['valeurParJour'];
                        
                    }
                    else{ // facture sur un mois
                        $r = 30;
                        $end_Date = date('Y-m-d', strtotime('+1 month')); // un mois à partir d'aujourd'hui
                        $p['valeurParJour'] = $p['valeurParJour'] * $r;
                        
                        $p['valeurParJour'] = $p['valeurParJour'] * 0.95;
                        
                        $val = $p['valeurParJour'];
                    }
                    
                    
                    $state = 1; //réglement fait
                    insertFacture($id, $id_vec, $start_Date, $end_Date, $val, $state);
                    etatV($id_vec, "Louer");
                    $_SESSION["nbV"] = 0;

                    $afficherPanier = false;
                }

            }
            $panier = '';
            $_SESSION['panier'] = '';
            $_SESSION['panier'] = array();
            $url = "index.php?controle=clients&action=voirPanier";
            header("Location: $url");
        } else {
            if (isset($_SESSION['panier'])) {
                require("vue/site/panier.tpl");
            } else {
                require("vue/site/panierVide.tpl");
            }
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
    if(isset($_GET['price'])){
        $prix = $_GET['price'];
    }
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
        $nexturl = "index.php?controle=clients&action=admin";
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
        //var_dump($Voiture); die();
        $Facture[$i]['id_vehi'] = $Voiture['modele'];
        $i++;
    }
    //var_dump($Facture); die();
    require('./vue/site/components/VoirFacture.tpl');
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