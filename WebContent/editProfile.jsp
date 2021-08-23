<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="databaseConnection.DatabaseConnector" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link href="css/registerStyling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <style>
    .vertical-center 
    {
         margin: 0;
         margin-top: 20%;
         line-height: 40px;
         color: red;
         -ms-transform: translateY(-50%);
         transform: translateY(-50%);
     }
     nav .selected:hover
     {
	     background-color: #45a2a8;
	     cursor: pointer;
     }
    </style>
</head>
<body>
 <nav>
   <a class="links logo" href="#"><i class="fas fa-bell"></i> Notifier</a>
   <div class="rightSection">
   <form action="logoutServlet" method="get">
  <button class="selected"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</button></form></div>
   <div class="rightSection">
  <button class="selected" onclick="window.location='dashboard.jsp'"><i class="fas fa-home"></i> Dashboard</button></div>
  </nav>
<%
String email=(String)session.getAttribute("currmail"); 
int sumcount=0;
try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
    String query = "select * from users where email='"+email+"'";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(query);
    if(!rs.isBeforeFirst() )
    {
    %>
        <div class="vertical-center">
    	<h1><center>No Active user Avaliable currently !!! <br/>Please Login Again</center></h1>
    	</div>

    <% }
    while(rs.next())
    {
%>
     <div class="wrapper">
        <center><h2>Hello <font color="maroon">${name}</font>,<br/>Update your Personal Profile</h2></center>
         <div class="form-conteniar">
            <form action="editServlet" method="post" autocomplete="off" name="register-form" id="register-form">
                <div class="input-name">
                    <i class="fa fa-user lock"></i>
                    <input type="text" placeholder="user name" id="username" value="<%=rs.getString("username")%>" name="username" class="text-name" required>
                </div>
                <div class="input-name">
                        <i class="fa fa-phone mobile"></i>
                        <input type="number" placeholder="mobile number (+91 ..........)" id="mobile" value="<%=rs.getString("mobile")%>" name="mobile" onkeyup="checkMobileNumber()" required class="text-name">
                        <span id="checkMobile"></span>
                </div>
                <div class="input-name">
                        <i class="fa fa-envelope email"></i>
                        <input type="email" placeholder="email address" id="email" value="<%=rs.getString("email")%>" name="email" onkeyup="validation()" required class="text-name" readonly>
                        <span id="subtext1"></span>
                        <font size="1px" color="gray">
                         You cannot edit your email
                         </font>
                </div>
                <div class="input-name">
                    <i class="fa fa-lock lock"></i>
                    <input type="password" placeholder="password" id="password" value="<%=rs.getString("password")%>" name="password" size="20" class="text-name" onkeydown="validation()" aria-describedby="passwordHelpBlock">
                    <div id="strength"><span id="subtext2"></span></div>
                    <br><font size="1px" color="gray">
                    Your password must be 8-20 characters long, atleast one uppercase, lowercase, number, and must not contain spaces, special characters, or emojis.
                    </font>
                </div>
                <div class="input-name">
                        <center><input class="button" type="submit" value="Update Profile" /></center>
                </div>
              </form>
         </div>
     </div>
<%
    }
   }
  catch(Exception e){}
%>

     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
     <script src="js/register.js"></script>
</body>
</html>