<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<title>Insert title here</title>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




 <!-- The jQuery library is a prerequisite for all jqSuite products -->
 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <!-- This is the Javascript file of jqGrid -->   


 <script type="text/javascript" src="./resources/js/home.js"></script>
 
 	<link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 		<script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>
 		<link rel="stylesheet" type="text/css"jk media="screen" href="./resources/css/home.css" />
 
 <link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 <script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>

<!-- 경고창 -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/alertify.core.css" />
<link rel="stylesheet" href="./resources/css/alertify.default.css" id="toggleCSS" />
<script type="text/javascript" src="./resources/js/alertify.js"></script>
<script type="text/javascript" src="./resources/js/alertify.min.js"></script>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

</head>


<style>
/* Popup box BEGIN */
.hover_bkgr_fricc{
    background:rgba(0,0,0,.4);
    cursor:pointer;
    display:none;
    height:100%;
    position:fixed;
    text-align:center;
    top:0;
    width:100%;
    z-index:10000;
}
.hover_bkgr_fricc .helper{
    display:inline-block;
    height:100%;
    vertical-align:middle;
}
.hover_bkgr_fricc > div {
    background-color: #fff;
    box-shadow: 10px 10px 60px #555;
    display: inline-block;
    height: auto;
    max-width: 551px;
    min-height: 200px;
    vertical-align: middle;
    width: 60%;
    position: relative;
    border-radius: 8px;
    padding: 15px 5%;
}
.popupCloseButton {
    background-color: #fff;
    border: 3px solid #999;
    border-radius: 50px;
    cursor: pointer;
    display: inline-block;
    font-family: arial;
    font-weight: bold;
    position: absolute;
    top: -20px;
    right: -20px;
    font-size: 25px;
    line-height: 30px;
    width: 30px;
    height: 30px;
    text-align: center;
}
.popupCloseButton:hover {
    background-color: #ccc;
}

/* Popup box BEGIN */


.legend
{
	font-size: 20px;
}

</style>
<script>
$(window).load(function () {
    $(".trigger_popup_fricc").click(function(){
       $('.hover_bkgr_fricc').show();
    });
   
    $('.popupCloseButton').click(function(){
        $('.hover_bkgr_fricc').hide();
    });
   
    $('#close').click(function(){
    	
        $('.hover_bkgr_fricc').hide();
    }); 
    
    $('.popdown').popdown();
    
    $(".item").mouseenter(function(){
		  if($(this).attr('class') != "item search")
		  {
			  $(this).css('flex-grow',1);
		      $(this).css('font-size',"3em");
		      $(this).css('background-color',"powderblue");
	/*	      $('input').css('line-height', '60px');
		      $('input').css('width', '200px');*/
		  }
	     
	    });
	    
	  $(".item").mouseleave(function(){
	      $(this).css('flex-grow',1);
	      $(this).css('font-size',"1.5em");
	      $(this).css('background-color',"white");
	    });
	  
});

function cancel() {
	
	reset();
	alertify.prompt("パスワードをもう一度入力してください。", function (e, str) {
		if (e) {
			alertify.success("You've clicked OK and typed: " + str);
			
			$.ajax({
				url:"cancel",
				type:"post",
				data:{"password":str,
					  },
				success:function(data){
					alert('성공');
				},
				error:function(){
					alert("통신실패");
				}
			});
	
			
			
		} else {
			alertify.error("You've clicked Cancel");
		}
	}, "");
	return false;
}

function reset () {
	$("#toggleCSS").attr("href", "./resources/css/alertify.default.css");
	alertify.set({
		labels : {
			ok     : "OK",
			cancel : "Cancel"
		},
		delay : 5000,
		buttonReverse : false,
		buttonFocus   : "ok"
	});
	
	var audio = new Audio('./resources/alram.wav');
	audio.play();
}
</script>



<body>

<div id="menu_wrap">
<div id="contain">

<!-- 	<div id="header">
		<div id="clock">	</div>
		
	</div> -->
	

<nav class="navbar navbar-expand-sm   navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 	<a class="navbar-brand" onclick="newPage('main?')">メイン<span class="sr-only">(current)</span></a>
	
  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">         
      <c:choose>
			<c:when test="${sessionScope.loginId == null }">      			
      			<li class="nav-item">
       				<a class="nav-link" onclick="">市価</a>
      			</li>
      			<li class="nav-item">
       				<a class="nav-link" onclick="newPage('noticeForm?')">お知らせ</a>
      			</li>
      			<li class="nav-item">
       				<a class="nav-link" onclick="newPage('qnaForm?')">お問い合わせ</a>
      			</li>
      			<li class="nav-item">
       				<a class="nav-link" onclick="newPage('faqForm?')">よくある質問</a>
      			</li>
      		</c:when>
      		
      		<c:when test="${sessionScope.loginId != null }">
      			<c:if test="${sessionScope.userMode == '1' }">      			
	      			<li class="nav-item">
						<a class="nav-link" href="writeBuyBoardForm?">購入される方</a>
					</li>
				</c:if>					
					<c:if test="${sessionScope.userMode ne 'manager'}">	
					<li class="nav-item">								
						<a class="nav-link" href="buyListHistory?">履歴</a>
					</li>	
					</c:if>
					<!-- <li class="nav-item">	
						<a class="nav-link" href="javascript:void(0);" onclick="cancel(); return false;">탈퇴</a>
					</li> -->
					<li class="nav-item">
	       				<a class="nav-link" onclick="">市価</a>
	      			</li>
	      			<!-- <li class="nav-item">
	       				<a class="nav-link" onclick="newPage('noticeForm?')">お知らせ</a>
	      			</li>
	      			<li class="nav-item">
	       				<a class="nav-link" onclick="newPage('qnaForm?')">お問い合わせ</a>
	      			</li>
	      			<li class="nav-item">
	       				<a class="nav-link" onclick="newPage('faqForm?')">よくある質問</a>
	      			</li> -->
			</c:when>			
		</c:choose>		   
    </ul>
    
    <form class="form-inline my-2 my-lg-0">
    <c:choose>
    	<c:when test="${sessionScope.loginId == null }">
    		<li class="nav-item">
       			<a class="nav-link" href="loginForm?">入場</a>
      		</li>
      		<li class="nav-item">
       			<a class="trigger_popup_fricc nav-link">退場</a>
      		</li>
    	</c:when>    
    
   		<c:when test="${sessionScope.loginId != null }"> 
   			<li class="nav-item">
      			<a class="nav-link" href="logOut?">退場</a>
      		</li>
      		<li class="nav-item">
      			<a class="nav-link">会員情報修正</a>
      		</li>	
      	</c:when>
    </c:choose>
    </form>
   
  </div>
</nav>

</div>
</div>

<div id=blank_div></div>

<div id="page-wrapper">
	<!-- frameborder="1" -->
	<!-- <iframe name="f_main" id="f_main" src="main?"  width="100%" height="100%" frameborder="0"  scrolling="no" marginwidth="0" marginheight="0" allowtransparency="true" ></iframe> -->
	<iframe name="f_main" id="f_main" src="main?"  frameborder="0" width="100%" marginwidth="0" marginheight="0" scrolling="no" style="border: 0px" onload="window.scrollTo(0,0)" height="100%"></iframe>
</div>

<div class="hover_bkgr_fricc">
    <span class="helper"></span>
    <div>
        <div class="popupCloseButton">X</div>
        <form id="outForm" action="checkingStatus">
			<div class="items">
				<div class="item" ><input type="radio" name="memberStatus" value="newResitration">新規登録</div>
				<div class="item "><input type="radio" name="memberStatus" value="reentrance">再登録<br></div>
			</div>
			<div class="items">
				<div class="item" ><input type="radio" name="grade" value="buyer">購入者</div>
				<div class="item "><input type="radio" name="grade" value="seller">販売者<br></div>
			</div>
			<div class="items">
				<div class="item" ><input type="submit" value="会員登録へ進む"></div>
				<div class="item" ><input type="button" value="閉じる" id="close"></div>
			</div>
    	</form>
    </div>
</div>
<a href="fishInfoList?">생선정보</a>

<a href="updateWishList?">선호품목변경</a>
<a href="marketPrice?">시세</a>
</body>

</html>
</head>
<body>
