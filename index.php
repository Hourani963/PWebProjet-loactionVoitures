<?php 
	session_start ();
	
	if ((count($_GET)!=0) && !(isset($_GET['controle']) && isset ($_GET['action'])))
	require ('./vue/erreur404.tpl'); 
	
	else {
		if ((! isset($_SESSION['profil'])) || count($_GET)== 0)	{
			$controle = "clients";  
			if(count($_GET)!= 0 && $_GET['action'] == "inscrire"){
				$action = "inscrire";
			}
			else if(count($_GET)!= 0 && $_GET['action'] == "ident"){
				$action = "ident";
			}else if(count($_GET)!= 0 && $_GET['action'] == "admin"){
				$action = "admin";
			}
			else $action = "accueilNAbon";
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
