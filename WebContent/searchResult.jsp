<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="Note.*" %>
<%@ page import="databaseConnection.DatabaseConnector" %>
<%@ page import="Notebook.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Result</title>
<link href="css/registerStyling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    
<style>
.custom-box
{
	max-width: 700px;
	background-color: #d9faed;
	margin: 40px auto;
	padding: 30px;
	border-radius: 10px;
}
.result-box
{
	text-align: center;
	animation: fadeInRight 3s ease ;
	box-shadow: 0 15px 15px 5px rgba(0,0,0,0.6);
}
.result-box h1
{
	font-size: 40px;
	line-height: 42px;
	font-family: 'Patua One';
	color: maroon;
	text-shadow: 2px 3px 15px gold;
}
.result-box table
{
	width: 100%;
	border-collapse: collapse;
	margin: 30px 0px;
   box-shadow: 0 4px 4px 1px rgba(0,0,0,0.4);
}
.result-box table td
{
	border: 2px solid #cccccc;
	padding: 8px 20px;
	font-weight: 500;
	border-top: 2px solid maroon;
	color: black;
	width: 50%;
	font-family: "Lucida Handwriting", "Courier New";
	font-size: 18px;
	text-align: left;
}
.result-box .btn
{
	margin-left: 20px;
	box-shadow: 0 2px 2px 1px rgba(0,0,0,0.4);
}
span
{
    font-weight: bold;
}
nav .selected1 
   {
       background: #45a2a8;
       font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
       font-weight: bold;
       float: left;
       color: white;
       margin-left: 10px;
       margin-right: 10px;
       text-align: center;
       padding: 10px 10px;
       text-decoration: none;
       font-size: 18px;
       line-height: 25px;
       border-radius: 4px;
   }
   nav .selected1:hover
   {
       color: white;
   }
   nav .links:hover
   {
       color: white;
   }
   .badge 
   { 
        position: absolute; 
        color: white;
        top: 4px;
        text-decoration: none;
        left: 91.2%; 
        background-color: red;
        padding: 3px 3px 3px 3px;
        border-radius: 50%; 
   }
    nav .selected:hover
     {
	     background-color: #45a2a8;
	     cursor: pointer;
     }
     .text
     {
         font-size: 20px;
         font-family: 'Reggae One', cursive;
     }
    .vertical-center 
    {
         margin: 0;
         margin-top: 20%;
         line-height: 40px;
         color: red;
         -ms-transform: translateY(-50%);
         transform: translateY(-50%);
     }
     .vertical-center1
    {
         margin: 0;
         margin-top: 6%;
         line-height: 40px;
         color: red;
         -ms-transform: translateY(-50%);
         transform: translateY(-50%);
     }
     .status
     { 
         background: #21827c;
         padding: 5px;
         margin-left: 23%;
         margin-top: -2.5%;
         color: white;
         width: 14%;
         font-family: 'Kelly Slab', cursive;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 15px;
     }
     .startdate
     { 
         background: #21827c;
         padding: 5px;
         margin-left: 41%;
         margin-top: -3.1%;
         color: white;
         width: 25%;
         font-family: 'Kelly Slab', cursive;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 15px;
     }
     .notebooksname
     { 
         background: transparent;
         padding: 0px;
         color: black;
         margin-top: -0.1%;
         font-weight: bold;
         width: 20%;
         font-family: 'Kelly Slab', cursive;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 18px;
     }
     .enddate
     { 
         background: #21827c;
         padding: 5px;
         margin-left: 24%;
         margin-top: -2.8%;
         margin-bottom: 1.5%;
         color: white;
         width: 25%;
         font-family: 'Kelly Slab', cursive;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 15px;
     }
     .remainderdate
     { 
         background: #21827c;
         padding: 5px;
         margin-left: 52.5%;
         margin-top: -4.5%;
         margin-bottom: 1.5%;
         color: white;
         width: 25%;
         font-family: 'Kelly Slab', cursive;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 15px;
     }
     .wrapper 
     {
         background-color: #fff;
         width:60%;
         height: auto;
         position: absolute;
         margin: 5% 20%;
         border-radius: 10px;
         border-top: 7px solid #786a18;
         box-shadow: 0px 6px 15px 15px rgba(0, 0, 0, 0.4);
     }
     .rightSection1
     {
        float: right;
         font-family: 'Gugi', cursive;
        margin-top: -2.5%;
     }
     .leftSection
     {
        float: left;
        margin-top: -1.5%;
     }
    .btn1:hover, .btn4:hover
    {
        color: green;
	    cursor: pointer;
    }
    .btn1, .btn2
    { 
         font-family: 'Gugi', cursive;
         border: none;
    }
    .btn2:hover
    {
	    cursor: pointer;
    }
    .btn3:hover
    {
	    cursor: pointer;
    }
    .btn4
    {
        color: green;
        text-decoration: none;
    }
    .btn3
    {
       background-color: transparent;
       font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
       font-weight: bold;
       float: left;
       color: green;
       border: none;
       text-align: center;
       padding: 10px;
       margin-top: -6%;
       text-decoration: none;
       font-size: 18px;
       line-height: 25px;
       border-radius: 4px;
    }
.wrapper .head
{
	margin-bottom: 25px;
	background-color: #fff;
	border-bottom: 3px solid #786a18;
	border-radius: 10px;
	padding: 15px;
}

#btn
{
	text-decoration: none;
	background: transparent;
	border: none;
}
.btn1
{
   background-color: transparent;
   font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
   font-weight: bold;
   float: left;
   color: green;
   text-align: center;
   padding: 0px 10px;
   text-decoration: none;
   font-size: 18px;
   line-height: 25px;
   border-radius: 4px;
}
.btn2
{
   background-color: transparent;
   font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
   font-weight: bold;
   float: left;
   color: red;
   text-align: center;
   padding: 0px 10px;
   padding-left: 10px;
   text-decoration: none;
   font-size: 18px;
   line-height: 25px;
   border-radius: 4px;
}

.btn3
{
   background-color: transparent;
   font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
   font-weight: bold;
   float: left;
   color: green;
   text-align: center;
   padding-bottom: 10px;
   padding-left: 10px;
   text-decoration: none;
   font-size: 18px;
   line-height: 25px;
   border-radius: 4px;
}
 a.link {cursor:help;text-decoration:underline;}
    a.link.btn {border-color #d900ae;text-decoration none;}
    a.link:hover {background-color: #0085a6; color: #fff; text-decoration:none;}

[data-ml-modal] {
	position:fixed;
	top:0;
	bottom:0;
	left:0;
	right:0;
	overflow-x:hidden;
	overflow-y:auto;
	-webkit-overflow-scrolling:touch;
	z-index:999;
	width: 0%;
	height: 0%;
	opacity:0;
}
[data-ml-modal]:target {
	width:auto;
	height:auto;
	opacity:1;
	-webkit-transition:  opacity 1s ease;
	transition: opacity 1s ease;
	width: 100%;
	height: 100%;
}
[data-ml-modal]:target .modal-overlay {
	position:fixed;
	top:0;
	bottom:0;
	left:0;
	width: 100%;
	height: 100%;
	right:0;
	cursor:pointer;
	background-color:#000;
	background-color:rgba(0, 0, 0, 0.7);
	z-index:1;
}
[data-ml-modal] .modal-dialog {
	border-radius:6px;
	box-shadow:0 11px 15px -7px rgba(0, 0, 0, 0.2), 0 24px 38px 3px rgba(0, 0, 0, 0.14), 0 9px 46px 8px rgba(0, 0, 0, 0.12);
	position:relative;
	width: 90%;
	height: auto;
	max-width:660px;
	max-height:70%;
	margin:10% auto;
	overflow-x:hidden;
	overflow-y:auto;
	z-index:2;
}
.date1
    { 
         background: #21827c;
         padding: 5px;
         margin-left: 49%;
         color: white;
         font-family: 'Kelly Slab', cursive;
         width: 48%;
         margin-top: -2%;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 14px;
     }
     .notename
     {
          color: black;
          font-size: 15px;
          font-weight: bold;
          text-decoration: none;
          margin-left: 3%;
          margin-top: -6.5%;
     }
     .date2
    { 
         background: #474317;
         padding: 5px;
         color: white;
         font-family: 'Kelly Slab', cursive;
         width: auto%;
         margin-top: -2%;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 14px;
     }
     .notename2
     {
          color: black;
          font-size: 15px;
          font-weight: bold;
          text-decoration: none;
          margin-left: 3%;
          text-align: left;
          padding-top: 10px;
          margin-top: -6.5%;
     }
   .remainder
   {
       background-color: #fff;
       width: 100%;
       height: 10%;
       display: block;
       padding: 15px;
       border-radius: 10px;
       box-shadow: 0px 3px 7px 4px rgba(0, 0, 0, 0.4);
   }
   .remainder1
   {
       background-color: #fff;
       width: 100%;
       height: auto%;
       display: block;
       padding: 15px;
       border-radius: 10px;
       box-shadow: 0px 3px 7px 4px rgba(0, 0, 0, 0.4);
   }
[data-ml-modal] .modal-dialog1 {
	border-radius:6px;
	box-shadow:0 11px 15px -7px rgba(0, 0, 0, 0.2), 0 24px 38px 3px rgba(0, 0, 0, 0.14), 0 9px 46px 8px rgba(0, 0, 0, 0.12);
	position:relative;
	width: 30%;
	height: auto;
	max-width:660px;
	max-height:70%;
	left: 35%;
	top: -11%;
	margin:10% auto;
	overflow-x:hidden;
	overflow-y:auto;
	z-index:2;
}
[data-ml-modal] .modal-dialog1 > h3 {
	background-color:#7fdbc6;
	border-bottom:1px solid #b3b3b3;
	font-size:24px;
	font-weight: 400;
	margin:0;
	padding:0.8em 56px .8em 27px; 
}
.modal-dialog-lg {width: 100%; height: 100%; max-width:820px !important;}

[data-ml-modal] .modal-dialog > h3 {
	background-color: #f5e690;
	border-bottom:1px solid #b3b3b3;
	font-size:24px;
	font-weight: 400;
	margin:0;
	padding:0.8em 56px .8em 27px; 
}
[data-ml-modal] .modal-content {background: #fff; height: auto; width: auto; padding:23px 27px;}
[data-ml-modal] .modal-close {
  	position: absolute;
	top:13px;
	right:13px;
	color: red;
	background: transparent;
	border-radius:50%;
	height:40px;
	width:40px;
	font-size:30px;
	line-height:37px;
	text-align:center;
	-webkit-transition: all .3s ease-in-out;
    transition: all .3s ease-in-out;
}
[data-ml-modal] .modal-close:hover {background-color:red; color:#fff; cursor:pointer;}
[data-ml-modal] p:first-child, [data-ml-modal] p:last-child {margin:0;}
@media (max-width:767px) {
	[data-ml-modal] .modal-dialog {width: auto; height: auto; margin:20% auto;}
}

a
{
  color:#0085a6;
  text-decoration: none;
  outline: 0;
  -webkit-transition  all .3s ease-in-out;
  -moz-transition  all .3s ease-in-out;
  -o-transition  all .3s ease-in-out;
  transition all .3s ease-in-out;
}
a:hover {
  color:#0085a6;
  text-decoration: none;
}
.center {text-align:center !important;}
.btn 
{
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    text-decoration: none;
    color: red;
    font-weight: bold;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 2px solid transparent;
    white-space: normal;
    padding: 3px 14px;
    font-size: 18px;
    border-radius: 10px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

.btn:hover {background-color: red; color: white;}
.btn-default {border-color: red; text-decoration: none; margin-top: 25px; padding: 5px 20px;}
a .btn-default:hover {background-color: red; color:white; text-decoration: none;}
pre {overflow:auto;font-size:1em;}

</style>
</head>
<body>
<nav>
   <a class="links logo" href="#"><i class="fas fa-bell"></i> Notifier</a>
   <div class="rightSection">
   <form action="logoutServlet" method="get">
  <button class="selected"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</button></form></div>
   <div class="rightSection">
   <button class="selected" onclick="window.location='notes.jsp'"><i class="fas fa-sticky-note"></i> Notes</button>
  <button class="selected" onclick="window.location='dashboard.jsp'"><i class="fas fa-home"></i> Dashboard</button>
             <span id="group"> 
                 <button type="button" class="selected1"><a class="modalBtn" href="#modalRemainder">
                  <i style="color:#ffffff" class="fa fa-bell"></i> 
                 </button> 
                 <span class="badge" id="badge"> 
                 <%
                  Connection con4 = null;
                  PreparedStatement ps4 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con4 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes where remainderdate='"+java.time.LocalDate.now()+"'";
                      ps4 = con4.prepareStatement(sql);
                      ResultSet rs4 = ps4.executeQuery(); 
                      rs4.last();
                  %>
                  <%=rs4.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
                 </span> 
               </span>
  </div>
  </nav>

<div class="result-box custom-box">
		<h1>Search Result</h1>
                 <%
                  Connection con = null;
                  PreparedStatement ps = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      String text = (String)request.getAttribute("searchingText");
                      con = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      ps = con.prepareStatement("SELECT * FROM notes WHERE notename='"+text+"' OR notename LIKE ? OR notename LIKE ? OR notename LIKE ?");
                      ps.setString(1, "%" + text + "%");
                      ps.setString(2, text + "%");
                      ps.setString(3, "%" + text);
                      ResultSet rs = ps.executeQuery(); 
                      while(rs.next())
                      {
                  %>
          <table>        
			<tr>
				<td style="background-color:#ffffff" style="font-family: verdana"><b><font color="maroon">Notes Name : </font></b></td>
				<td style="background-color:#ffffff"><span><%=rs.getString("notename")%></span></td>
			</tr>
			<tr>
				<td style="background-color:#ffffff"><b><font color="maroon">NoteBook Name : </font></b></td>
				<td style="background-color:#ffffff"><span><%=rs.getString("notebookname")%></span></td>
			</tr>
			<tr>
				<td style="background-color:#ffffff"><b><font color="maroon">Notes Status : </font></b></td>
				<td style="background-color:#ffffff"><span><%=rs.getString("status")%></span></td>
			</tr>
			<tr>
				<td style="background-color:#ffffff"><b><font color="maroon">Notes StartDate : </font></b></td>
				<td style="background-color:#ffffff"><span><%=rs.getString("startdate")%></span></td>
			</tr>
			<tr>
				<td style="background-color:#ffffff"><b><font color="maroon">Notes EndDate : </font></b></td>
				<td style="background-color:#ffffff"><span><%=rs.getString("enddate")%></span></td>
			</tr>
			</table>
                  <%
                      }
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
                  
		</div> 
		
		
<div data-ml-modal id="modalRemainder">
	<a href="#!" class="modal-overlay"></a>
	<div class="modal-dialog1 modal-dialog-lg">
		<a href="#!" class="modal-close">&times;</a>
		<h3 style="font-family:Georgia"><font color="maroon"><b><center>Today's Remainder</center></b></font></h3>
		<div class="modal-content">		
         <div class="form-conteniar">
                <%
                  Connection con5 = null;
                  PreparedStatement ps5 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con5 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes where remainderdate='"+java.time.LocalDate.now()+"'";
                      ps5 = con5.prepareStatement(sql);
                      ResultSet rs5 = ps5.executeQuery(); 
                      if(!rs5.isBeforeFirst())
                      {
                      %>
                        <div class="vertical-center1">
                      	<h4><center>No Task Available for Today !!!</center></h4>
                      	</div>
                      <%
                      }
                      while(rs5.next())
                      {
                  %>
                   <div class="remainder">
                      <div class="date1" id="datebtn">End Date: <b><%=rs5.getString("enddate")%></b></div>
                      <div class="notename" id="notename"><font color="maroon">Notes : </font><b><%=rs5.getString("notename")%></b></div>
                   </div> 
                   <br/> 
                  <%
                      }
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>              
         </div>
		</div>		
	</div>
</div>
</body>
</html>