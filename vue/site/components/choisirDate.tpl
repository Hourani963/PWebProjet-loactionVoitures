<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Choisir date</title>
	<link href="#" rel="stylesheet">

</head>
<body>
    <div class="form-popup" id="<?php echo $l['id_vehi'] ?>">
        <form action="index.php?controle=vehicule&action=louerVoitureAbon" class="form-container" method="POST">

            <div class="input-container">
                <label for="StartDate" class="placeholder">Date Départ</label>
                <input type="date" id="StartDate" name="StartDate" class="input" value="<?php echo $dateD[$idv]; ?>"  required>
            </div>
            <div class="input-container">
                <label for="EndDate" class="placeholder" >Date Fin</label>
                <input type="date" id="EndDate" name="EndDate" class="input" value="<?php echo $dateF[$idv]; ?>">
            </div>
            <input type="text" value="<?php echo $l['id_vehi'] ?>" name="idV"  style="display: none;"> <!--le id_vehi just pour savoir que la date correspond bien à quel voiture -->
            <button type="submit" class="btn">Valider</button>
            <button type="button" class="btn cancel" onclick="closeForm(<?php echo $l['id_vehi'] ?>)">Close</button>
        </form>
    </div>

<script>
function openForm(x) {
document.getElementById(x).style.display = "block";


}

function closeForm(x) {
document.getElementById(x).style.display = "none";
}
</script>
</body>
</html>