<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile Success</title>

<link href="css/registerSuccessStyling.css" rel="stylesheet" type="text/css"/>
<meta http-equiv='refresh' content='8;URL=dashboard.jsp'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">
</head>

</head>
<body>
<center>
  <div class="row col-md-10 col-md-offset-3">
   <div class="card card-body">
   <center><img src="img/success.gif" width="200px" height="200px"></center>
    <br><h2>Hello <font color="marron">${name}</font>,<br/>Profile Updated Successfully !!!</h2>
    <br><h4>You will be redirected to dashboard in few Seconds</h4>
   </div>
  </div>
 <br>
 </center>
</body>
</html>