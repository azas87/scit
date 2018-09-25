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
	width:1300px;
	margin: 0 auto;
	overflow: hidden;
}

#header
{
	width:1300px;

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
	border:1px solid #cccccc;
	display: flex;
	flex-direction: row;
	width:1295px;
}

.item{
	margin:0px;
	flex-grow: 1;
	text-align: right;
}

#tab
  {
  	box-sizing:true;
  	border:1px solid #cccccc;
	padding:1px;
	margin: 1px;
	text-align: center;
	margin:0px auto;
	margin-bottom: 10px;
  }
  
   #tab div{
			border:1px solid #cccccc;
			padding:1px;
			margin: 1px;
			text-align: center;
		}

    #tab .items {
    border:0px;	
    display: flex;
    flex-direction: row;
    height:80px;

  }
  #tab .item
  {
    line-height: 80px;
    list-style: none;
    margin:0px;
    flex-grow: 1;
    //border:0;
  }
  
  #tab .item:nth-child(4)
  {
  	border:0px;	
    list-style: none;
    margin:0px;
    flex-grow: 1;
    
  }


</style>
<head>
	<title>Home</title>

<!-- <link rel="stylesheet" href="./resources/css/dateType.css"> -->

<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
 <link href="./resources/css/shop-homepage.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />
<link rel="stylesheet" href="./resources/css/button.css"/>

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
		
		$(".item").mouseenter(function(){
			  if($(this).attr('class') != "item search")
			  {
				  $(this).css('flex-grow',1);
			      $(this).css('font-size',"3em");
			      $(this).css('background-color',"powderblue");
			  }
		     
		    });
		    
		  $(".item").mouseleave(function(){
		      $(this).css('flex-grow',1);
		      $(this).css('font-size',"1.5em");
		      $(this).css('background-color',"white");
		    });
		  
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
          title: '魚種別取引額',
          is3D: true,
          fontSize:23,
          tooltip          : {textStyle : {fontSize:30}, showColorCode : true,trigger: 'both'},
          chartArea:{
        	  	left:20,
        	    right:10, // !!! works !!!
        	    top:40,
        	    width:"100%",
        	    height:"100%"
        	  }
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
              title: "月間取引額",
              chartArea:{
          	    left:100,
          	    bottom:50,  // !!! works !!!
          	    top:50,
          	    width:"100%",
          	    height:"100%"
          	  },
              bar: {groupWidth: "95%"},
              legend: { position: "none" },
              tooltip          : {textStyle : {fontSize:35}, showColorCode : true,trigger: 'both'},
              hAxis              : {textStyle: {fontSize:25}},
    		  vAxis              : {textStyle:{fontSize:25}},
    		  fontSize:20
            };
            var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
            chart.draw(view, options);
        }
    });

	
	
	
</script>

<body>

<input type="hidden" id="userMode" value="${sessionScope.userMode}">
 
<div id="contain">
	<div id="header">
		<div id="chart_div" class="items">
			 <div id="columnchart_values" style="width: 750px; height: 400px;"></div>
			 <div id="piechart_3d" style="width: 600px; height: 400px;"></div>
		</div>
	</div>
	
	<br><br>
	<div id="tab">
		<div class="items">
			<div class="item "><a href="buyListHistory?period=1week">1週間</a></div>
			<div class="item "><a href="buyListHistory?period=1month">1ヶ月</a></div>
			<div class="item "><a href="buyListHistory?period=3month">3ヶ月</a></div>
		</div>
		<div class="items">
			<form action="buyListHistory">
			
				<input type="date" name="startDay" style="height: 50px; font-size: 20px; font-weight: bolder;">
	
				<input type="date" name="endDay" style="height: 50px; font-size: 20px; font-weight: bolder;">
				<button>検索</button>
			</form>
		</div>
	</div>

	
	<div><br></div>
	
	<div ><input id="search_cells" type="search"/></div>
	<table id="jqGrid"></table>
	<div id="jqGridPager"></div>
	<div><Br></div>
	<table id="jqGrid2"></table>
	<div id="jqGrid2Pager"></div>
	
	<div><br></div>
	

	<!-- <div style = "margin-top : 20px; margin-left : 15px; font-size : 12px;">

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

	</div> -->

	
	
	<!-- 리뷰등록을 위해사용 -->
	<input type="hidden" id="buyNum" name="buyNum">
	<input type="hidden" id="sellerId" name="sellerId">
	
	<!-- 판매자상세정보를 위해 사용 -->
	<input type="hidden" id="sellerInfo" name="sellerInfo">
	
	<div><br></div>
	
	<!-- 기간검색--jqgrid위해/다운로드위해 사용 -->
		<div style="margin: 0 auto; width: 550px;">
		<input type="hidden" id="period" value="${period}">
		<input type="hidden" id="startDay" value="${startDay}">
		<input type="hidden" id="endDay" value="${endDay}">
		<a class="myButton" href="download?period=${period}&startDay=${startDay}&endDay=${endDay}" >エクセルファイルにダウンロード</a>
		</div>
	</div>
	
	
</body>
</html>
