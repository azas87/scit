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
	
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/home.css" />

<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
<link rel="stylesheet" type="text/css"jk media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />

<script type="text/javascript" src="./resources/js/buyListHistory.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.js"></script>


 <!-- The jQuery library is a prerequisite for all jqSuite products -->
 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <!-- This is the Javascript file of jqGrid -->   


 <!-- This is the localization file of the grid controlling messages, labels, etc.
 <!-- We support more than 40 localizations -->
 <script type="text/javascript"	src="./resources/js/i18n/grid.locale-ja.js"></script>
 
 <script type="text/javascript" src="./resources/js/jquery.jqGrid.min.js"></script>
 <script type="text/javascript" src="./resources/js/home.js"></script>
 
 <link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 <script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>

<!-- 경고창 -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/alertify.core.css" />
<link rel="stylesheet" href="./resources/css/alertify.default.css" id="toggleCSS" />
<script type="text/javascript" src="./resources/js/alertify.js"></script>
<script type="text/javascript" src="./resources/js/alertify.min.js"></script>

	
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
.trigger_popup_fricc {
    cursor: pointer;
    font-size: 20px;
    margin: 20px;
    display: inline-block;
    font-weight: bold;
}
/* Popup box BEGIN */


</style>
<script>

$(window).load(function () {
    $(".trigger_popup_fricc").click(function(){
       $('.hover_bkgr_fricc').show();
    });
   
    $('.popupCloseButton').click(function(){
        $('.hover_bkgr_fricc').hide();
    });
});

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
}


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



</script>
<body>


<div class="hover_bkgr_fricc">
    <span class="helper"></span>
    <div>
        <div class="popupCloseButton">X</div>
        <form action="checkingStatus">
        	<input type="radio" name="grade" value="newResitration">新規登録
			<input type="radio" name="grade" value="reentrance">再登録<br>
		
			<input type="radio" name="memberStatus" value="seller">購入者
			<input type="radio" name="memberStatus" value="buyer">販売者<br>
			<input type="submit" value="確認">
    	</form>
    </div>
</div>


<input type="button" value="退会" onclick="cancel()">
<div id="contain">

	<div id="header">
		<div id="clock">	</div>
	</div>
	<div id="nav">
		<div class="items">
			<c:choose>
				<c:when test="${sessionScope.loginId == null }">
					<div class="item " title="로그인"><a href="loginForm?">로그인</a></div>
					<div class="item " title="회원가입"><a class="trigger_popup_fricc">회원가입</a></div>
				</c:when>
				
				<c:when test="${sessionScope.loginId != null }">
					<div class="item" title="로그인"><a href="logOut?">로그아웃</a></div>
					<div class="item" title="글등록"><a href="writeBuyBoardForm?">글등록</a></div>
					<div class="item" title="구매내역"><a href="buyListHistory?">구매내역</a></div>
				</c:when>
			</c:choose>
			<input type="hidden" id="userMode" value="${sessionScope.userMode}">
		</div>
		<div class="items">
			<div class="item" title="Content Demo"><a href="./resources/content.html" class=" popdown btn">알림창 데모</a></div>
		</div>
		<div id="tab">
			<div class="items">
				<div class="item " title="전체 글" onclick="allBuyList()">전체 글</a></div>
				<c:choose>
					<c:when test="${sessionScope.loginId != null }">
						<div class="item " title="나의 품목" onclick="myList()">나의 품목</a></div>
					</c:when>
				</c:choose>
				<div class="item">검색 : <input type="text" id="search_cells" title=""></div>
			</div>
		</div>
	</div>

</div>

 <div id="list">
		<div>
			<table id="jqGrid"></table>
			<div id="jqGridPager"></div>
		</div>	
	</div>
	

</body>
</html>
</head>
<body>
