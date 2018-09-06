<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form action="login" method="post">
	
	 ログインID
		<input type="text" id="userid" name="id">
   	パスワード
   		<input type="password" id="userpwd" name="password"　placeholder="半角数字11桁">
   
		<input type="submit"  onclick="return check()" value="ログイン">
	</form>
	<div>${msg}</div>
</body>
</html>
