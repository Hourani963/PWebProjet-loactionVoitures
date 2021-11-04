<?php



function ajoutV($marque,$modele,$caract,$path, $etatL){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="INSERT INTO vehicule (marque,modele,caract, path_photo, etatL) VALUES (:marque,:modele,:caract,:path_photo,:etatL);";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':marque', $marque);
        $commande->bindParam(':modele', $modele);
        $commande->bindParam(':caract', $caract);
        $commande->bindParam(':path_photo', $path);
        $commande->bindParam(':etatL', $etatL);

        $bool = $commande->execute();
        if ($bool) {
            return true;
        }
        else return false;
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }

}



function getVoiture($id){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT * FROM vehicule WHERE id_vehi=:id_vehi";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':id_vehi', $id);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
            
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    return $resultat;
    


}


function getVoitures(){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT *  FROM vehicule";
    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    return $resultat;
}
function insertFacture($id_cli, $id_vec, $start_Date, $end_Date, $val, $state_vec){
    require('./modele/connectBD.php');

    //var_dump($_SESSION['profil']); die("ok");
    $sql = "INSERT INTO facture (id_cli,id_vehi,dateD,DateF, valeur, EtatR)
			VALUES (:cli,:vec, :Sdate, :Edate, :val ,:state)";


    try{
        $insert = $pdo->prepare($sql);
        $insert->bindParam(':cli', $id_cli, PDO::PARAM_INT);
        $insert->bindParam(':vec', $id_vec, PDO::PARAM_INT);
        $insert->bindParam(':Sdate', $start_Date, PDO::PARAM_STR);
        $insert->bindParam(':Edate', $end_Date, PDO::PARAM_STR);
        $insert->bindParam(':val', $val, PDO::PARAM_INT);
        $insert->bindParam(':state', $state_vec, PDO::PARAM_STR);
        $insert->execute();

    }
    catch(PDOException $e){
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }

}

function verif_base($marque,$modele){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    
    $sql="SELECT modele FROM `modeles` WHERE marque = :marque and modele = :modele ";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':marque', $marque, PDO::PARAM_STR);
        $commande->bindParam(':modele', $modele, PDO::PARAM_STR);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
            
       
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    if (count($resultat) != 0) {
        return true; 
    }
    return false;
}

function getAllMarque(){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier

    $sql = "SELECT DISTINCT marque FROM modeles";
    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
        return $resultat;
        
    }catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}
function getAllModele(){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier

    $sql = "SELECT DISTINCT modele FROM modeles";
    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
        return $resultat;
        
    }catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}
function getAllMarqueDispo(){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier

    $sql = "SELECT DISTINCT marque FROM vehicule WHERE etatL=0";
    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
        return $resultat;
        
    }catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}
function getAllModelDispo($marque){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier

    $sql = "SELECT DISTINCT modele FROM vehicule WHERE marque=:marque and etatL=0";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':marque', $marque);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
        return $resultat;
        
    }catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}
function CountAllModelDispo($marque){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier

    $sql = "SELECT count(modele) FROM vehicule WHERE marque=:marque and etatL=0";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':marque', $marque);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
        return $resultat;
        
    }catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}
?>