<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  	<title>Profile</title>
    <link rel="icon" href="img/profile.png" type="image/x-icon">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/cardstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
  <body>
    <div id="cardhover" class="container">
      <div class="wrapper">
        <a href="#">
          <img src="img/Gowthamraj K.jpg">
        </a>
        <div class="title">
            <b><h1><font color="yellow">GowthamRaj K</font><h1></b></div>
        </div>
       <div class="content">
            <p>Electronics Engineer, Competitive Programmer and a Full stack Web Developer. Master in Leadership, Presentation and Design Thinking</p>
            <div class="text">Reach me @9698382306, gowthamraj692@gmail.com</div><br>
            <div class="buttons">
                <div class="btn">
                    <button onclick="document.location='https://github.com/gowthamrajk'"><b>Visit Profile</b></button>
                </div>
                <div class="btn">
                    <button onclick="navigateToWhatsapp()"><b>Chat with me</b></button>
                </div>
            </div>
        </div>
        <div class="icons">
            <li><a href="https://www.facebook.com/profile.php?id=100017471417983"><span class="fab fa-facebook-f"></span></a></li>
            <li><a href="https://www.instagram.com/gow_t_h_a_m_r_a_j/?hl=en"><span class="fab fa-instagram"></span></a></li>
            <li><a href="https://www.linkedin.com/in/gowtham-kittusamy-54b835174/"><span class="fab fa-linkedin"></span></a></li>
            <li><a href="https://www.hackerrank.com/gowthamraj692"><span class="fab fa-hackerrank"></span></a></li>
            <li><a href="https://twitter.com/Gowtham29341737"><span class="fab fa-twitter"></span></a></li>
            <li><a href="https://www.youtube.com/channel/UC_Q5Zet9Oz-UVAeJ-oE_uGQ"><span class="fab fa-youtube"></span></a></li>
        </div>
    </div>
    <div class="text1" id="myDiv">hover on the image<br>for more Details</div>
    <script>
      const img = document.querySelector("img");
      const icons = document.querySelector(".icons");
      img.onclick = function()
      {
        this.classList.toggle("active");
        icons.classList.toggle("active");
      }
      $("#cardhover").hover(
         function(){
    	     $("#myDiv").hide();
         },
         function()
         {
        	 $("#myDiv").show();
      });
      function navigateToWhatsapp()
      {
      	 location.href="https://api.whatsapp.com/send?phone=+919698382306&text='Hello Gowtham, Great to connect with you !!!'";
      }
    </script>
    </body>
</html>
    