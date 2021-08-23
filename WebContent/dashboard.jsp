<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="databaseConnection.DatabaseConnector" %>
<%@ page import="Notebook.*" %>
<%@ page import="Note.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="css/dashboardStyling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&family=Julee&display=swap" rel="stylesheet">
  <style>
  .icons
  {
      top: 70%;
      left: 0;
      transform: translateY(-50%);
      position: absolute;
      z-index: 100;
  }
  .icons ul
  {
      padding: initial;
  }
  .icons ul li
  {
      height: 40px;
      width: 40px;
      list-style-type: none;
      padding: 10px;
      border-radius: 5px;
      margin-top: 5px;
      color: #ffff;
  }
  .facebook
  {
      background: #3b5998;
  }
  .hackerrank
  {
      background: green;
  }
  .linkedin
  {
      background: #007bb5;
  }
  .twitter
  {
      background: #55acee;
  }
  .instagram
  {
      background: #ff4800;
  }
  .envelope
  {
      background: red;
  }
  .icons ul li:hover
  {
      margin-right: 30px;
      width: 80px;
      padding: 10px;
      transition: 1s;
      text-align: center;
      border-radius: 10px;
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
   .date
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
     nav .links:hover
     {
         color: white;
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
   .badge 
   { 
        position: absolute; 
        color: white;
        top: 4px;
        text-decoration: none;
        left: 89.5%; 
        background-color: red;
        padding: 3px 3px 3px 3px;
        border-radius: 50%; 
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
    .sidecontainer header
    {
        font-size: 25px;
        color: white;
        font-weight: bold;
        line-height: 80px;
        text-align: center;
        background: #063146;
        border-radius: 10px;
        user-select: none;
     }
     nav .selected:hover
     {
	     background-color: #45a2a8;
	     cursor: pointer;
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
.modal-dialog-lg {width: 100%; height: 100%; max-width:820px !important;}

[data-ml-modal] .modal-dialog > h3 {
	background-color:#7fdbc6;
	border-bottom:1px solid #b3b3b3;
	font-size:24px;
	font-weight: 400;
	margin:0;
	padding:0.8em 56px .8em 27px; 
}
[data-ml-modal] .modal-content {background:#fff; height: auto; width: auto; padding:23px 27px;}
[data-ml-modal] .modal-close {
  	position:absolute;
	top:13px;
	right:13px;
	color: red;
	background-color: transparent;
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

.input-name{
    width: 90%;
    position: relative;
    margin: 20px auto;
}
.lock{
    padding:8px 11px;
}
.name{
    width: 45%;
    padding:8px 0 8px 40px;
}
.input-name span{
    margin-left: 35px;
}
.text-name{
    width: 100%;
    padding:8px 0 8px 40px;
}
.input-name i{
    position: absolute;
    font-size: 18px;
    border-right: 1px solid #cccccc;
}
.email{
    padding: 8px;
}
.mobile{
    padding: 8px 11px;
}
.text-name, .name{
    border: 1px solid #cccccc;
    outline: none;
    border-radius: 10px;
    -webkit-transition: all 0.30s ease-in-out;
      -moz-transition: all 0.30s ease-in-out;
      -ms-transition: all 0.30s ease-in-out;
      transition: all 0.30s ease-in-out;
}
.text-name:hover, .name:hover{
    background-color: #fafafa;
}
.text-name:focus, .name:focus{
    -webkit-box-shadow: 0 0 2px 1px rgba(255, 169, 0, 0.5);
      -moz-box-shadow: 0 0 2px 1px rgba(255, 169, 0, 0.5);
      box-shadow: 0 0 2px 1px rgba(255, 169, 0, 0.5);
      border: 1px solid #f5ba1a;
      background: #fafafa;
}
a
{
	text-decoration: none;
	color: navy;
}
@-webkit-keyframes check 
{
    0% { height: 0; width: 0; }
    25% { height: 0; width: 7px; }
    50% { height: 20px; width: 7px; }
  } 
  @keyframes check {
    0% { height: 0; width: 0; }
    25% { height: 0; width: 7px; }
    50% { height: 20px; width: 7px; }
  }
  .button
  {
    background: #176359;
    height: 35px;
    line-height: 35px;
    width: 50%;
    border-radius: 15px;
    text-align: center;  
    border: none;
    outline: none;
    cursor: pointer;
    color: #fff;
    font-size: 18px;
    margin-bottom: 10px;   
  }
  .space1
  {
      margin-top: 11%;
  }
  .space2
  {
      margin-bottom: 20%;
  }
  .button:hover
  {
      background-color: #11522b;
  }
  @media (max-width: 480px) {
      .wrapper{
          width: 100%;
      }
      .input-name{
          margin-bottom: -10px;
      }
      .name{
          width: 100%;
          padding:8px 0 8px 40px;
          margin-bottom: 10px;
      }
      .input-name span{
          padding: 0;
          margin:0;
      }
  }
  .modalBtn,
  .modalBtn:hover
  {
      text-decoration: none;
      color: white;
  }
     .overall
    {
	    padding: 20px;
	    font-size: 20px;
	    text-decoration: underline;
    }
    .overall:hover
    {
        cursor: pointer;
    }
    .maintext
    {
        width: 90%;
        background-color: #DADCE3;
        height: auto%;
        padding: 10px;
        display: none;
        margin: 16px;
        margin-bottom: 32px;
        font-size: 18px;
        border-radius: 10px;
        box-shadow: 0px 3px 7px 4px rgba(0, 0, 0, 0.4);
    }
    .sidecontainer
{
	background: #e8e0ca;
	position: absolute;
	width: 24%;
	right: 0;
	border-radius: 10px;
	border:3px solid #99917c;
	box-shadow: 3px 3px 8px 6px grey;
	border-style: grove;
	height: auto;
	margin: 20px;
}
.sideanimation
{
	background: #e8e0ca;
	position: absolute;
	width: 24%;
	left: 6%;
	border-radius: 10px;
	border:3px solid #99917c;
	box-shadow: 3px 3px 8px 6px grey;
	border-style: grove;
	height: auto;
	margin: 20px;
}
.sideanimation1
{
	background: #fff;
	position: absolute;
	width: 24%;
	left: 39.5%;
	top: 45%;
	border-radius: 10px;
	border:3px solid #99917c;
	box-shadow: 3px 3px 8px 6px grey;
	border-style: grove;
	height: auto;
	margin: 20px;
}
.sideanimation .animation
{
    width: 90%;
    height: auto%;
    text-align: center;
    padding: 15px;
}
.subremainder
{
    line-height: 25px;
    text-align: center;
    margin-left: 10%;
    font-size: 18px;
}

.clockdate-wrapper 
{
    background-color: #333;
    padding:25px;
    max-width:455px;
    width:100%;
    position: absolute;
    left: 35%;
    top: 17%;
    text-align:center;
    border-radius: 15px;
    margin:0 auto;
  
}
#clock{
    background-color:#333;
    font-family: sans-serif;
    font-size:60px;
    text-shadow:0px 0px 1px #fff;
    color:#fff;
}
#clock span {
    color:#888;
    text-shadow:0px 0px 1px #333;
    font-size:50px;
    position:relative;
    top:-5px;
    left:10px;
}
#date {
    letter-spacing:3px;
    font-size:14px;
    font-family:arial,sans-serif;
    color:#fff;
}
    </style>
</head>
 <body onload="startTime()">
    <input type="checkbox" id="check"/>
    <label for="check">
      <i class="fa fa-bars" id="btn"></i>
      <i class="fa fa-times" id="cancel"></i>
    </label>
    <nav>
   <a class="links logo" href="#"> Notifier</a>
   <div class="rightSection">
   <form action="logoutServlet" method="get">
  <button class="selected"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</button></form></div>
   <div class="rightSection">
   <button class="selected" onclick="window.location='notebook.jsp'"><i class="fa fa-book"></i> NoteBooks</button>
   <button class="selected" onclick="window.location='notes.jsp'"><i class="fa fa-sticky-note"></i> Notes</button>
   <button class="selected" onclick="window.location='editProfile.jsp'"><i class="fa fa-user"></i> Profile</button>
               <span id="group"> 
                 <button type="button" class="selected1"><a class="modalBtn" href="#modalRemainder">  
                  <i class="fa fa-bell"></i> 
                 </button> 
                 <span class="badge" id="badge"> 
                 <%
                  Connection con = null;
                  PreparedStatement ps = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes where remainderdate='"+java.time.LocalDate.now()+"'";
                      ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery(); 
                      rs.last();
                  %>
                  <%=rs.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
                 </span> 
               </span></div>
   </nav>
   <div data-ml-modal id="modalRemainder">
	<a href="#!" class="modal-overlay"></a>
	<div class="modal-dialog modal-dialog-lg">
		<a href="#!" class="modal-close">&times;</a>
		<h3 style="font-family:Georgia"><font color="maroon"><b><center>Today's Remainder</center></b></font></h3>
		<div class="modal-content">
		<div class="wrapper1">
         <div class="form-conteniar">
                <%
                  Connection con1 = null;
                  PreparedStatement ps1 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con1 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes where remainderdate='"+java.time.LocalDate.now()+"'";
                      ps1 = con1.prepareStatement(sql);
                      ResultSet rs1 = ps1.executeQuery(); 
                      if(!rs1.isBeforeFirst())
                      {
                      %>
                        <div class="vertical-center1">
                      	<h4><center>No Task Available for Today !!!</center></h4>
                      	</div>
                      <%
                      }
                      while(rs1.next())
                      {
                  %>
                   <div class="remainder">
                      <div class="date" id="datebtn">End Date: <b><%=rs1.getString("enddate")%></b></div>
                      <div class="notename" id="notename"><font color="maroon">Notes : </font><b><%=rs1.getString("notename")%></b></div>
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
</div>

  <div id="clockdate">
  <div class="clockdate-wrapper" style="width: 40%;">
    <b style="color: white; font-weight: bolder; font-size: 28px; margin-bottom: 15px;">Welcome to Notifier</b><br>
    <b style="color: #59dedc; font-weight: bolder; font-size: 20px; margin-bottom: 15px;">- Your personal Task companion</b><br><br>
    <b style="color: #dec50b; font-weight: bolder; font-size: 25px;">Author - [ Gowthamraj K ]</b>
  </div>
  </div>

	<div class="sideanimation">
    <div class="animation">
    <img src="img/notification.gif" width="268" height="=300">
    <center><div class="subremainder" id="subremainder" style="font-family:'Akaya Telivigala'"><b><center>You have
    <font color="red" size="18px"><%
                  Connection con0 = null;
                  PreparedStatement ps0 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con0 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes where remainderdate='"+java.time.LocalDate.now()+"'";
                      ps0 = con0.prepareStatement(sql);
                      ResultSet rs0 = ps0.executeQuery(); 
                      rs0.last();
                  %>
                  <%=rs0.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %></font>
    Number of Tasks to be done for the Day. Check it's details in the notification pop-up on Top Menu Bar. To know more, please click the right side pane heading and view the details</center></b></div></center>
    </div>
    </div>
    
    <div class="sideanimation1">
    <div class="animation">
    <br><center><img src="img/expired.gif" width="158" height="=100"></center><br>
    <center><div class="subremainder" id="subremainder" style="font-family:'Akaya Telivigala'"><b><center>Expired Notes : 
    <font color="red" size="18px"><%
                  Connection con20 = null;
                  PreparedStatement ps20 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con20 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes where enddate<'"+java.time.LocalDate.now()+"'";
                      ps20 = con20.prepareStatement(sql);
                      ResultSet rs20 = ps20.executeQuery(); 
                      rs20.last();
                  %>
                  <%=rs20.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %></font>
    </center></b></div></center>
    <br>
    <center><div class="subremainder" id="subremainder" style="font-family:'Akaya Telivigala'"><b><center>Notes with Today as end date: 
    <font color="red" size="18px"><%
                  Connection con21 = null;
                  PreparedStatement ps21 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con21 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes where enddate='"+java.time.LocalDate.now()+"'";
                      ps21 = con21.prepareStatement(sql);
                      ResultSet rs21 = ps21.executeQuery(); 
                      rs21.last();
                  %>
                  <%=rs21.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %></font>
    </center></b></div></center><br>
    </div>
    </div>
	
   <div class="sidecontainer">
   <header>Hello, ${name}</header>
    <div class="overall" id="overall" style="font-family:'Courier New'"><b><center>Click Here to see your overall Notifier Contents</center></b></div>
    <div class="maintext" id="maintext" style="font-family:'Akaya Telivigala'"><center><b><font color="maroon">Number of NoteBooks :</font> 
                <%
                  Connection con2 = null;
                  PreparedStatement ps2 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con2 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notebook";
                      ps2 = con2.prepareStatement(sql);
                      ResultSet rs2 = ps2.executeQuery(); 
                      rs2.last();
                  %>
                  <%=rs2.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
    <br/><br/><font color="maroon"> Number of Notes : </font>
                 <%
                  Connection con3 = null;
                  PreparedStatement ps3 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con3 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes";
                      ps3 = con3.prepareStatement(sql);
                      ResultSet rs3 = ps3.executeQuery(); 
                      rs3.last();
                  %>
                  <%=rs3.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
    </b></center></div>      
    <div class="maintext" id="maintext1" style="font-family:'Julee'"><center><b><font color="maroon">Started NoteBooks : </font>
                 <%
                  Connection con4 = null;
                  PreparedStatement ps4 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con4 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notebook WHERE status IN ('Started','started','STARTED')";
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
    <br/><br/><font color="maroon">Not Started NoteBooks : </font>
                 <%
                  Connection con5 = null;
                  PreparedStatement ps5 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con5 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notebook WHERE status IN ('Not Started','not started','NOT STARTED')";
                      ps5 = con5.prepareStatement(sql);
                      ResultSet rs5 = ps5.executeQuery(); 
                      rs5.last();
                  %>
                  <%=rs5.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
                  <br/><br/><font color="maroon">Holded NoteBooks : </font>
                  <%
                  Connection con6 = null;
                  PreparedStatement ps6 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con6 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notebook WHERE status IN ('hold on','Hold On','HOLD ON')";
                      ps6 = con6.prepareStatement(sql);
                      ResultSet rs6 = ps6.executeQuery(); 
                      rs6.last();
                  %>
                  <%=rs6.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
                  </b></center></div>
    <div class="maintext" id="maintext2" style="font-family:'Julee'"><center><b><font color="maroon">Started Notes : </font>
                 <%
                  Connection con7 = null;
                  PreparedStatement ps7 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con7 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes WHERE status IN ('Started','started','STARTED')";
                      ps7 = con7.prepareStatement(sql);
                      ResultSet rs7 = ps7.executeQuery(); 
                      rs7.last();
                  %>
                  <%=rs7.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
    <br/><br/><font color="maroon">Not Started Notes : </font>
                <%
                  Connection con8 = null;
                  PreparedStatement ps8 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con8 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes WHERE status IN ('Not Started','not started','NOT STARTED')";
                      ps8 = con8.prepareStatement(sql);
                      ResultSet rs8 = ps8.executeQuery(); 
                      rs8.last();
                  %>
                  <%=rs8.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
    <br/><br/><font color="maroon">Holded Notes : </font>
                <%
                  Connection con9 = null;
                  PreparedStatement ps9 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con9 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes WHERE status IN ('hold on','Hold On','HOLD ON')";
                      ps9 = con9.prepareStatement(sql);
                      ResultSet rs9 = ps9.executeQuery(); 
                      rs9.last();
                  %>
                  <%=rs9.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
    </b></center></div>
    <div class="maintext" id="maintext3" style="font-family:'Julee'"><center><b><font color="maroon">Not Completed Notes : </font>
                 <%
                  Connection con10 = null;
                  PreparedStatement ps10 = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con10 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT * FROM notes WHERE enddate>='"+java.time.LocalDate.now()+"'";
                      ps10 = con10.prepareStatement(sql);
                      ResultSet rs10 = ps10.executeQuery(); 
                      rs10.last();
                  %>
                  <%=rs10.getRow() %>
                  <%
                   }
                   catch(Exception e)
                   { 
                       out.println(e);
                   }
                  %>
    </b></center></div>
    </div>
    <div class="icons">
    <ul>
    <a href="https://www.facebook.com/profile.php?id=100017471417983"><li class="facebook"><i class="fa fa-facebook"></i></li></a>
    <a href="https://www.instagram.com/gow_t_h_a_m_r_a_j/"><li class="instagram"><i class="fa fa-instagram"></i></li></a>
    <a href="https://twitter.com/Gowtham29341737"><li class="twitter"><i class="fa fa-twitter"></i></li></a>
    <a href="https://www.hackerrank.com/gowthamraj692"><li class="hackerrank"><i class="fab fa-hackerrank"></i></li></a>
    <a href="https://www.linkedin.com/in/gowtham-kittusamy-54b835174/"><li class="linkedin"><i class="fa fa-linkedin"></i></li></a>
    <a href="mailTo: gowthamraj692@gmail.com"><li class="envelope"><i class="fa fa-envelope"></i></li></a>
    </ul>
    </div>
    <div class="sidebar">
      <header>Welcome, ${name}</header>
      <ul>
        <li>
          <a href="dashboard.jsp"><i class="fa fa-home"></i>Dashboard</a>
        </li>
        <li>
          <a href="notebook.jsp"><i class="fa fa-book"></i>Notebooks</a>
        </li>
        <li>
          <a href="notes.jsp"><i class="fa fa-sticky-note"></i>Notes</a>
        </li>
        <li>
          <a href="editProfile.jsp"><i class="fa fa-user"></i>Edit Profile</a>
        </li>
      </ul>
    </div>

    <section></section>
    <script>
    $("#overall").click(function(){
    	$("#maintext").slideToggle(1000);
    	$("#maintext1").slideToggle(1000);
    	$("#maintext2").slideToggle(1000);
    	$("#maintext3").slideToggle(1000);
    });
    function startTime() {
        var today = new Date();
        var hr = today.getHours();
        var min = today.getMinutes();
        var sec = today.getSeconds();
        ap = (hr < 12) ? "<span>AM</span>" : "<span>PM</span>";
        hr = (hr == 0) ? 12 : hr;
        hr = (hr > 12) ? hr - 12 : hr;
        hr = checkTime(hr);
        min = checkTime(min);
        sec = checkTime(sec);
        document.getElementById("clock").innerHTML = hr + ":" + min + ":" + sec + " " + ap;
        
        var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        var curWeekDay = days[today.getDay()];
        var curDay = today.getDate();
        var curMonth = months[today.getMonth()];
        var curYear = today.getFullYear();
        var date = curWeekDay+", "+curDay+" "+curMonth+" "+curYear;
        document.getElementById("date").innerHTML = date;
        
        var time = setTimeout(function(){ startTime() }, 500);
    }
    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
    </script>
      </body>
</html>