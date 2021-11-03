<?php
	//$hostname = "localhost:3306";
	$hostname = "10.191.12.131:3306";	
	//$hostname = "proxy50.rt3.io:30465";
	//$hostname = "46.193.0.163:3306";	
	$base= "pweb";
	$loginBD= "ahmad";	
	$passBD="syfsa";
	
	try {
		//$pdo = mysql_connect('10.191.12.131:3306', 'ahmad', 'syfsa');
		
		$dsn = "mysql:host=$hostname ; dbname=$base"; // LE MOT SERVER DOIT êTRE HOST
		$pdo = new PDO ($dsn, $loginBD, $passBD,
		array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de connexion : " . $e->getMessage() . "\n");
		die(); 
	}
?>