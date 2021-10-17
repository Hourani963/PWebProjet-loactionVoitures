<?php


function louerVoitureNAbon(){
    require('./modele/voitureBD.php');
    $listV = getVoitures();
    require('./vue/site/vehicule/louerVoitureNAbon.tpl');
}
function louerVoitureAbon(){
    require('./vue/site/vehicule/louerVoitureAbon.tpl');
}
function erreurAjout(){
    require("./vue/site/messageError.tpl");
}
function ajoutvoiture(){
    $marque=strtoupper(isset($_POST['marque'])?($_POST['marque']):''); // trim pour enlever les espaces avant et apres
    $modele=strtoupper(isset($_POST['modele'])?($_POST['modele']):'');
    $caract=isset($_POST['caract'])?($_POST['caract']):'';
    $img=isset($_POST['img']);
    $etatL=isset($_POST['etatL'])?($_POST['etatL']):'';
    if(isset($_FILES['img'])){
        $tmpName = $_FILES['img']['tmp_name'];
        $name = $_FILES['img']['name'];
        $size = $_FILES['img']['size'];
        $error = $_FILES['img']['error'];
        $path = './upload/'.$name;
        move_uploaded_file($tmpName, './upload/'.$name);
    }
    require("./modele/modelesBD.php");
    require("./modele/voitureBD.php");

    if(isset($_POST['marque'])){
        if(verif_base($marque,$modele)){
            if(ajoutV($marque,$modele,$caract,$path, $etatL)){
                echo 'AJOUT CONCLU';
            }
        }else{
            header("Location: index.php?controle=vehicule&action=erreurAjout");
        }
    }
    
    
    require("./vue/site/ajoutVoiture.tpl");
}
?>