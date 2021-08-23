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
    <title>Notebooks</title>
    <link href="css/notebookStyling.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <style>
   @import url('https://fonts.googleapis.com/css2?family=Gugi&family=Kelly+Slab&family=Pirata+One&family=Reggae+One&display=swap');
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
   .space3
   {
       margin-top: -1%;
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
   nav .links:hover
   {
       color: white;
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
         margin-left: 18%;
         margin-top: -2.5%;
         font-family: 'Kelly Slab', cursive;
         color: white;
         width: 14%;
         border-radius: 15px;
         text-align: center;
         text-decoration: none;
         font-weigth: bold;
         font-size: 15px;
     }
     .date
     { 
         background: #21827c;
         padding: 5px;
         margin-left: 36%;
         margin-top: -3.8%;
         color: white;
         font-family: 'Kelly Slab', cursive;
         width: 25%;
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
        margin-top: -2.5%;
     }
     .count1, .count1:hover
     {
         color: black;
         font-weight: bold;
         text-decoration: none;
         cursor: none;
     }
     .count
     {
         margin-top: -0.9%;
         margin-left: 20%;
         color: black;
         font-weight: bold;
         text-decoration: none;
         cursor: none;
         font-size: 15px;
     }
     .count:hover
     { 
         text-decoration: none;
         cursor: none;
         color: black;
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
    .btn1, .btn2, .btn3, .btn4
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
    .wrapper .head
    {
	    margin-bottom: 25px;
	    background-color: #fff;
	    border-bottom: 3px solid #786a18;
	    border-radius: 10px;
	    padding: 15px;
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
.modal-dialog-lg {width: 100%; height: 100%; max-width:820px !important;}

[data-ml-modal] .modal-dialog > h3 {
	background-color:#f5e690;
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
    </style>
</head>
<body>
<input type="checkbox" id="check"/>
    <label for="check">
      <i class="fa fa-bars" id="btn"></i>
      <i class="fa fa-times" id="cancel"></i>
    </label>
 <nav>
   <a class="links logo"> Notifier&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNotebooks</a>
   <div class="rightSection">
   <form action="logoutServlet" method="get">
  <button class="selected"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</button></form></div>
   <div class="rightSection">
   <button class="selected" id="modal-btn"><a class="modalBtn" href="#modal-11"><i class="fa fa-plus"></i> New Notebook</a></button>
  <button class="selected" onclick="window.location='dashboard.jsp'"><i class="fa fa-home"></i> Dashboard</button>
              <span id="group"> 
                 <button type="button" class="selected1"><a class="modalBtn" href="#modalRemainder">
                  <i class="fa fa-bell"></i> 
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
  <div class="sidebar">
      <header>Welcome, ${name}</header>
      <ul>
        <li>
          <a href="dashboard.jsp"><i class="fa fa-home"></i> Dashboard</a>
        </li>
        <li>
          <a href="notebook.jsp"><i class="fa fa-book"></i> Notebooks</a>
        </li>
        <li>
          <a href="notes.jsp"><i class="fa fa-sticky-note"></i> Notes</a>
        </li>
        <li>
          <a href="editProfile.jsp"><i class="fa fa-user"></i> Edit Profile</a>
        </li>
      </ul>
    </div>
    <div class="space3"></div>
  <%
   try 
   {
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
    String query = "select * from notebook";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(query);
    if(!rs.isBeforeFirst())
    {
    %>
        <div class="vertical-center">
    	<h1><center>No Notebooks Avaliable currently !!! <br/>Please create a new NoteBook</center></h1>
    	</div>
    <%
    }
    while(rs.next())
    {
    	String notebookName= rs.getString("name");
    	String id=rs.getString("id");
    	System.out.println(notebookName);
    	request.setAttribute("id",id);
    	request.setAttribute("noteBookName",notebookName);
   %>
   <div data-ml-modal id="modal-12">
	<a href="#!" class="modal-overlay"></a>
	<div class="modal-dialog modal-dialog-lg">
		<a href="#!" class="modal-close">&times;</a>
		<h3 style="font-family:Georgia"><font color="maroon"><b>Edit Notebook</b></font></h3>
		<div class="modal-content">
		<div class="wrapper1"><br/>
        <h2 style="font-family:monospace"><center>Edit Your NoteBooks Here</center></h1>
         <div class="form-conteniar">
            <form action="editNoteBookServlet" method="post" autocomplete="off" name="register-form" id="register-form">
                 <div class="input-name">
                    <i class="fa fa-book lock"></i>
                    <%
                  Connection con = null;
                  PreparedStatement ps = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT name FROM notebook";
                      ps = con.prepareStatement(sql);
                      ResultSet rs1 = ps.executeQuery(); 
                 %>
                 <select type="text" placeholder=" old notebook name" id="notebookname1" name="oldnotebookname" class="text-name" required>
                 <%
                   while(rs1.next())
                   {
                       String notebookname = rs1.getString("name"); 
                  %>
                  <option value="<%=notebookname %>"><%=notebookname %></option>
                  <%
                    }
                  %>
                  </select>
                  <font size="1px" color="gray">Please select a notebook for which the details had to be updated</font>
                  <%
                   }
                  catch(Exception e)
                  { 
                      out.println(e);
                  }
                  %>
                </div>
               <div class="input-name">
                    <i class="fa fa-book lock"></i>
                    <input type="text" placeholder=" updated name" id="updatedname" name="updatedname" style="text-transform:uppercase"  class="text-name" required>
                </div>
                <div class="input-name">
                        <i class="fa fa-volume-up mobile"></i>
                        <select type="text" placeholder=" choose an option" id="status" name="status" required class="text-name">
                        <option>Started</option>
                        <option>Not Started</option>
                        <option>Hold On</option></select>
                        <span id="checkMobile"></span>
                </div>
                <div class="input-name">
                        <i class="fa fa-calendar email"></i>
                        <input type="date" placeholder="notebook started date" id="startDate1" name="date" required class="text-name">
                        <font size="1px" color="gray">Start Date (by default it's Today's Date. You can also edit the date to start later)</font>
                </div>
                <div class="input-name">
                        <center><input style="font-family:monospace" class="button" type="submit" value="Edit Notebook" /></center>
                </div>
              </form>
         </div>
     </div>
		<br/><hr>
			<p class="center"><a href="#" class="btn btn-default">Close</a></p>
		</div>
		
	</div>
</div>

  <div class="wrapper">  
  <div class="head"> 
   <div class="text"><b><font color="maroon">${noteBookName}</font></b></div>
  <div class="status" id="statusbtn"><b><%=rs.getString("status")%></b></div>
  <div class="date" id="datebtn">Started Date: <b><%=rs.getString("date")%></b></div>
  <form action="deleteNoteBook" method="post">
  <div class="rightSection1">
  <button type="submit" class="btn2" name="delete" value="<%=rs.getString("name")%>" id="deletebtn"><i class="fa fa-trash" aria-hidden="true"></i> delete</button>
  </div></form>
  <div class="rightSection1">
   <button type="submit" class="btn1" name="edit" value="<%=rs.getString("name")%>" id="editbtn"><a class="btn1" href="#modal-12"><i class="fa fa-edit"></i> edit</a></button>
  </div>
  </div>
  <div class="leftSection">
   <button class="btn3" id="btn"><a class="btn4" href="#modal-13"><i class="fa fa-plus"></i> Add Notes</button></div>
   <div class="count"><a class="count1" href="#"> Sub-Notes : 
   <%
   Connection con2 = null;
   PreparedStatement ps2 = null;
   try
   {
	   Class.forName("com.mysql.cj.jdbc.Driver");
       con2 = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
       String sql = "SELECT * FROM notes where notebookname='"+notebookName+"'";
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
   %></a>
   </div>
  </div>
  <br/>
  <div class="space1"></div>
  
  <%
    }
   }
  catch(Exception e){}
%>
 <div class="space2"></div>
<div data-ml-modal id="modal-11">
	<a href="#!" class="modal-overlay"></a>
	<div class="modal-dialog modal-dialog-lg">
		<a href="#!" class="modal-close">&times;</a>
		<h3 style="font-family:Georgia"><font color="maroon"><b>New Notebook</b></font></h3>
		<div class="modal-content">
		<div class="wrapper1"><br/>
        <h2 style="font-family:monospace"><center>Add new NoteBooks Here</center></h1>
         <div class="form-conteniar">
            <form action="noteBookServlet" method="post" autocomplete="off" name="register-form" id="register-form">
                <div class="input-name">
                    <i class="fa fa-book lock"></i>
                    <input type="text" placeholder=" notebook name" id="notebookname" name="notebookname" style="text-transform:uppercase"  class="text-name" required>
                </div>
                <div class="input-name">
                        <i class="fa fa-volume-up mobile"></i>
                        <select type="text" placeholder=" choose an option" id="status" name="status" required class="text-name">
                        <option>Started</option>
                        <option>Not Started</option>
                        <option>Hold On</option></select>
                        <span id="checkMobile"></span>
                </div>
                <div class="input-name">
                        <i class="fa fa-calendar email"></i>
                        <input type="date" placeholder="notebook started date" id="startDate2" name="date" required class="text-name" >
                        <font size="1px" color="gray">Start Date (by default it's Today's Date. You can also edit the date to start later)</font>
                </div>
                <div class="input-name">
                        <center><input style="font-family:monospace" class="button" type="submit" value="Add NoteBook" /></center>
                </div>
              </form>
         </div>
     </div>
		<br/><hr>
			<p class="center"><a href="#" class="btn btn-default">Close</a></p>
		</div>
		
	</div>
</div>
 <div class="space2"></div>
<div data-ml-modal id="modal-13">
	<a href="#!" class="modal-overlay"></a>
	<div class="modal-dialog modal-dialog-lg">
		<a href="#!" class="modal-close">&times;</a>
		<h3 style="font-family:Georgia"><font color="maroon"><b>New Note</b></font></h3>
		<div class="modal-content">
		<div class="wrapper1"><br/>
        <h2 style="font-family:monospace"><center>Add new Notes Here</center></h1>
         <div class="form-conteniar">
            <form action="noteServlet" method="post" autocomplete="off" name="register-form" id="register-form">
                <div class="input-name">
                    <i class="fa fa-sticky-note lock"></i>
                    <input type="text" placeholder=" note name" id="notename" name="notename" style="text-transform:uppercase"  class="text-name" required>
                </div>
                <div class="input-name">
                    <i class="fa fa-book lock"></i>
                    <%
                  Connection con = null;
                  PreparedStatement ps = null;
                  try
                  {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      con = DriverManager.getConnection(DatabaseConnector.DBUrl, DatabaseConnector.username, DatabaseConnector.password);
                      String sql = "SELECT name FROM notebook";
                      ps = con.prepareStatement(sql);
                      ResultSet rs = ps.executeQuery(); 
                 %>
                 <select type="text" placeholder=" choose an option" id="notebookname" name="notebookname" required class="text-name">
                 <%
                   while(rs.next())
                   {
                       String notebookname = rs.getString("name"); 
                  %>
                  <option value="<%=notebookname %>"><%=notebookname %></option>
                  <%
                    }
                  %>
                  </select>
                  <font size="1px" color="gray">Please select a notebook in which the notes are to be created</font>
                  <%
                   }
                  catch(Exception e)
                  { 
                      out.println(e);
                  }
                  %>
                    </div>
                <div class="input-name">
                        <i class="fa fa-volume-up mobile"></i>
                        <select type="text" placeholder=" choose an option" id="status" name="status" required class="text-name">
                        <option>Started</option>
                        <option>Not Started</option>
                        <option>Hold On</option></select>
                        <span id="checkMobile"></span>
                </div>
                <div class="input-name">
                        <i class="fa fa-calendar email"></i>
                        <input type="date" placeholder=" start date" id="startDate3" name="startdate" required class="text-name" >
                        <font size="1px" color="gray">Start Date (by default it's Today's Date. You can also edit the date to start later)</font>
                </div>
                <div class="input-name">
                        <i class="fa fa-calendar email"></i>
                        <input type="date" placeholder=" end date" id="enddate" name="enddate" required class="text-name" >
                        <font size="1px" color="gray">End Date</font>
                </div>
                <div class="input-name">
                        <i class="fa fa-bell email"></i>
                        <input type="date" placeholder=" remainder date" id="remainderdate" name="remainderdate" required class="text-name" >
                        <font size="1px" color="gray">Remainder Date</font>
                </div>
                <div class="input-name">
                        <center><input style="font-family:monospace" class="button" type="submit" value="Add Notes" /></center>
                </div>
              </form>
         </div>
     </div>
		<br/><hr>
			<p class="center"><a href="#" class="btn btn-default">Close</a></p>
		</div>
		
	</div>
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
 <div class="side"></div>
     <script src="js/register.js"></script>
     <script>
       $(document).ready( function()
       {
    	    var now = new Date();
    	    var day = ("0" + now.getDate()).slice(-2);
    	    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    	    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    	    $('#startDate1').val(today);
    	    $('#startDate2').val(today);
    	    $('#startDate3').val(today);
    	});     
     </script>
</body>
</html>