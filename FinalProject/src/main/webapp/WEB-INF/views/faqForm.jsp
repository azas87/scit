<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>

<!-- For jqgrid -->
<link rel="stylesheet" type="text/css" media="screen"href="./resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"href="./resources/css/ui.jqgrid.css" />
<script type="text/javascript" src="./resources/js/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript"	src="./resources/js/i18n/grid.locale-ja.js"></script>
<!-- For jqgrid -->


<!-- 여기서 테이블 만드로 crud에서 페이저 추가. 그래서 여기가 먼저 수행되야 함. -->
<script type="text/javascript" src="./resources/js/faq.js"></script>



<!-- common -->
<link rel="stylesheet" href="./resources/css/button.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/searchTab.css" />
<script type="text/javascript" src="./resources/js/zoom.js"></script>
<script type="text/javascript" src="./resources/js/crudCommon.js"></script>
<!-- common -->

</head>
<body>
	<div id="tab">
		<!-- <div class="" title="검색어">검색 : <input type="text" id="search_cells" title=""></div> -->
		<div class="items">
			<div class="item search_text">
				<input type="text" id="search_cells" title="">
			</div>
			<div class="item search_title" title="검색어">検索</div>

			<c:if
				test="${sessionScope.userMode eq 'buyer'||sessionScope.userMode eq 'manager'}">
				<div class="item title">FAQ</div>
			</c:if>

			<c:if
				test="${sessionScope.userMode eq 'seller'||sessionScope.loginId == null }">
				<div class="item title">よくある質問</div>
			</c:if>
		</div>
	</div>
	<div style="width: 900px; margin: 0 auto;">
		<table id="jqGridBoard"></table>
		<div id="jqGridPager"></div>
	</div>
	<c:if test="${sessionScope.userMode eq 'manager'}">
		<div id="btn" style="width: 150px; height: 30px; margin: 0 auto;">
			<button onclick="writeFaqForm('writeFaqForm?')">投稿</button>
		</div>
	</c:if>
	<input type="hidden" id="userMode" value="${sessionScope.userMode}">

</body>
</html>
