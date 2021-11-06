<?php

function suprVoiture(){
    require('./modele/voitureBD.php');
    $id_v =isset($_GET['vtr'])?trim($_GET['vtr']):'';
    //echo $id_v; die("ok");
    suprV($id_v);
    $url = "./index.php?controle=clients&action=touteVoitureAdmin";
    header("Location:" .$url);
}


function louerVoitureNAbon(){
    require('./modele/voitureBD.php');
    $listV = getVoitures();
    
    require('./vue/site/vehicule/louerVoitureNAbon.tpl');
}


function louerVoitureAbon(){  // le client choisi la date ici
    require('./modele/voitureBD.php');
    //$count = countVoiture(); // le nombre des voitures dans la base
    $prixTotal = "";
    $id_vehi = isset($_POST['idV'])?($_POST['idV']):0;
    $voiture = getVoiture($id_vehi);
    $msg = '';
    //var_dump($voiture[0]);die;
 
    //isset($_POST['StartDate'])?$dateD[$id_vehi] = $_POST['StartDate']:$dateD[$id_vehi]='';
    if(isset($_POST['StartDate'])){
        $dateD[$id_vehi] = $_POST['StartDate'];

        $dateDynamique = ((strtotime($dateD[$id_vehi]) - strtotime(date('Y-m-d'))) / (60 * 60 * 24));
        if($dateDynamique <= 0){
            $dateD[$id_vehi]= '';
            $dateStatic = '';
            $msg = "il faut que la date de début soit à partir d'aujourd'hui";
        }
        else{
            if(isset($_POST['EndDate']) &&  $_POST['EndDate'] != ''){
            
                $dateF[$id_vehi] = $_POST['EndDate'];
                $dateStatic = ((strtotime($dateF[$id_vehi]) - strtotime($dateD[$id_vehi])) / (60 * 60 * 24));// la périod de location
                
                if($dateStatic <= 0){ // ajouter la contraint dateF > dateD
                    $dateStatic = 0;
                    $msg = "il faut choisir la date de fin de location après la date de début";
                }
                else{
                    $prixTotal = $dateStatic * $voiture[0]['valeurParJour'];
                }
                
                //var_dump ($voiture[0]); die;
            }
            else{
                $dateF[$id_vehi]='';
                $prixTotal = 30 * $voiture[0]['valeurParJour'];
                $dateStatic = 30;
            }
    
        }
        
        
       // echo $prixTotal; die;      
    }
    
    
    
    $listV = getVoitures();
    require('./vue/site/vehicule/louerVoitureAbon.tpl');
}

function ajoutvoiture(){ // pour le Admin
    require("modele/voitureBD.php");
    $listeModele = getAllModele();
    $listeMarque = getAllMarque();

 
    $msgWrong="";
    $msgDone="";
    $marque=strtoupper(isset($_POST['marque'])?($_POST['marque']):''); // trim pour enlever les espaces avant et apres
    $modele=strtoupper(isset($_POST['modele'])?($_POST['modele']):'');
    $caract=isset($_POST['caract'])?($_POST['caract']):'';
    $img=isset($_POST['img']);
    $etatL=isset($_POST['etatL'])?($_POST['etatL']):'';
    $prix = isset($_POST['prix'])?($_POST['prix']):'';

    if(isset($_FILES['img'])){
        $tmpName = $_FILES['img']['tmp_name'];
        $name = $_FILES['img']['name'];
        $size = $_FILES['img']['size'];
        $error = $_FILES['img']['error'];
        $path = './upload/'.$name;
        move_uploaded_file($tmpName, './upload/'.$name);
    }
    
    if(count($_POST) == 0)require("vue/site/ajoutVoiture.tpl");
    else{
        if(verif_base($marque, $modele)){
            if(ajoutV($marque,$modele,$caract,$path, $etatL,$prix)){
                $msgDone = "Voiture Bien Ajouté";
                require("vue/site/ajoutVoiture.tpl");
            }
        }else{
            $msgWrong = "Erreur d'ajouter la voiture (car not in DB)";
            require("vue/site/ajoutVoiture.tpl");
        }
    }
}


?>