<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<form action="writeFaq">
<table border="1" > 

	<tr><th>題名</th>
	<td><input type="text" name="title"></td></tr>
	<tr><th>内容</th>
	<td><input type="text" name="content"></td></tr>

</table>
<input type="submit" value="登録">

</form>

</body>
</html>
