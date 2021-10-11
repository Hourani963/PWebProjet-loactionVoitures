<?php 
	session_start ();
	
	if ((count($_GET)!=0) && !(isset($_GET['controle']) && isset ($_GET['action'])))
	require ('./vue/erreur404.tpl'); 
	
	else {
		if ((! isset($_SESSION['profil'])) || count($_GET)== 0)	{
			if(count($_GET)!= 0 && $_GET['controle']=='clients' ){
				$controle = "clients";
				if($_GET['action'] == "inscrire")
					$action = "inscrire";
				else if($_GET['action'] == "ident")
					$action = "ident";
				else if($_GET['action'] == "accueilNAbon")
					$action = "accueilNAbon";
			}
			else if(count($_GET)!= 0 && $_GET['controle']=='vehicule' ){
				$controle = "vehicule";
				if($_GET['action'] == "louerVoitureNAbon")
					$action = "louerVoitureNAbon";
			}
			else {
				$controle = "clients";  
				$action = "accueilNAbon";
			}
		}
		else {
			if (isset($_GET['controle']) && isset ($_GET['action'])) {
				$controle = $_GET['controle']; 
				$action =  $_GET['action'];
			}
		}
		require ('./controle/' . $controle . '.php'); 
		$action();
	} 
?>
