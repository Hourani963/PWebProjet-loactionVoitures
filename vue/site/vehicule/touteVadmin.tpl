<html>
    <head>
        <meta charset="utf-8">
        <title>S'inscrire</title>
        <link href="./vue/styleCSS/vehicule/louerVoiture.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/fa3cb2061d.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <style>
            .iconAddV{
                margin-left: 40%;
            }
            .addV {
                text-align: center;
                padding-right: 10%;
                width: 80px;
                color: black;
                height: 80px;
                font-size: 3rem;
                z-index: 30;
                border: 8px solid black;
                padding: 10px;
                background-color: transparent;
                border-radius: 50%;
            }
            .addV i {
            }
            .supr {
                width: 30px;
                color: red;
                height: 30px;
                font-size: 2rem;
                float: right;
                position: relative;
                z-index: 30;
                background-color: black;
                border-radius: 50%;
                bottom: 10px;
                right: 10px;
            }
            .supr {
                text-decoration-color: red;
            }
            .allVoitures{
                z-index: auto;
                padding-right: 5%;
                padding-top: 4%;
            }
        </style>
        <div class="menu">
            <?php require("vue/site/components/menuAdmin.tpl");?></div>
        <div class='voitures'>
        <?php
        foreach($listV as $l){ ?>
            <div class="allVoitures">
                <ul>
                    <a href="index.php?controle=vehicule&action=suprVoiture&vtr= <?php echo $l['id_vehi'] ?>">
                        <div class="supr">
                            <i class="fas fa-times-circle"></i>
                        </div>
                    </a>
                    <li class="booking-card" style="background-image: url(<?php echo $l['path_photo'] ?>)">

                        <div class="book-container">

                            <div class="content">

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
        <?php } ?>
        
        <div class="iconAddV" style="padding-right: 70px; display: flex; align-items: center; justify-items: center;">
            <a href="./index.php?controle=vehicule&action=ajoutvoiture">
                <div class="addV">
                    <i class="fas fa-plus"></i>
                </div>
            </a>
        </div>
        </div>

    </body>
</html>