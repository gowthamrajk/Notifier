<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="css/registerStyling.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
    <div class="wrapper">
        <h1>LOGIN</h1>
<div class="form-conteniar">
            <form action="loginServlet" method="post" autocomplete="off" name="register-form" id="register-form">
                <div class="input-name">
                        <i class="fa fa-envelope email"></i>
                        <input type="email" placeholder="email address" id="email" name="email" onkeyup="validation()" required class="text-name">
                        <span id="subtext1"></span>
                </div>
                <div class="input-name">
                    <i class="fa fa-lock lock"></i>
                    <input type="password" placeholder="password" id="password" name="password" size="20" class="text-name" onkeydown="validation()" aria-describedby="passwordHelpBlock">
                    <div id="strength"><span id="subtext2"></span></div>
                    <br><font size="1px" color="gray">
                    Your password must be 8-20 characters long, atleast one uppercase, lowercase, number, and must not contain spaces, special characters, or emojis.
                    </font>
                </div>
                <div class="input-name">
                      <label class="text">New to our service.. <a href="registration.jsp">create account?</a></label>
                </div>
                <div class="input-name">
                      <label class="text"><a href="resetPassword.jsp">Forget Password ?</a></label>
                      </div>
                <div class="input-name">
                        <center><input class="button" type="submit" value="Sign In" /></center>
                </div>
              </form>
         </div>
     </div> 
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
     <script src="js/register.js"></script>
</body>
</html>