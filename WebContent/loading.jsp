<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Loading Notifier...</title>
<meta http-equiv='refresh' content='6;URL=landing.jsp'>
<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #2c3e50;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  overflow: hidden;
  margin: 0;
}

.kinetic {
  position: relative;
  height: 80px;
  width: 80px;
}

.kinetic::after,
.kinetic::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  height: 0;
  width: 0;
  border: 50px solid transparent;
  border-bottom-color: #fff;
  animation: rotationA 2s linear infinite 0.5s;
}

.kinetic::before {
  transform: rotate(90deg);
  animation: rotationB 2s linear infinite;
}

@keyframes rotationA {
  0%,
  25% {
    transform: rotate(0deg);
  }
  50%,
  75% {
    transform: rotate(180deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

@keyframes rotationB {
  0%,
  25% {
    transform: rotate(90deg);
  }
  50%,
  75% {
    transform: rotate(270deg);
  }
  100% {
    transform: rotate(450deg);
  }
}

</style>
</head>
<body>
 <div class="kinetic"></div>
</body>
</html>