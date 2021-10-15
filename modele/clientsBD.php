<?php

function unique_bd($pseudo, $email){ // unique pseudo ou email dans la base de donnée
	require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
		$sql="SELECT * FROM `client` WHERE (pseudo = :pseudo OR email= :email)";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':pseudo', $pseudo);
			$commande->bindParam(':email', $email);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); 
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		if (count($resultat) == 0) {
			return false; 
		}
		else {
			return true;
		}
}

function verif_bd($pseudo, $mdp, &$profil){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
		$sql="SELECT * FROM `client` WHERE (pseudo = :pseudo OR email=:pseudo) AND mdp = :mdp";
        
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':pseudo', $pseudo);
			$commande->bindParam(':email', $pseudo);
            $commande->bindParam(':mdp', $mdp);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				 
				/*while ($ligne = $commande->fetch()) { // ligne par ligne
					print_r($ligne);
				}*/
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		if (count($resultat) == 0) {
			$profil=array(); // Pour qu'il y ait quand même quelque chose...
			return false; 
		}
		else {
			$profil = $resultat[0];
			//var_dump($profil);
			return true;
		}
}

function insertClient	($nom, $prenom, $pseudo, $mdp,$email){
	require('./modele/connectBD.php');

	$sql = "INSERT INTO client (nom,prenom,pseudo,mdp,email)
			VALUES (:nom,:prenom, :pseudo, :mdp, :email)";


	try{
		$insert = $pdo->prepare($sql);
		$insert->bindParam(':nom', $nom, PDO::PARAM_STR);
		$insert->bindParam(':prenom', $prenom, PDO::PARAM_STR);
		$insert->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
		$insert->bindParam(':mdp', $mdp, PDO::PARAM_STR);
		$insert->bindParam(':email', $email, PDO::PARAM_STR);
		$insert->execute();

		return $pdo->lastInsertID(); //récupérer le id de dernère ligne insérer
	}
	catch(PDOException $e){
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die(); // On arrête tout.
	}
}

function getId_cli(){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
    $sql="SELECT id_cli, nom, prenom  FROM client";
    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
            // var_dump($resultat); die("Ok");
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); // On arrête tout.
    }
    return $resultat;
}

?>