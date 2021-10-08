<?php
function verif_base($marque,$modele){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT * FROM `modeles` WHERE marque = :marque AND modele = :modele";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':marque', $marque);
        $commande->bindParam(':modele', $modele);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
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

?>