<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
<html>
<style>

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

#contain
{
	width:1000px;
	margin: 0 auto;
	overflow: hidden;
}

#header
{
	width:1000px;

	line-height:100px;

	color:#666;
	font-size:100px;
	text-align:center;
}

#nav
{
	width:780px;
	height:200px;
}
.items 
{
	display: flex;
	flex-direction: row;
	height:150px;
	line-height:150px;
	width:200px;
}

.item{
	margin:0px;
	text-align: left;
	display: flex;
	border:1px solid #cccccc;
	text-align: center;
}

.itemSub
{
	list-style: none;
	margin:0px;
	text-align: left;
	border:1px solid #cccccc;
	margin: 1px;
	text-align: center;
	font-size:1.5em;
	width:200px;
}



</style>
<head>
	<title>Home</title>



<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./resources/js/jquery.jqGrid.js"></script>

<script type="text/javascript" src="./resources/js/alertify.js"></script>
<script type="text/javascript" src="./resources/js/alertify.min.js"></script>

 <!-- The jQuery library is a prerequisite for all jqSuite products -->
 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <!-- This is the Javascript file of jqGrid -->   


 <!-- This is the localization file of the grid controlling messages, labels, etc.
 <!-- We support more than 40 localizations -->
 <script type="text/javascript"	src="./resources/js/i18n/grid.locale-ja.js"></script>
 <script type="text/javascript" src="./resources/js/jquery.jqGrid.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/alertify.core.css" />
<link rel="stylesheet" href="./resources/css/alertify.default.css" id="toggleCSS" />

<script type="text/javascript" src="./resources/js/buyListHistory.js"></script>
<script type='text/javascript'>
	$(document).ready(function() {
      	google.charts.load("current", {packages:["corechart"]});
      	google.charts.setOnLoadCallback(drawPieChart);
      	google.charts.setOnLoadCallback(drawHistogram);
      	
    //원형그래프
      function drawPieChart() {
    	var dataChart = [['Task', 'Hours per Day']];
    	//총액 구하기
    	var sum = 0;
    	<c:forEach items="${sumPricebyFishName}" var="item">
    		dataChart.push(["${item.fishName}",Number("${item.price}")]);
    		sum += ${item.price};
    	</c:forEach> 
			$('#sum').text(sum);
    	var data = google.visualization.arrayToDataTable(dataChart);
        var view = new google.visualization.DataView(data);
        var options = {
          title: 'My Daily Activities',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(view, options);
      }
    
    //막대그래프
      function drawHistogram() 
    {
    	  var dataChart = [["Element", "Density", { role: "style" } ]];
    	  
      	<c:forEach items="${list}" var="item" varStatus="status">
      		dataChart.push(["${status.count}",Number("${item}"), "gold"]);
  
      	</c:forEach> 
          
      	var data = google.visualization.arrayToDataTable(dataChart);
         
            var view = new google.visualization.DataView(data); 
            view.setColumns([0, 1,
                             { calc: "stringify",
                               sourceColumn: 1,
                               type: "string",
                               role: "annotation" },
                             2]);

            var options = {
              title: "Density of Precious Metals, in g/cm^3",
              width: 600,
              height: 400,
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
            chart.draw(view, options);
        }
    });

	
</script>

<body>

 <div id="columnchart_values" style="width: 700px; height: 300px;"></div>
 <div style="width: 700px; height: 300px;"></div>
 <div id="piechart_3d" style="width: 700px; height: 500px;"></div>
 
<div id="contain">
	<div id="header">
		<div id="chart_div"></div>
	</div>
	
	<div><br></div>
	
	<input id="search_cells" type="search"/>
	<table id="jqGrid"></table>
	<div id="jqGridPager"></div>
	
	<div><br></div>
	
	<div style = "margin-top : 20px; margin-left : 15px; font-size : 12px;">
	    <select class = "form-control" style = "width : 10%; float : left;" id = "searchType">
	        <option value = "All" selected>전체 검색</option>
	        <option value = "user_status">회원상태</option>
	      	<option value = "user_sex">성별</option>
	        <option value = "user_name">이름</option>
	        <option value = "user_email">이메일</option>
	    </select>
	    <input type ="text" id = "searchData" class ="form-control" style = "width : 30%; float : left; margin-bottom : 50px; margin-left : 10px;">
	    <button class = "btn btn-info btn-fill" id = "search" value = "검색 " style = "width : 10%; float : left; margin-left : 10px;">
	      검색
	    </button>
	</div>

	<script type="text/javascript">
	$(document).ready(function() {
		var period = "${period}"
		buyList(period);
		//다운로드를 위한 period
		$('#period').text(period);
		
		$('#jqGrid').jqGrid('navGrid',"#jqGridPager", {                
		    search: false, // show search button on the toolbar
		    add: false,
		    edit: false,
		    del: false,
		    refresh: true
		});
		
		var timer;
		$("#search_cells").on("keyup", function() {
			var self = this;
			if(timer) { clearTimeout(timer); }
			timer = setTimeout(function(){
				//timer = null;
				$("#jqGrid").jqGrid('filterInput', self.value);
			},0);
		});
		
		$("#search").on("click",function(){
			 var data = $("#searchData").val()
			 var searchType = $("#searchType").val();
			 var rows = $("[title ='Records per Page']").val();
			 var postData  = {'data' : data , 'searchType' : searchType, 'rows' :  rows }

			 rowData = null;
			
			 $("#jqGrid").jqGrid("clearGridData", true);
			
			 $("#jqGrid").setGridParam({
			 datatype	: "json",
				 postData	: postData,
				 loadComplete	: function(data) {
					 console.log(data);
				 }
			 }).trigger("reloadGrid");
		});
		 
		 $(window).resize(function() {

				$("jqGrid").setGridWidth($(this).width() * .100);

			});
	});
	
	
	
	</script>
	<br><br>
	<a href="buyListHistory?period=1week">1週間</a>
	<a href="buyListHistory?period=1month">1ヶ月</a>
	<a href="buyListHistory?period=3month">3ヶ月</a>
	<a href="buyListHistory?period=1year">1年</a>
	
	<table border="1">
	<tr><td>魚種</td><td>魚種別総額</td></tr>
	<c:forEach items="${sumPricebyFishName}" var="item">
    		<tr><td>${item.fishName}</td><td>${item.price}</td></tr>
    </c:forEach> 
    <tr><td>総額</td><td id="sum"></td></tr>
	
	</table>
	<form action="download">
		<input type="hidden" id="period" name="period">
		<input type="submit" value="ダウンロード">
	</form>
	
	<!-- 리뷰등록을 위해사용 -->
	<input type="hidden" id="buyNum" name="buyNum">
	<input type="hidden" id="sellerId" name="sellerId">
	<!-- 판매자상세정보를 위해 사용 -->
	<input type="hidden" id="sellerInfo" name="sellerInfo">
</body>
</html>
