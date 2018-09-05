<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	
<!-- 	<style>
	#columnchart_values { float:left;  }
	#piechart_3d{ float:right;  }
	</style> -->
	<link rel="stylesheet" href="./resources/css/alertify.core.css" />
	<link rel="stylesheet" href="./resources/css/alertify.default.css" id="toggleCSS" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="./resources/js/buyListHistory.js" ></script>
    <script src="./resources/js/alertify.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
    
    
    $(function(){
      	google.charts.load("current", {packages:["corechart"]});
      	google.charts.setOnLoadCallback(drawPieChart);
      	google.charts.setOnLoadCallback(drawHistogram);
      	
    //원형그래프
      function drawPieChart() {
    	var dataChart = [['Task', 'Hours per Day']];
    	<c:forEach items="${sumPricebyFishName}" var="item">
    		dataChart.push(["${item.fishName}",Number("${item.price}")]);
    	</c:forEach> 

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
      function drawHistogram() {
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

<table border="1">

	<tr>
		<th>購買日付</th>
		<th>品種</th>
		<th>産地</th>
		<th>重量</th>
		<th>価格</th>
		<th>販売者ID</th>
		<th>再購入</th>
		<th>受け取り確認</th>
	</tr>
	
	<c:forEach var="buylist" items="${buyListHistory}">	
	<tr>
		<td id="deadline">${buylist.deadline}</td>
		<td>${buylist.fishName}</td>
		<td>${buylist.location}</td>
		<td>${buylist.weight}</td>
		<td>${buylist.price}</td>
		<td><a href="#">${buylist.successSellerId}</a></td>
			
			<form action="writeBuyBoardForm">
				<input type="hidden" name="fishName" value="${buylist.fishName}">
				<input type="hidden" name="location" value="${buylist.location}">
				<input type="hidden" name="successSellerId" value="${buylist.successSellerId}">
				<td><button>再購入へ</button></td>
			</form>
			
		<td><input type="button" class="confirm" data="${buylist.buyNum}" value="受け取り確認"></td>
			
	</tr>
	</c:forEach>
	
</table>
</body>
</html>
