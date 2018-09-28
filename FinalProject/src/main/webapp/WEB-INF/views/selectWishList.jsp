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
</head>
<script>

$(function() {
	
	$.ajax({
		url:"getWishList",
		type:"get",

		success:function(resp){
			var temp='';
			for(i in resp){
				temp +=  '<a href ="#" class="myButton" name="'+resp[i].wish+'" onclick="deleteWishList(\''+resp[i].wish+ '\')" >'+resp[i].wish+'</a>';
			}
			
			$('#wishFishList').html(temp);
		},
		error:function(test){
			console.log(test);
			alert("통신실패")
		}
	});//ajax
	
		$(".button").click(function() { 
			location.href="setNotFirst?";
			
		});
		$("input:radio[name=radio]").click(function() { 
			getFishList(); 

	/* $("input:radio[name=category]").click(function() {
	$(".category").click(function() {
		getFishList($(this).attr('data-value'));  */

	});
	 /* $(".button").click(function() { 
		setWishList(); 
		}); */
});

function getFishList(){ 
	
	 var radioVal = $('input[name="radio"]:checked').val();
	 console.log(radioVal);
	$.ajax({
		url:"getFishList",
		type:"get",
		data:{"fishCategoryNum":radioVal},
	
		success:function(resp){
			console.log(resp);
			var temp="";
			
			for(i in resp){
			temp += '<div class="test">';
			temp += '<input type="radio" name="radio1" class="radio" id="radio'+(parseInt(i)+10)+'" value="'+resp[i].fishName;
			temp += '" style="display: none;"/>';
			temp += '<label for="radio'+(parseInt(i)+10)+'">'+resp[i].fishName+'</label>';
			temp += '</div>';
		}
			
			$('#fishListDetail').html(temp);
			
			 $("input:radio[name=radio1]").click(function(){ setWishList(); }); 
		},
		
		error:function(){
			alert("통신실패")
		}
	});//ajax
}
function setWishList() {
	 var fishName = $('input[name="radio1"]:checked').val();
	if(fishName==null){
		console.log('값넣어줘');
	}
	else{
		$.ajax({
			url:"setWishList",
			type:"get",
			data:{"fishName":fishName},
		
			success:function(resp){
				if(resp==10){
					return;
				}
				if(resp<5){
				
				var temp = '';
					temp += '<a href ="#" class="myButton" name="'+fishName+'" onclick="deleteWishList(\''+fishName+ '\')" >'+fishName+'</a>';
		
				$('#wishFishList').append(temp);
				}
			},
			
			error:function(){
				alert("통신실패")
			}
		});//ajax
	}
	
	}

function deleteWishList(fishName) {
	
	$.ajax({
		url:"deleteWishList",
		type:"get",
		data:{"fishName":fishName},
	
		success:function(resp){
			$("a[name="+fishName+"]").remove();
		},
		
		error:function(){
			alert("통신실패")
		}
	});//ajax
}
</script>

<body>


<div class="message warning" style="width: 900px; height: 720px;  border: none;">
<div class="inset" >
	<div class="login-head" style="background: #d4dedf;">
		<!-- <h1 style="color: black; margin: 0 auto; position:relative; left:290px; font-weight: 900" >よく販売する業種</h1> -->
		よく販売する業種
		
	</div>
	<div id="wishFishList"></div>
	<form >
		<div style="height: 600px; height:480px;">
		<div id="fishList" style="width: 200px; float: left;">
		<!-- カテゴリーを選んでください。 -->
			<c:forEach items="${categoryList}" var="category" varStatus="status" begin="0" end="4">
				<div class="test">	
					<input type="radio" name="radio" class="radio" id="radio${status.count}" value="${category.fishCategoryNum}" style="display: none;"/>
					<label for="radio${status.count}">${category.categoryName}</label>
				</div>
			</c:forEach>
		</div>
		<div id="fishListDetail"  ></div>
	<!-- 魚種を選んで確認ボタンを押してください。 -->
	</div>
	<div style="padding-bottom: 20px;">
	<input type="button" name="submit" value="確認" class="button" style="font-size:xx-large; font-weight:900;"/>
	</div>
	</form>	
</div>	
</div>


</body>
</html>
