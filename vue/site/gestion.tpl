<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="./vue/site/sstyleCSS/accueilNAbon.css" rel="stylesheet">
	<title></title>
</head>
<body>
	<div><?php require("vue/site/components/menuAdmin.tpl");?></div>
    <div class="content" style="padding-left:100px">
    <?php for($i = 0; $i < count($res); ++$i){
        echo $i;
        echo ($res[$i]['nom'] ."  ". $res[$i]['marque'] . $res[$i]['modele'] . $res[$i]['dateD'] . $res[$i]['dateF'] . '<p>');
        if($i < count($res)-1){
            $b = $i+1;
        }else{
            $b=$i;
        }
        if($res[$i]['nom']!=$res[$b]['nom']){
           echo  '<p>' . "   panerfinis" . '<p>';
        }
    }?>
</div>
</body>
</html>
