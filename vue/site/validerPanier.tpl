<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link href="./vue/styleCSS/formPayement.css" rel="stylesheet">
	<title></title>
</head>
<body>

<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link href="./vue/styleCSS/formPayement.css" rel="stylesheet">
	<title></title>
</head>
<body>
<div class="tips">
Payment card number: (4) VISA, (51 -> 55) MasterCard, (36-38-39) DinersClub, (34-37) American Express, (65) Discover, (5019) dankort
</div>

<div class="container">
  <div class="col1">
    <div class="card">
      <div class="front">
        <div class="type">
          <img class="bankid"/>
        </div>
        <span class="chip"></span>
        <span class="card_number">&#x25CF;&#x25CF;&#x25CF;&#x25CF; &#x25CF;&#x25CF;&#x25CF;&#x25CF; &#x25CF;&#x25CF;&#x25CF;&#x25CF; &#x25CF;&#x25CF;&#x25CF;&#x25CF; </span>
        <div class="date"><span class="date_value">MM / YYYY</span></div>
        <span class="fullname">FULL NAME</span>
      </div>
      <div class="back">
        <div class="magnetic"></div>
        <div class="bar"></div>
        <span class="seccode">&#x25CF;&#x25CF;&#x25CF;</span>
        <span class="chip"></span><span class="disclaimer">This card is property of Random Bank of Random corporation. <br> If found please return to Random Bank of Random corporation - 21968 Paris, Verdi Street, 34 </span>
      </div>
    </div>
  </div>
  <div class="col2">
    <label>Numéro de CB</label>
    <input class="number" type="text" ng-model="ncard" maxlength="19" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
    <label>Nom complet</label>
    <input class="inputname" type="text" placeholder=""/>
    <label>Date</label>
    <input class="expire" type="text" placeholder="MM / YYYY"/>
    <label>CVV</label>
    <input class="ccv" type="text" placeholder="CVC" maxlength="3" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
    <a href ='index.php?controle=clients&action=panierValidé' ><button class="buy"><i class="material-icons"></i> Payer €</button></a>
  </div>
</div>
</body>