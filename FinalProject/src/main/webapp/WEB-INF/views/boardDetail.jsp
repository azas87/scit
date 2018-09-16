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
	location.href="qnaForm?";
}
function update(qnaNum) {
	location.href="updateQnaForm?qnaNum="+qnaNum;
}
function deleteBoard(qnaNum) {
	location.href="deleteQna?qnaNum="+qnaNum;
}

$(function(){
	init();
	$("#insertReply").on('click',function(){
		$.ajax({
			url:"insertReply",
			type:"get",
			data:{"content":$("#reviewContent").val(),
				"qnaNum":$("#qnaNum").val()
				},
			success:function(data){
				init();
			},
			error:function(){
				alert("실패");
			}
	
	});

	});
		
		
});
	
function updateForm() {
	alert('이벤트');
	var input = '<textarea class="updateContent" cols="100" rows="8">';
	$(this).parent().children(".reviewContent").html(input);
	$(this).parent().children(".updateRelpy").val("완료");
	$(".updateRelpy").off('click', updateForm);
	$(".updateRelpy").on('click', update);
}

function update() {
	
	var replyNum = $(this).parent().children(".reviewNum").val();
	var updateContet = $(this).parent().children(".reviewContent").children(".updateContent").val();
	/* location.href="updateReply?replyNum="+replyNum+"&replyContent="+updateContet+"&"; */
	alert('안녕');
		$.ajax({
			url:"updateReply",
			type:"get",
			data:{"replyNum":replyNum,
				"replyContent":updateContet
				},
			success:function(data){
				init();
			},
			error:function(){
				alert("실패");
			}
	
	});

	
}

function remove() {
	var replyNum = $(this).parent().children(".reviewNum").val();
	
	$.ajax({
		url:"deleteReply",
		type:"get",
		data:{"replyNum":replyNum
			},
		success:function(data){
			init();
		},
		error:function(){
			alert("실패");
		}

});
}

function init() {
	$(".reviewContent").val("");
	var qnaNum = $('#qnaNum').val();
	$.ajax({
		method : 'post'
		, url  : 'selectAllRelpy'
		,data:{"qnaNum":qnaNum}
		, success : output
	});
}

function output(resp) {

	 var result ='';
	
	for(var i in resp) {
		
		result += '<tr><td style="word-break:break-all; height:28px; padding-left:34px;"> ';
		result += '<strong style="font-size: large;">'+resp[i].id+'</strong>&nbsp;&nbsp;&nbsp;&nbsp;'+resp[i].replyRegdate;
		result += '</br><div class="reviewContent">'+resp[i].replyContent+'</div>';
		result += '<input type="hidden" class="reviewNum" value="'+resp[i].replyNum+'">'
		result += '<input type="button" value="수정" class="updateRelpy"/>';
		result += '<input type="button" value="삭제" class="deleteRelpy"/></td>';

	}
	
	$('#replyTable').html(result);
	$("input:button.deleteRelpy").click(remove);
	$("input:button.updateRelpy").click(updateForm);
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
		<strong>제목</strong>&nbsp;&nbsp;&nbsp;&nbsp;${qna.title}</td>

    </tr>
    </table></td></tr>

<tr>
<td>
<table class="tab" border=0 w/f;flidth="100%"><tr>
<td height=28 style='padding-left:20px' width="70%">

	<strong>글쓴이</strong>&nbsp;&nbsp;&nbsp;&nbsp;${qna.id}&nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:20px'>
	<strong>날짜</strong>&nbsp;&nbsp; ${qna.writeBoardDate} &nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:40px'>
	<strong>조회수</strong>&nbsp;&nbsp;&nbsp;&nbsp; ${qna.hitcount}&nbsp;&nbsp;&nbsp;&nbsp;
    
    </td>
</tr></table>
</td></tr>
<tr><td height=1 bgcolor=#A1B4E1></td></tr>

<tr> 
    <td id="content" height="600">
     ${qna.content}    
</td>
</tr>

<tr>
<td id="btn" height="40" align="center">

<div class="div">
<p class="p">
<input type="button" value="목록으로" onclick="boardList()"/>
<input type="button" value="수정" onclick="update(${qna.qnaNum})"/>
<input type="button" value="삭제" onclick="deleteBoard(${qna.qnaNum})"/>
</p>
</div>
</td>
</tr>
<tr><td height=1 bgcolor=#A1B4E1></td></tr>

<tr> 

<tr height="20"> </tr>
    <td id="btn" >
    <!-- <strong>댓글</strong>&nbsp;&nbsp;&nbsp;&nbsp; -->
    <input type="hidden" id="qnaNum" value="${qna.qnaNum}">
    <textarea id="reviewContent" cols="100" rows="8"></textarea>
	<input type="button" id="insertReply" value="댓글등록"/>
	
</td>
<br><br>
</tr>
<tr height="20"> </tr>


<tr><td>
 <table class="tab" width=100% cellpadding=0 cellspacing=0 id="replyTable">

   <c:forEach var="reply" items="${replyList}">
    <tr>
    	<td style='word-break:break-all; height:28px; padding-left:34px;'>
		<strong style="font-size: large;">${reply.id}</strong>&nbsp;&nbsp;&nbsp;&nbsp;${reply.replyRegdate}
		</br><div class="reviewContent">${reply.replyContent}</div>
		<input type="hidden" class="reviewNum" value="${reply.replyNum}">
		<input type="button" value="수정" class="updateRelpy"/>
		<input type="button" value="삭제" class="deleteRelpy"/></td>
	</tr>
    </c:forEach>

    </table>
	</td></tr>
	
	
    </td>

</tr>
</table>





</td>
</tr>
</table>
</form>
