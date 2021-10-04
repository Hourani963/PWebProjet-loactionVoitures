<?php



function accueilNAbon(){

    require('./vue/site/accueilNAbon.tpl');

    
}

function ident(){

    if(count($_POST)==0) require('./vue/site/ident.tpl');
    else echo $_POST['pseudo'];
    
}
function inscrire(){
    require('./vue/site/inscrire.tpl');
}


?>