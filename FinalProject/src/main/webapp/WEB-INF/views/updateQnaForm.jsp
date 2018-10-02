<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/boardUpdate.css"/>
</head>

<script>
function boardList(){
	location.href="qnaForm?";
}


</script>
<body>
<form action="updateQna">
<table width="97%" align="center" cellpadding="0" cellspacing="0"><tr><td>


<br><br>
<!-- 제목, 글쓴이, 날짜, 조회, 추천, 비추천 -->
<table width="680" cellspacing="0" cellpadding="0" border=0 align="center">

<tr><td height="34">
    <table class="tab" width=100% cellpadding=0 cellspacing=0>
    <tr>
    	<td style='word-break:break-all; height:28px; padding-left:34px;'>
		<strong>제목</strong>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" value="${qna.title}"/></td>

    </tr>
    </table></td></tr>

<tr>
<td>
<table class="tab" border=0 width="100%"><tr>
<td height=28 style='padding-left:20px' width="50%">
	<strong>글쓴이</strong>&nbsp;&nbsp;${qna.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:20px'>
	<strong>날짜</strong>&nbsp;&nbsp; ${qna.writeBoardDate} &nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:20px'>
	<strong>조회수</strong>&nbsp;&nbsp;&nbsp;&nbsp; ${qna.hitcount}&nbsp;&nbsp;&nbsp;&nbsp;
  
    </td>
</tr></table>
</td></tr>
<tr><td height=1 bgcolor=#A1B4E1></td></tr>


<tr> 
    <td id="content" height="500">
    <textarea name="content" rows="40" cols="100">${qna.content}</textarea>
</td>
</tr>

<tr>
<td id="btn" height="40">
<input type="hidden" name="qnaNum" value="${qna.qnaNum}"/>
<input type="submit" value="확인">

<input type="button" value="戻る" onclick="boardList()"></td>
</tr>
</table>

</td>
</tr>
</table>
</form>
</body>
</html>