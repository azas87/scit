<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script type="text/javascript" src="./resources/js/joinForm.js" ></script>
<!-- <script type="text/javascript" src="./resources/js/joinFormAJax.js" ></script> -->
</head>
<body>
 <form action="join" method="post">
	
	 ログインID
		<input type="text" id="userid" name="id">
	 	<button id="btn" type="button">ID CHECK</button>
   	パスワード
   		<input type="password" id="userpwd" name="password"　placeholder="半角数字11桁">
   	パスワード再入力
   		<input type="password" id="userpwd2">
   	氏名
   		<input type="text" id="name" name="name">
  	氏名（カナ)
  		<input type="text" id="namekana" name="nameKana"> 
   	電話番号
   		<input type="number" id="phone" name="tel" placeholder="ハイフンなしの半角数字11桁">
	住所	(ふらがな)
		<input type="text" id="address" name="addrHurikana">
	住所	
		<input type="text" id="address" name="address">
	メールアドレス
		<input type="email" id="email" name="email">
		<input type="hidden" name="grade" value="buyer">
		<!-- <input type="submit"  onclick="return check()" value="会員登録"> -->
		<button id="btn2" onclick="return check()" >완료</button>
	</form> 




</body>
</html>
