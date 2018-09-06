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
 
	
	
</head>
<body>
 	<div id="contain">
		<div id="header">
			<div id="clock">	</div>
		</div>

		<div id="nav">
			<p>NAVIGATION</p>
      <div class="items">
      
      		<c:choose>
				<c:when test="${sessionScope.loginId == null }">
					<div class="item " title="로그인"><a href="loginForm?">로그인</a></div>
			        <div class="item " title="회원가입"><a href="joinForm?">회원가입</a></div>
				</c:when>
				
				<c:when test="${sessionScope.loginId != null }">
			        <div class="item " title="로그인"><a href="logOut?">로그아웃</a></div>
			        <div class="item " title="글등록"><a href="writeBuyBoardForm?">글등록</a></div>
			        <div class="item " title="구매내역"><a href="buyListHistory?">구매내역</a></div>
				</c:when>
			</c:choose>
			
        
      </div>
		</div>

		<div id="wrap">
			<div id="content">
				<div id="hit">
					<ul>
						<li>hit1</li>
						<li>hit2</li>
						<li>hit3</li>
						<li>hit4</li>
					</ul>
				</div>
				<div id="fav">
					<ul>
						<li>fav1</li>
						<li>fav2</li>
						<li>fav3</li>
						<li>fav4</li>
					</ul>
				</div>
			</div>
			<div id="banner">BANNER</div>
		</div>

		<div id="footer">
			FOOTER
		</div>
	</div>

 

	
<input type="button" value="전체품목(리스트)" id="allBuyList" class="allBuyList" onclick="allBuyList()">
<input type="button" value="나의품목(리스트)" id="myBuyList" class="myBuyList" onclick="myBuyList()"><br>

	<table id="jqGrid"></table>
	<div id="jqGridPager"></div>

</body>
</html>
</head>
<body>
