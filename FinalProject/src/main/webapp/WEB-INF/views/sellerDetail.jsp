<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<style type="text/css">

.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

</style>

</head>

<script>
$(function() {

var sellerId = $("#sellerInfo", opener.document ).val();

$.ajax({
	url:"getSellerInfo",
	type:"post",
	data:{"sellerId":sellerId},
	
	success:function(resp){

		var wishlist='';
		for(i in resp){
			wishlist += resp[i].wish + " ";
		}

		$('#id').text(wishlist);
		$('#name').text(resp[0].name);
		$('#nameKana').text(resp[0].nameKana);
		$('#address').text(resp[0].address);
		/* $('#star').text(resp[0].star); */
		$('#wish').text(wishlist);
		$('#star'+resp[0].star).addClass('on').prevAll('span').addClass('on');
		/* $('#star'+resp[0].star).addClass('on').prevAll('span').addClass('on'); */
		
	},
	error:function(){
		alert("통신실패")
	}
});

});


</script>

<body>
<table border="1">
<tr><th>販売者ID</th><td id="id"></td></tr>
<tr><th>姓名</th><td id="name"></td></tr>
<tr><th>フリガナ</th><td id="nameKana"></td></tr>
<tr><th>お住まい</th><td id="address"></td></tr>
<tr><th>点数</th>
<td id="star">
<div class="starRev">
  <span class="starR1 on" id="star1">별1_왼쪽</span>
  <span class="starR2" id="star2">별1_오른쪽</span>
  <span class="starR1" id="star3">별2_왼쪽</span>
  <span class="starR2" id="star4">별2_오른쪽</span>
  <span class="starR1" id="star5">별3_왼쪽</span>
  <span class="starR2" id="star6">별3_오른쪽</span>
  <span class="starR1" id="star7">별4_왼쪽</span>
  <span class="starR2" id="star8">별4_오른쪽</span>
  <span class="starR1" id="star9">별5_왼쪽</span>
  <span class="starR2" id="star10">별5_오른쪽</span>
</div>







</td></tr>
<tr><th>販売魚種</th><td id="wish"></td></tr>
</table>   
</body>
</html>
