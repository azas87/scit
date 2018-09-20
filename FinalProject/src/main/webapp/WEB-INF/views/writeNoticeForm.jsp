<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>

<link rel="stylesheet" href="./resources/css/registBoard.css" type="text/css" media="all">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>

<div style="width: 700px; margin: 0 auto;">
<form action="writeFaq" method="post" style="margin: 0 auto;">

<table>
	<col style="width:40%;"/>
	<col style="width:70%;"/>
    <tbody>
            <tr>
                <th>タイトル: </th>
                <td><input type="text" name="title" style="width:437px; height:22px; "/></td>
            </tr>
            <tr>
                <th>内容:
                <td><textarea name="content" cols="60" rows="40"></textarea></td>
            </tr>
       		
         
            <tr> 
                <td colspan="2">
                 
                    <input type="submit" value="登録"/>
                    <a href="qnaForm?"><input type="button" value="戻る"/></a>
                </td>
            </tr>
   
    </tbody>
</table>
</form>
</div>



</body>
</html>
