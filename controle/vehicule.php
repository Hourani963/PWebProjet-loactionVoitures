<?php
function ajoutvoiture(){
    $type=isset($_POST['type']); // trim pour enlever les espaces avant et apres
    $quantité=isset($_POST['quantité']); // trim pour enlever les espaces avant et apres
    $caract=isset($_POST['caract']);
    require("./vue/site/ajoutVoiture.tpl");
    
}


?>