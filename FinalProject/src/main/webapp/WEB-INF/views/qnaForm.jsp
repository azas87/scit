<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<link rel="stylesheet" href="./resources/css/button.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />

<script type="text/javascript"	src="./resources/js/i18n/grid.locale-ja.js"></script>


 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="./resources/js/qna.js"></script>

<style>

#tab
  {
  border-radius:5px;
  	box-sizing:true;
  	/* border:1px solid #cccccc; */
  	background:url(./resources/img/bg.png) repeat;
	padding:1px;
	margin: 1px;
	text-align: center;
	margin:0px auto;
	margin-bottom: 20px;
	margin-top:30px;	
	width:900px;
  }


    #tab .items {
    border:0px;	
    display: flex;
    flex-direction: row-reverse;
    height:60px;    
  }
  #tab .item
  {
    line-height: 60px;
    list-style: none;
    margin:0px;
        margin-right: 16px;
    font-size:3em;
  }
  
 #search_cells
{
	margin-top:5px;
	height:50px;
	max-width: 300px;
	font-size: 1em;
}

.title
{
	width:50%;
	border-right:1px solid white;	
}

.tooltip
{
	display:none;
	position:absolute;
	border:1px solid #333;
	background-color:#161616;
	border-radius:5px;
	padding:10px;
	color:#fff;
	font-size:3.5em;
	text-align: center;
	z-index: 1000;
}

</style>

<script>
$(document).ready(function(){
	var timer;
	$("#search_cells").on("keyup", function() {
		var self = this;
		if(timer) { clearTimeout(timer); }
		timer = setTimeout(function(){
			//timer = null;
			$("#jqGridBoard").jqGrid('filterInput', self.value);
		},0);
	});
});
</script>
</head>
<body>

	
<div id="tab">
		<!-- <div class="" title="검색어">검색 : <input type="text" id="search_cells" title=""></div> -->
		<div class="items">
			<div class="item search_text"><input type="text" id="search_cells" title=""></div>
			<div class="item search_title" title="검색어">検索</div>
			<c:if test="${sessionScope.userMode ne 'seller' }">  
			<div class="item title">Q&A</div>
			</c:if>
			<c:if test="${sessionScope.userMode eq 'seller' }">  
			<div class="item title">お問い合わせ</div>
			</c:if>		
		</div>
	</div>
	<div style="width: 900px; margin: 0 auto;">
	<table id="jqGridBoard"></table>
	<div id="jqGridPager"></div>
	</div>
	<c:if test="${sessionScope.userMode ne 'manager'}">	
	<div id="btn" style="width: 150px; height: 30px; margin: 0 auto;">
	<button onclick="writeBoardForm()">投稿</button>
	</div>
	</c:if>
	<input type="hidden" id="userMode" value="${sessionScope.userMode}">
</body>
</html>
