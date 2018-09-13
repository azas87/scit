<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/reenterance.js" ></script>

</head>

<body>
	ニックネーム<input type="text" id="userid" name="id"><br>
	暗証番号<input type="password" id="password" name="password" ><br>
	暗証番号の再入力<input type="password" id="pwd2" name="pwd2" ><br>
	会員再登録のためにはメールアドレスで本人確認が必要になります。
	メールアドレスを入力の上、下記のボタンを押してください。<br>
	メールアドレス<input type="email" id="email" name="email" >
	<div id="result"></div><br>
	<input type="button" id="emailBtn" value="認証番号もらう" ><br>
	メールに送られてきた６下駄の番号を下記に入力してください。<br>
	認証番号<input type="text" id="checkingEmail"><br>
	<input type="submit" id="btn" value="確認" ><br>
</body>
</html>