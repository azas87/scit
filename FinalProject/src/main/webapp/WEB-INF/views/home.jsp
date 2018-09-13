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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
<link rel="stylesheet" type="text/css"jk media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />

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
 $(document).ready(function() {
	 google.charts.load("current", {packages:["annotationchart"]});
	 google.charts.setOnLoadCallback(drawChart);
 
	 
 	 function drawChart() {
	        var data = new google.visualization.DataTable();
	        console.log("ㅎㅎ");
	        console.log('${list}');
	        
	        data.addColumn('date', 'Date');
	        data.addColumn('number', '${list[0].fishName}');
	        data.addColumn('number', '${list[0].fishName}');
	        data.addColumn('number', '${list[0].fishName}');
	        data.addColumn('number', '${list[0].fishName}');
	        data.addColumn('number', '${list[0].fishName}');
	        data.addColumn('number', '${list[0].fishName}');
	        data.addColumn('number', '${list[0].fishName}');
	        /* <c:forEach items="${list}" var="item">
	        	data.addColumn('number', '${item.fishName}');
	    	</c:forEach>  */
	    	
	    	/* console.log(new Date(2314, 2, 15));
	    	console.log('${list[0].dates}');
	    	console.log(new Date('${list[0].dates}')); */
	        
	        data.addRows([
	        //[new Date('${list[0].dates}'),5600,1234,4534,5676,789,89890,234234]
	           <c:forEach items="${list}" var="item">
	        	[new Date('${item.dates}'),
	        		<c:forEach items="${item.avgList}" var="avgPrice">
	        			Number('${avgPrice}'),
	        		</c:forEach>	
	        		
	        	], 
	    	</c:forEach>
	        	
	        ]);
	        
	        //console.log(data);

	        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

	        var options = {
	          displayAnnotations: true
	        };

	        chart.draw(data, options);
	      } 
 });
 
 </script>
	
</head>
<body>

<!-- <a href="cancel?">退会</a> -->
<div id="chart_div"></div>
<div id="contain">

	<div id="header">
		<div id="clock">	</div>
		
	</div>
	<div id="nav">
		<div class="items">
			<c:choose>
				<c:when test="${sessionScope.loginId == null }">
					<div class="item " ><a href="loginForm?">로그인</a></div>
					<div class="item " ><a href="joinForm?">회원가입</a></div>
				</c:when>
				
				<c:when test="${sessionScope.loginId != null }">
					<div class="item" ><a href="logOut?">로그아웃</a></div>
					<div class="item" ><a href="writeBuyBoardForm?">글등록</a></div>
					<div class="item" ><a href="buyListHistory?">구매내역</a></div>
				</c:when>
			</c:choose>
			<input type="hidden" id="userMode" value="${sessionScope.userMode}">
		</div>
		<div class="items">
			<div class="item" ><a href="./resources/content.html" class=" popdown btn">알림창 데모</a></div>
		</div>
		<div id="tab">
			<div class="items">
				<div class="item " onclick="allBuyList()">전체 글</div>
				<c:choose>
					<c:when test="${sessionScope.loginId != null }">
						<div class="item " onclick="myList()">진행중인리스트</div>
						<div class="item " onclick="myAllList()">내글 목록</div>
					</c:when>
				</c:choose>
				<div class="item search" title="검색어">검색 : <input type="text" id="search_cells" title=""></div>
			</div>
		</div>
	</div>

</div>


<div>
bestSeller
	<table id="jqGridbestSeller"></table><!--상위3개만  -->			
	<!-- <div id="jqGridPagerbestSeller"></div> -->
</div>	

<div>
seasonInfo,제철정보
	<table id="jqGridseasonInfo"></table><!--상위3개만  -->			
	<!-- <div id="jqGridPagerseasonInfo"></div> -->
</div>	

<div id="list">
	<div>
		<table id="jqGrid"></table>			
		<div id="jqGridPager"></div>
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
