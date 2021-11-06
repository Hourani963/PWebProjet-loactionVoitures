<?php



function ajoutV($marque,$modele,$caract,$path, $etatL,$valeurParJour){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="INSERT INTO vehicule (marque,modele,caract, path_photo, etatL,valeurParJour) VALUES (:marque,:modele,:caract,:path_photo,:etatL,:valeurParJour);";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':marque', $marque);
        $commande->bindParam(':modele', $modele);
        $commande->bindParam(':caract', $caract);
        $commande->bindParam(':path_photo', $path);
        $commande->bindParam(':etatL', $etatL);
        $commande->bindParam(':valeurParJour', $valeurParJour);
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
        if(count($resultat)==1){
            $resultat=$resultat[0];
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    return $resultat;
    


}

function getVoituresAbonne(){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT *  FROM vehicule WHERE etatL <> 2 AND etatL <> 1";
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

function getVoitures(){ // Left join est seulement pour récupérer les date dans les factures pour l'affichage
    require('./modele/connectBD.php'); 
    $sql = "SELECT DISTINCT *,vehicule.id_vehi  FROM vehicule 	
            LEFT JOIN facture ON vehicule.id_vehi = facture.id_vehi";
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
/*
function getVoitureLoué(){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT *  FROM vehicule WHERE etatL <> 'Disponible' AND etatL <> 'Revision'";
    //$sql="SELECT *  FROM vehicule WHERE etatL <> 0 AND etatL <> 2";
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
*/
function getVoitureLouer(){ // j'ai fait INNER JOIN pour récupérer les date dans les factures
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql = "SELECT DISTINCT * FROM vehicule 
            INNER JOIN facture ON facture.id_vehi = vehicule.id_vehi";

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
function getVoituresLeftJoinFacture(){ // utiliser pour la fonction affichier toute les voitures avec leur facture
    // comme il y a des voitures facturé et des voitures non facturé, j'ai besoin de faire inner join
    require('./modele/connectBD.php'); 
    $sql = "SELECT DISTINCT *,vehicule.id_vehi  FROM vehicule 	
            LEFT JOIN facture ON vehicule.id_vehi = facture.id_vehi WHERE vehicule.etatL = 'Disponible'";
    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
       // var_dump($resultat);die;
        return $resultat;
        
    }catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}

function insertFacture($id_cli, $id_vec, $start_Date, $end_Date, $val, $state_vec){
    require('./modele/connectBD.php');

    //var_dump($_SESSION['profil']); die("ok");
    $sql = "INSERT INTO facture (id_cli,id_vehi,dateD,DateF, valeur, EtatR)
			VALUES (:cli,:vec, :Sdate, :Edate, :val ,:EtatR)";


    try{
        $insert = $pdo->prepare($sql);
        $insert->bindParam(':cli', $id_cli, PDO::PARAM_INT);
        $insert->bindParam(':vec', $id_vec, PDO::PARAM_INT);
        $insert->bindParam(':Sdate', $start_Date, PDO::PARAM_STR);
        $insert->bindParam(':Edate', $end_Date, PDO::PARAM_STR);
        $insert->bindParam(':val', $val, PDO::PARAM_INT);
        $insert->bindParam(':EtatR', $state_vec, PDO::PARAM_STR);
        $insert->execute();

    }
    catch(PDOException $e){
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }

}

function verif_base($marque,$modele){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    
    $sql="SELECT modele FROM `modeles` WHERE marque = :marque OR modele = :modele ";
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

    $sql = "SELECT DISTINCT marque FROM vehicule WHERE etatL='Disponible'";
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

    $sql = "SELECT DISTINCT modele FROM vehicule WHERE marque=:marque and etatL='Disponible'";
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

    $sql = "SELECT count(modele) FROM vehicule WHERE marque=:marque and etatL='Disponible'";
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

function countVoiture(){
    require('./modele/connectBD.php');
    $sql = "SELECT COUNT(*) FROM vehicule";

    $stmt = $pdo->query($sql);
    $count = $stmt->fetchColumn();
    return $count;
}

function etatV($ide_vehi , $etatL){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="UPDATE vehicule SET  etatL = :etatL WHERE (id_vehi = :id_vehi)";
    try {
        $Smdp = $pdo->prepare($sql);
        $Smdp->bindParam(":etatL", $etatL, PDO::PARAM_STR);
        $Smdp->bindParam(":id_vehi", $ide_vehi, PDO::PARAM_INT);
        
        
        $Smdp->execute();
        $resultat = $Smdp->fetchAll(PDO::FETCH_ASSOC);
        //var_dump($resultat);die;
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
}

?>