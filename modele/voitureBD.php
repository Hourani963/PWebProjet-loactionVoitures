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
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    return false;

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
    $sql="SELECT * FROM vehicule";
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


?>