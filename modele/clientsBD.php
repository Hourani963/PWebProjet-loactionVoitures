<?php

function verif_bd($pseudo, $email, $mdp, &$profile){
    require('./modele/connectBD.php'); //$pdo est défini dans ce fichier
		$sql="SELECT * FROM `client` WHERE (pseudo=:pseudo OR email=:email) AND mdp=:mdp";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':pseudo', $pseudo);
			$commande->bindParam(':email', $email);
            $commande->bindParam(':mdp', $mdp);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				 var_dump($resultat); die();
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

?>