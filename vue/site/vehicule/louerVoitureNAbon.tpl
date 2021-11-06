<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Voir les voitures</title>
	<link href="vue/styleCSS/vehicule/louerVoiture.css" rel="stylesheet">
	<title></title>
</head>
<body>
<style>
	body{
		background: -webkit-gradient(linear, left top, left bottom,
		color-stop(0%, rgba(26, 49, 95, 1)),
		color-stop(10%, rgba(26, 49, 95, 1)),
		color-stop(24%, rgba(29, 108, 141, 1)),
		color-stop(37%, rgba(41, 136, 151, 1)),
		color-stop(77%, rgba(39, 45, 100, 1)),
		color-stop(90%, rgba(26, 49, 95, 1)),
		color-stop(100%, rgba(26, 49, 95, 1)));
		display: inline-block;

		margin-left: 10%;
	}

	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Sofia', sans-serif;
		scrollbar-color: transparent transparent; /* thumb and track color */
		scrollbar-width: 0px;
	}


	*::-webkit-scrollbar {
		width: 0;
	}

	*::-webkit-scrollbar-track {
		background: transparent;
	}

	*::-webkit-scrollbar-thumb {
		background: transparent;
		border: none;
	}

	* {
		-ms-overflow-style: none;
	}
	.allVoitures h2 {
		color: #0a4870;
		font-weight: 500;
	}
	.allVoitures .page.ul {
		display: flex;
		flex-wrap: wrap;
		list-style: none;
		padding: 0;
	}
	.allVoitures ul .booking-card {
		position: relative;
		width: 500px;
		height: 500px;
		display: flex;
		flex: 0 0 300px;
		flex-direction: column;
		margin: 20px;
		margin-bottom: 30px;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		overflow: hidden;
		background-position: center center;
		background-size: cover;
		text-align: center;
		color: #0a4870;
		transition: 0.3s;
		z-index: auto;
	}
	.allVoitures ul .booking-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background: rgba(10, 72, 112, 0);
		transition: 0.3s;
		z-index: auto;
	}
	.allVoitures ul .booking-card .book-container {
		height: 200px;
		z-index: auto;
	}
	.allVoitures ul .booking-card .book-container .content {
		position: relative;
		opacity: 0;
		display: flex;
		align-items: center;
		justify-content: center;
		height: 100%;
		width: 100%;
		transform: translateY(-200px);
		transition: 0.3s;
		z-index: auto;
	}
	.allVoitures ul .booking-card .book-container .content .btn {
		border: 3px solid white;
		padding: 10px 15px;
		background: none;
		text-transform: uppercase;
		font-weight: bold;
		font-size: 1.3em;
		color: white;
		cursor: pointer;
		transition: 0.3s;
		z-index: auto;
	}
	.allVoitures ul .booking-card .book-container .content .btn:hover {
		background: white;
		border: 0px solid white;
		color: #0a4870;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container {
		flex: 1 0 auto;
		padding: 10px;
		background: #f0f0f0;
		transform: translateY(206px);
		transition: 0.3s;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .title {
		position: relative;
		padding-bottom: 10px;
		margin-bottom: 10px;
		font-weight: bold;
		font-size: 1.2em;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .title::after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		height: 3px;
		width: 50px;
		margin: auto;
		background: #0a4870;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .price {
		display: flex;
		align-items: center;
		justify-content: center;
		margin-top: 10px;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .price .icon {
		margin-right: 10px;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .more-information {
		opacity: 0;
		transition: 0.3s;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .more-information .info-and-date-container {
		display: flex;
		margin-left: auto;
		margin-right: auto;
	}
	.allVoitures ul .booking-card .informations-container .more-information .info-and-date-container .box {
		flex: 1 0;
		padding: 15px;
		margin-top: 20px;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		background: white;
		font-weight: bold;
		font-size: 0.9em;
		margin: auto;
	}
	.allVoitures ul .booking-card .informations-container .more-information .info-and-date-container .box .icon {
		margin-bottom: 5px;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .more-information .info-and-date-container .box.info {
		color: #ec992c;
		margin-right: 10px;
		z-index: auto;
	}
	.allVoitures ul .booking-card .informations-container .more-information .disclaimer {
		margin-top: 20px;
		font-size: 0.8em;
		color: #7d7d7d;
		z-index: auto;
	}
	.allVoitures ul .booking-card:hover::before {
		background: rgba(10, 72, 112, 0.6);
		z-index: auto;
	}
	.allVoitures ul .booking-card:hover .book-container .content {
		opacity: 1;
		transform: translateY(0px);
		z-index: auto;
	}
	.allVoitures ul .booking-card:hover .informations-container {
		transform: translateY(0px);
		z-index: auto;
	}
	.allVoitures ul .booking-card:hover .informations-container .more-information {
		opacity: 1;
		z-index: auto;
	}

	.allVoitures .credits {
		display: table;
		background: #0a4870;
		color: white;
		line-height: 25px;
		margin: 10px auto;
		padding: 20px;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		text-align: center;
		z-index: auto;
	}
	.allVoitures .credits a {
		color: #e3ebf1;
		z-index: auto;
	}
	.allVoitures h1 {
		margin: 10px 20px;
		z-index: auto;
	}

	.sub-titleNAbon{
		margin-bottom: 5px;
	}
	.sub-titleAdminVoirV{
		margin-bottom: 5px;
	}
	.informations-containerVoitureLouerAdmin{
		transform: translateY(340px) !important;

	}
	.allVoitures ul .booking-card:hover .informations-containerVoitureLouerAdmin {
		transform: translateY(150px) !important;
	}

	.page{
		display: grid;
		grid-template-columns: 1fr;
		grid-template-rows: 0.1fr 1fr;
		grid-template-areas: "me"
                        "allV" ;
	}
	.voitures{
		padding-top: 50px;
		margin-left: 50px;
		justify-content: center;

		grid-area: allV;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		column-gap:  40px;
	}
	.menu{
		top: 0px;
		grid-area: me;
		z-index: 100;
	}

	.allVoitures{
		z-index: auto;
		position: relative;

	}

	.dateF{
		margin: auto;
	}
	.dateD{
		margin: auto;
	}
	@media screen and (max-width: 1700px) {
		.voitures{
			column-gap: 0px ;
			margin-left: 30px;
		}
	}
	@media screen and (max-width: 1450px) {
		.voitures{
			grid-template-columns: 1fr 1fr;
			column-gap: 40px ;
			margin-left: 70px;
		}
	}
	@media screen and (max-width: 1170px) {
		.voitures{
			column-gap: 0px ;
			margin-left: 0px;
		}
	}
	@media screen and (max-width: 930px) {
		.voitures{
			grid-template-columns: 1fr;
			margin-left: 50%;
		}
	}
	@media screen and (max-width: 985px) {
		.menu{
			height: 20px !important;
		}
	}
	/************petit formulaire pour les dates*********************/
	.open-button {
		background-color: #555;
		color: white;
		padding: 16px 20px;
		border: none;
		cursor: pointer;
		opacity: 0.8;
		position: fixed;
		bottom: 23px;
		right: 28px;
		width: 280px;
	}

	/* The popup form - hidden by default */
	.form-popup {

		display: none;
		position: fixed;
		-webkit-transform: translate(-50%,-50%);
		transform: translate(-50%,-50%);
		top: 50%;
		left: 50%;
		border: 3px solid #f1f1f1;
		z-index: 9;
	}
	.form-popup body{
		filter: blur(8px);
		-webkit-filter: blur(8px);
	}

	/* Add styles to the form container */
	.form-container {
		max-width: 300px;
		padding: 10px;
		background-color: white;
	}


	/* Set a style for the submit/login button */
	.form-container .btn {
		background-color: #04AA6D;
		color: white;
		padding: 16px 20px;
		border: none;
		cursor: pointer;
		width: 100%;
		margin-bottom:10px;
		opacity: 0.8;
	}

	/* Add a red background color to the cancel button */
	.form-container .cancel {
		background-color: red;
	}

	/* Add some hover effects to buttons */
	.form-container .btn:hover, .open-button:hover {
		opacity: 1;
	}
</style>
<header style="z-index: 10000;">
	<?php include "./vue/site/components/MenuNAbon.tpl" ?>
</header>
<section style="z-index: auto">
	<div class="page">
		<div class="voitures">
			<?php
			foreach($listV as $l){ ?>
			<div class="allVoitures">
				<ul>
					<li class="booking-card" style="background-image: url(<?php echo $l['path_photo'] ?>)">
						<div class="book-container">
							<div class="content">
								<a href="index.php?controle=clients&action=ident"><button class="btn">Réserver</button></a>
							</div>
						</div>

						<div class="informations-container">
							<h2 class="title"><?php echo $l['marque'] ?></h2>
							<p class="sub-title"><?php echo $l['modele'] ?></p>
							<p class="price">
								<svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
									<path fill="currentColor" d="M3,6H21V18H3V6M12,9A3,3 0 0,1 15,12A3,3 0 0,1 12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9M7,8A2,2 0 0,1 5,10V14A2,2 0 0,1 7,16H17A2,2 0 0,1 19,14V10A2,2 0 0,1 17,8H7Z" />
								</svg>De 0 à 15 €
							</p>
							<p class="sub-title">Voiture disponible : 5</p>
							<div class="more-information">
								<div class="info-and-date-container">
									<div class="box info">
										<svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
											<path fill="currentColor" d="M11,9H13V7H11M12,20C7.59,20 4,16.41 4,12C4,7.59 7.59,4 12,4C16.41,4 20,7.59 20,12C20,16.41 16.41,20 12,20M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M11,17H13V11H11V17Z" />
										</svg>
										<p>Parc des expositions à NANTES</p>
									</div>

									<div class="box date">
										<svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
											<path fill="currentColor" d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z" />
										</svg>
										<p>Samedi 1er février 2020</p>
									</div>
								</div>

								<p class="disclaimer"><?php echo $l['caract'] ?></p> <!-- remarque : pour afficher le prix sans HOVER il faur ajouter un long text-->
							</div>
						</div>
					</li>
				</ul>
			</div>
			<?php }
		?>
		</div>
	</div>
</section>
</body>
</html>