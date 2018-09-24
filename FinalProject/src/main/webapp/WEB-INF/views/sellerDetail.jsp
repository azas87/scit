<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" href="./resources/css/smallButton.css"/>
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


table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
  vertical-align: middle;
}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.blueTable tbody td {
  font-size: 13px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}


table.blueTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444;
}
table.blueTable tfoot td {
  font-size: 14px;
}
table.blueTable tfoot .links {
  text-align: right;
}
table.blueTable tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
}
td:first-child {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
td:first-child  {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
td:first-child  {
  border-left: none;
}
#wrap { 
width:300px; 
height:200px; 
background-color:#CCCCCC; 
position:absolute; 
top:43%; 
left:50%; 
margin-top:-100px; 
margin-left:-150px; 
} 
th{
width: 100px;
}
</style>

</head>

<script>
$(function() {
	$('#nani').on('click', function(){
		window.close();
});
var sellerId = $("#sellerInfo", opener.document ).val();
alert('sellerId'+sellerId);
$.ajax({
	url:"getSellerInfo",
	type:"post",
	data:{"sellerId":sellerId},
	
	success:function(resp){

		var wishlist='';
		for(i in resp){
			wishlist += resp[i].wish + " ";
		}
		alert(resp);
		$('#id').text(resp[0].id);
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
<div id="wrap">
<table class="blueTable">
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
<div style="width: 10px; height: 40px;"> </div>
<div id="btn" style="width: 90px; height: 30px; margin: 0 auto;">
	<button id="nani" type="button">閉じる</button>
	</div>

</div> 
</body>
</html>
