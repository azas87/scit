<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" href="./resources/css/button.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />

<script type="text/javascript"	src="./resources/js/i18n/grid.locale-ja.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.min.js"></script>

 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.js"></script>
<script type="text/javascript" src="./resources/js/marketPrice.js"></script>


</head>
<body>

<div style="width: 900px; margin: 0 auto; padding-top: 80px;">
	<table id="jqGridBoard"></table>
	<div id="jqGridPager"></div>
	</div>
	<c:if test="${sessionScope.userMode=='manager'}">
	<div id="btn" style="width: 150px; height: 30px; margin: 0 auto;">
	<button onclick="writeFaqForm()">投稿</button>
	</div>
	</c:if>


</body>
</html>
