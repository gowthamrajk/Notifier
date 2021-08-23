<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Notifier</title>
	<link rel="stylesheet" href="css/landingStyling.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<div class="content">

  <div class="header">
    <div class="nav">
    	<label><i class="fa fa-bell" aria-hidden="true"></i>&nbsp NOTIFIER</label>
    	<div class="switchs">
    		<button class="log" id="log" onclick="location.href='login.jsp';">LOGIN</button><button class="create_acc" id="create_acc" onclick="location.href='registration.jsp';">CREATE ACCOUNT</button>
    	</div>
    </div>
    <div class="main">
    	<div class="text">
    		<h1>ONE ROOF FOR ALL YOUR <br>PERSONALIZED TASKS</h1><br>
    		<h2>Your Personal Companion</h2><br><br>
    		<button onclick="location.href='login.jsp';" id="active">Create Notes</button>&nbsp;&nbsp;<button onclick="location.href='profilecard.jsp';" id="Contact">Contact me</button>
    	</div>
    	<img class="floating" src="img/bg.png">
    </div>
  </div>

    <div class="body">
     <div class="body1">
     <img src="https://img.icons8.com/color/96/000000/keyhole-shield.png"/>
     <h2>Personalized Notes</h2>
     <p>We provide facility for more personalized notes and notebook creation where you can save/create notes only under a paticular notebook that can be accessed once after you login with your secret user login credentials</p>
     </div>

     <div class="body2">
  <img src="img/edit.png"/>
   <h2>Notes Manipulation</h2>
     <p>You can Edit/Delete/Create any notebook and notes under the respective notebook and can manipulate the content, start date, status, end date, etc.. easily. To be simple, you can manipulate your notebook/notes anytime.</p>
     </div>

      <div class="body3">
  	<img src="https://img.icons8.com/cute-clipart/64/000000/alarm-clock.png"/>
     <h2>Set Alerts</h2>
     <p>Based on the Remainder dates and the end date given by you, the notes specific to the remainder date and not completed till current date will be taken count and the remainder is flagged on th top of the screen with notes name</p>
     </div>
    </div>
</div>
</body>
</html>