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
 <script>
 
 </script>
	
</head>
<body>

<!-- <a href="cancel?">退会</a> -->
<div id="contain">

	<div id="header">
		<div id="clock">	</div>
	</div>
	<div id="nav">
		<div class="items">
			<c:choose>
				<c:when test="${sessionScope.loginId == null }">
					<div class="item " title="로그인"><a href="loginForm?">로그인</a></div>
					<div class="item " title="회원가입"><a href="joinForm?">회원가입</a></div>
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
