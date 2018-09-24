<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>

<link href="./resources/css/login.css" rel="stylesheet" type="text/css" />

<!--SCRIPTS-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<!--Slider-in icons-->
<script type="text/javascript">
$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
});
</script>

</head>
<body>
<div>
	<!--WRAPPER-->
	<div id="wrapper">
	
		<!--SLIDE-IN ICONS-->
	    <div class="user-icon"></div>
	    <div class="pass-icon"></div>
	   
	<form action="login" method="post" class="login-form"  name="login-form" method="post">
	
	    <div class="header">
	  	<h1>Login Form</h1>
	    <!--DESCRIPTION--><span></span><!--END DESCRIPTION-->
	    </div>
	  
		
	    <div class="content">
		<!--USERNAME--><input name="id" type="text" class="input username" value="Username" onfocus="this.value=''" /><!--END USERNAME-->
	    <!--PASSWORD--><input name="password" type="password" class="input password" value="Password" onfocus="this.value=''" /><!--END PASSWORD-->
	    </div>
	  
	    
	    <div class="footer">
	    <input type="submit" name="submit" value="Login" class="button" style="height:65px"/><!--END LOGIN BUTTON-->
	   <!--  <input type="submit" name="submit" value="Register" class="register" />END REGISTER BUTTON -->
	    </div>
	</form>
	</div>
</div>
<div class="gradient"></div>	

<div>${msg}</div>
</body>
</html>
