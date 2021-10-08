<?php
    function insertFacture($id_cli, $id_vec, $start_Date, $end_Date, $vak, $state_vec){
        require('./modele/connectBD.php');

        $sql = "INSERT INTO facture (id_cli,id_vehi,dateD,DateF, valeur, EtatR)
			VALUES (:cli,:vec, :Sdate, :Edate, :val ,:state)";


        try{
            $insert = $pdo->prepare($sql);
            $insert->bindParam(':cli', $id_cli, PDO::PARAM_INT);
            $insert->bindParam(':vec', $id_vec, PDO::PARAM_INT);
            $insert->bindParam(':Sdate', $start_Date, PDO::PARAM_STR);
            $insert->bindParam(':Edate', $end_Date, PDO::PARAM_STR);
            $insert->bindParam(':val', $end_Date, PDO::PARAM_INT);
            $insert->bindParam(':state', $state_vec, PDO::PARAM_STR);
            $insert->execute();

        }
        catch(PDOException $e){
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }

    }
?>
