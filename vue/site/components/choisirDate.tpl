<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Choisir date</title>
	<link href="#" rel="stylesheet">

</head>
<body>
    <div class="form-popup" id="myForm">
        <form action="index.php?controle=vehicule&action=louerVoitureAbon" class="form-container" method="POST">

            <div class="input-container">
                <label for="StartDate" class="placeholder">Date Départ</label>
                <input type="date" id="StartDate" name="StartDate" class="input"  required>
            </div>
            <div class="input-container">
                <label for="EndDate" class="placeholder">Date Fin</label>
                <input type="date" id="EndDate" name="EndDate" class="input" >
            </div>

            <button type="submit" class="btn">Valider</button>
           
            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        </form>
    </div>

<script>
function openForm() {
document.getElementById("myForm").style.display = "block";


}

function closeForm() {
document.getElementById("myForm").style.display = "none";
}
</script>
</body>
</html>