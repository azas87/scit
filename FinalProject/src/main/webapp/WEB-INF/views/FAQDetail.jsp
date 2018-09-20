<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/boardDetail.css"/>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function boardList(){
	location.href="faqForm?";
}
function update(FAQNum) {
	location.href="updateFaqForm?FAQNum="+FAQNum;
}
function deleteBoard(FAQNum) {
	location.href="deleteFaq?FAQNum="+FAQNum;
}

</script>
<body>
<form>

<table width="97%" align="center" cellpadding="0" cellspacing="0"><tr><td>


<br><br>
<!-- 제목, 글쓴이, 날짜, 조회, 추천, 비추천 -->
<table width="680" cellspacing="0" cellpadding="0" border=0 align="center">

<tr><td height="34">
    <table class="tab" width=100% cellpadding=0 cellspacing=0>
    <tr>
    	<td style='word-break:break-all; height:28px; padding-left:34px;'>
		<strong>제목</strong>&nbsp;&nbsp;&nbsp;&nbsp;${faq.title}</td>

    </tr>
    </table></td></tr>

<tr>
<td>
<table class="tab" border=0 w/f;flidth="100%"><tr>
<td height=28 style='padding-left:20px' width="70%">

	<strong>글쓴이</strong>&nbsp;&nbsp;&nbsp;&nbsp;${faq.id}&nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:20px'>
	<strong>날짜</strong>&nbsp;&nbsp; ${faq.writeBoardDate} &nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:40px'>
	<strong>조회수</strong>&nbsp;&nbsp;&nbsp;&nbsp; ${faq.hitcount}&nbsp;&nbsp;&nbsp;&nbsp;
    
    </td>
</tr></table>
</td></tr>
<tr><td height=1 bgcolor=#A1B4E1></td></tr>

<tr> 
    <td id="content" height="600">
     ${faq.content}    
</td>
</tr>

<tr>
<td id="btn" height="40" align="center">


<div class="div">
<p class="p">
<input type="button" value="목록으로" onclick="boardList()"/>
<c:if test="${sessionScope.loginId eq faq.id }">
<input type="button" value="수정" onclick="update(${faq.FAQNum})"/>
<input type="button" value="삭제" onclick="deleteBoard(${faq.FAQNum})"/>
</c:if>
</p>
</div>
</td>
</tr>



<tr><td height=1 bgcolor=#A1B4E1></td></tr>


</table>





</td>
</tr>
</table>
</form>
</body>
</html>