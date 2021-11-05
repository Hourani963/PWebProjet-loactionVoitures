<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Voir les voitures</title>
	<link href="vue/styleCSS/vehicule/louerVoiture.css" rel="stylesheet">

</head>
<body>

<div class="page">
		<div class="menu"><?php include "./vue/site/components/MenuAbon.tpl" ?></div>
		
	<div class="voitures">
		<?php 
			foreach($listV as $l){ 
				$idv = 	$l['id_vehi'];
			?>
				<div class="allVoitures">
					<ul>
						<li class="booking-card" style="background-image: url(<?php echo $l['path_photo'] ?>)">
							<div class="book-container">
								<div class="content">
									<a href="index.php?controle=clients&action=ajoutPanier&vtr=<?php echo $l['id_vehi'] ?>"><button class="btn">Réserver</button></a>
								</div>
							</div>

							<div class="informations-container">
								<h2 class="title"><?php echo $l['marque'] ?></h2>
								<p class="sub-title"><?php echo $l['modele'] ?></p>
								<p class="price">
									<svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
										<path fill="currentColor" d="M3,6H21V18H3V6M12,9A3,3 0 0,1 15,12A3,3 0 0,1 12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9M7,8A2,2 0 0,1 5,10V14A2,2 0 0,1 7,16H17A2,2 0 0,1 19,14V10A2,2 0 0,1 17,8H7Z" />
									</svg>
									<strong><?php echo $l['valeurParJour']. " € / jour" ?></strong>
								</p>
								<p class="sub-title">Voiture disponible : 5 // faut changer</p>
								<div class="more-information">
									<div class="info-and-date-container">
									<button class="dateD" onclick="openForm(<?php echo $l['id_vehi'] ?>)">
										<div class="box date">
											<svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
												<path fill="currentColor" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
											</svg>
											<p>Début</p>
											<p><?php echo isset($dateD[$idv])?$dateD[$idv]:'pas choisif'; ?></p>
											<p></p>
										</div>
									</button>
									<button class="dateF" onclick="openForm(<?php echo $l['id_vehi'] ?>)">
										<div class="box date">
											<svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
												<path fill="currentColor" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
											</svg>
											<p>Fin</p>
											<p><?php echo isset($dateF[$idv])?$dateF[$idv]:"pas choisif";?></p>
										</div>
										</div>
									</button>
									<p class="disclaimer"><?php echo $l['caract'] ?></p> <!-- remarque : pour afficher le prix sans HOVER il faur ajouter un long text-->
								</div>
							</div>
						</li>
					</ul>
				</div>
				
				<?php require ("./vue/site/components/choisirDate.tpl") ?> <!-- il faut mettre ce component dans la boucle pour récupérer le id de chaque voiture-->

			<?php }
		?>
	</div>
	</div>
</body>
</html>