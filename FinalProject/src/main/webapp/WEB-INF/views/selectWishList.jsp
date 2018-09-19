<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
<title>Purple_loginform Website Template | Home :: w3layouts</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/css/selectWishList.css">
<link href="./resources/css/login.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- -->

<script>

$(function() {
	 /* $("input:radio[name=category]").click(function() { */
	$(".category").click(function() {
		getFishList($(this).attr('data-value')); 
	});
	 /* $(".button").click(function() { 
		setWishList(); 
		}); */
});
function getFishList(fishCategoryNum){ 
	$.ajax({
		url:"getFishList",
		type:"get",
		data:{"fishCategoryNum":fishCategoryNum},
		
		success:function(resp){
			var temp="";
			for(i in resp){
			/* temp += '<li><input type="radio" name="fishName" value="'+resp[i].fishName+'"/>'+resp[i].fishName; */
			temp += '<li><div class="fishName" data-value="'+resp[i].fishName+'">'+resp[i].fishName+'</div></li>'
			
			
		}
			$('#fishList').html(temp);
			
			$(".fishName").click(function(){ setWishList(); });
		},
		
		error:function(){
			alert("통신실패")
		}
	});//ajax
}
function setWishList() {
	var fishName = $('.fishName').attr('data-value');
	console.log(fishName);
	if(fishName==null){
		alert('값넣어줘');
	}
	else{
		location.href="setWishList?fishName="+fishName;
	}
}
	

</script>
</head>
<body style="background:url(./resources/img/bg.png) repeat;">

<!-- contact-form -->	
<div class="message warning" style="width: 800px; height: 720px;  border: none;">
<div class="inset" style="height: 500px;">
	<div class="login-head" style="background: #d4dedf;">
		<h1 style="color: black; margin: 0 auto; position:relative; left:290px; font-weight: 900" >よく販売する業種</h1>
		 <input type="button" name="submit" value="確認" class="button" style="font-size:xx-large; font-weight:900; position: relative; top: 545px;left: -345px;"/>
		 <div class="alert-close">
		 		 
		 </div> 			
	</div>
		<form style="height: 530px;">
		<div style="width: 200px; float: left;"><ul>
			<c:forEach items="${categoryList}" var="category">
		 	<%-- <li><input type="radio" name="category" value="${category.fishCategoryNum}" /> ${category.categoryName} --%>
		 		<li><div class="category" data-value="${category.fishCategoryNum}">${category.categoryName}</div></li>
		 	</c:forEach>
		</ul></div>	
		
		<ul id="fishList">
		</ul>
				
		</form>
		</div>					
	</div>

	<!-- <div class="clear"> </div> -->
<!--- footer --->

</body>
</html>
