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
	
<link rel="stylesheet" href="./resources/css/smallButton.css"/>
<link rel="stylesheet" href="./resources/css/selectWishList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




 <!-- The jQuery library is a prerequisite for all jqSuite products -->
 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <!-- This is the Javascript file of jqGrid -->   


 <script type="text/javascript" src="./resources/js/home.js"></script>
 
 	<link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 		<script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>
 		
 
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

<link rel="stylesheet" type="text/css"jk media="screen" href="./resources/css/home.css" />

</head>


<style>


</style>

<body>

<div id="menu_wrap">

<div id="contain">

<nav class="navbar navbar-expand-sm   navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 	<!-- <a class="navbar-brand" onclick="newPage('main?')">メイン<span class="sr-only">(current)</span></a> -->
	
  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">         
      <c:choose>
			<c:when test="${sessionScope.loginId == null }">
				<li class="nav-item item bigSize">
       				<a class="nav-link" onclick="newPage('main?')">メイン</a>
      			</li>      			
      			<li class="nav-item item bigSize">
       				<a class="nav-link" onclick="newPage('marketPrice?')">市価</a>
      			</li>
      			<li class="nav-item item bigSize">
       				<a class="nav-link" onclick="newPage('noticeForm?')">お知らせ</a>
      			</li>
      			<li class="nav-item item bigSize">
       				<a class="nav-link" onclick="newPage('qnaForm?')">お問い合わせ</a>
      			</li>
      			<li class="nav-item item bigSize">
       				<a class="nav-link" onclick="newPage('faqForm?')">よくある質問</a>
      			</li>
      		</c:when>
      		

      		<c:when test="${sessionScope.loginId != null }">
      			<li class="nav-item item bigSize">
       				<a class="nav-link" onclick="newPage('main?')">メイン</a>
      			</li>      			
      			<c:if test="${sessionScope.userMode eq 'buyer' }">      			
	      			<li class="nav-item item bigSize">
						<a class="nav-link" onclick="newPage('writeBuyBoardForm?')">ご購入</a>
					</li>					
					
				</c:if>					
					<c:if test="${sessionScope.userMode ne 'manager'}">	
					<li class="nav-item item bigSize">
						<a class="nav-link" onclick="newPage('updateWishList?')">関心</a>
					</li>
					<li class="nav-item item bigSize">								
						<a class="nav-link" onclick="newPage('buyListHistory?')">履歴</a>
					</li>	
					</c:if>
					<li class="nav-item item bigSize">
	       				<a class="nav-link" onclick="newPage('marketPrice?')">市価</a>
	      			</li>
	      			
	      			<li class="nav-item item bigSize">
	       				<a class="nav-link" onclick="newPage('noticeForm?')">お知らせ</a>
	      			</li>
	      			<c:if test="${sessionScope.userMode ne 'seller' }">
	      			<li class="nav-item item bigSize">
	       				<a class="nav-link" onclick="newPage('qnaForm?')">Q&A</a>
	      			</li>
	      			</c:if>
	      			<c:if test="${sessionScope.userMode eq 'seller' }">
	      			<li class="nav-item item bigSize">
	       				<a class="nav-link" onclick="newPage('qnaForm?')">お問い合わせ</a>
	      			</li>
	      			</c:if>
	      			<c:if test="${sessionScope.userMode ne 'seller' }">
	      			<li class="nav-item item bigSize">
	       				<a class="nav-link" onclick="newPage('faqForm?')">FAQ</a>
	      			</li>
	      			</c:if>
	      			<c:if test="${sessionScope.userMode eq 'seller' }">
	      			<li class="nav-item item bigSize">
	       				<a class="nav-link" onclick="newPage('faqForm?')">よくある質問</a>
	      			</li>
	      			</c:if>
	      			<c:if test="${sessionScope.userMode ne 'seller' }">
		      			<li class="nav-item item bigSize">
							<a class="nav-link" onclick="newPage('fishInfoList?')">魚図鑑</a>
						</li>
					</c:if>
					
			</c:when>			
		</c:choose>		   
    </ul>
    
    <div class="form-inline my-2 my-lg-0">
    <c:choose>
    	<c:when test="${sessionScope.loginId == null }">
    		<li class="nav-item item bigSize">
       			<a class="nav-link" href="loginForm?">入場</a>
      		</li>
      		<li class="nav-item item bigSize">
       			<a class="trigger_popup_fricc nav-link">会員登録</a>
      		</li>
    	</c:when>    
    
   		<c:when test="${sessionScope.loginId != null }"> 
   			<li class="nav-item item bigSize">
      			<a class="nav-link" href="logOut?">退場</a>
      		</li>
      		<li class="nav-item item bigSize">
      			<a class="nav-link" href="updateUser?">会員情報修正</a>
      		</li>	
      	</c:when>
    </c:choose>
    </div>
   
  </div>
</nav>

</div>

</div>

<div id=blank_div></div>

<div id="page-wrapper">
	<!-- frameborder="1" -->
	<!-- <iframe name="f_main" id="f_main" src="main?"  width="100%" height="100%" frameborder="0"  scrolling="no" marginwidth="0" marginheight="0" allowtransparency="true" ></iframe> -->
	<iframe name="f_main" id="f_main" src="main?"  frameborder="0" width="100%" marginwidth="0" marginheight="0" scrolling="no" style="border: 0px" onload="window.scrollTo(0,0)" height="1600px"></iframe>
</div>

<div class="hover_bkgr_fricc">
    <span class="helper"></span>
    <div>
        <!-- <div class="popupCloseButton">X</div> -->
        <form id="outForm" action="checkingStatus">
			<div id="memberStatus_page">
				<div class="test">
					<input type="radio" name="memberStatus" id="radio1" class="radio" value="newResitration" style="display: none;"/>
					<label for="radio1">新規登録</label>
				</div>
				
				<div class="test">
					<input type="radio" name="memberStatus" id="radio2" class="radio"  value="reentrance" style="display: none;"/>
					<label for="radio2">再登録</label>
				</div>
			</div>
			
			<div id="grade_page" style="display: none;">
				<div class="test">
					<input type="radio" name="grade" id="radio3" class="radio"  value="buyer" style="display: none;" />
					<label for="radio3">購入者</label>
				</div>
				
				<div class="test">
					<input type="radio" name="grade" id="radio4" class="radio"  value="seller" style="display: none;"/>
					<label for="radio4">販売者</label>
				</div>
			</div>
			
			<div class="test ">
				<button type="button" id="close">閉じる</button>
			</div>
    	</form>
    </div>
</div>

<input type="hidden" id="userMode" value="${sessionScope.userMode}">
</body>

</html>
</head>
<body>
