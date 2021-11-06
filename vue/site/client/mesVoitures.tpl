<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Mes voitures</title>
    <link href="vue/styleCSS/vehicule/louerVoiture.css" rel="stylesheet">
</head>

<body style="text-align: center">
<header style="z-index: 100000;">
    <?php include "./vue/site/components/MenuAbon.tpl" ?>
</header>
<section style="z-index: auto">
    <div class="page">
        <div class="voitures">
            <?php
            if($listVClient != false){
            foreach($listVClient as $l){
                $dateDynamique = ((strtotime($l['DateF']) - strtotime(date('Y-m-d'))) / (60 * 60 * 24));
                $dateStatic = ((strtotime($l['DateF']) - strtotime($l['dateD'])) / (60 * 60 * 24));
            ?>
            <div class="allVoitures">
                <ul>
                    <li class="booking-card" style="background-image: url(<?php echo $l['path_photo'] ?>)">
                        <div class="book-container">
                            <div class="content">
                                <a href="">
                                    <button class="btn">Réserver</button>
                                </a>
                            </div>
                        </div>

                        <div class="informations-container">
                            <h2 class="title"><?php echo $l['marque'] ?></h2>
                            <p class="sub-title"><?php echo $l['modele'] ?></p>
                            <p class="price">
                                <svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
                                    <path fill="currentColor"
                                          d="M3,6H21V18H3V6M12,9A3,3 0 0,1 15,12A3,3 0 0,1 12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9M7,8A2,2 0 0,1 5,10V14A2,2 0 0,1 7,16H17A2,2 0 0,1 19,14V10A2,2 0 0,1 17,8H7Z"/>
                                </svg>
                                <?php echo $l['valeur'] . " €" ?>
                            </p>
                            <p class="sub-title">Nombre de jours restant
                                <strong><?php echo ($dateStatic<$dateDynamique?$dateStatic:$dateDynamique);  ?></strong>
                            </p>
                            <div class="more-information">
                                <div class="info-and-date-container">
                                    <div class="box date">
                                        <svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                  d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z"/>
                                        </svg>
                                        <p><?php echo $l['dateD'] ?></p>
                                        <p>Début</p>
                                    </div>

                                    <div class="box date">
                                        <svg class="icon" style="width:24px;height:24px" viewBox="0 0 24 24">
                                            <path fill="currentColor"
                                                  d="M19,19H5V8H19M16,1V3H8V1H6V3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3H18V1M17,12H12V17H17V12Z"/>
                                        </svg>

                                        <p><?php echo $l['DateF'] ?></p>
                                        <p>Fin</p>
                                    </div>
                                </div>

                                <p class="disclaimer"><?php echo $l['caract'] ?></p>
                                <!-- remarque : pour afficher le prix sans HOVER il faur ajouter un long text-->
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <?php
                }
            } else { ?>
            <div style="width: 60%;margin: auto; margin-top: 85%; margin-left: 160%;">
                <h1 style="color: white; font-size: 30px; font-style: italic;">Pas de Voiture disponible </h1>
            </div>

            <?php } ?>
        </div>
    </div>
</section>


</body>
</html>