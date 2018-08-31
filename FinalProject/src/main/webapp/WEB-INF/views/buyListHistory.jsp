<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 	<script src="//www.google.com/jsapi"></script> -->
	<script type="text/javascript" src="./resources/js/buyListHistory.js" ></script>
	
 	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type='text/javascript'>
      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        data.addColumn('number', 'Kepler-22b mission');
        data.addColumn('string', 'Kepler title');
        data.addColumn('string', 'Kepler text');
        data.addColumn('number', 'Gliese 163 mission');
        data.addColumn('string', 'Gliese title');
        data.addColumn('string', 'Gliese text');
        data.addRows([
          [new Date(2314, 2, 15), 12400, undefined, undefined,
                                  10645, undefined, undefined],
          [new Date(2314, 2, 16), 24045, 'Lalibertines', 'First encounter',
                                  12374, undefined, undefined],
          [new Date(2314, 2, 17), 35022, 'Lalibertines', 'They are very tall',
                                  15766, 'Gallantors', 'First Encounter'],
          [new Date(2314, 2, 18), 12284, 'Lalibertines', 'Attack on our crew!',
                                  34334, 'Gallantors', 'Statement of shared principles'],
          [new Date(2314, 2, 19), 8476, 'Lalibertines', 'Heavy casualties',
                                  66467, 'Gallantors', 'Mysteries revealed'],
          [new Date(2314, 2, 20), 0, 'Lalibertines', 'All crew lost',
                                  79463, 'Gallantors', 'Omniscience achieved']
        ]);

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }
    </script>


<body>

<div id="chart_div"></div>

<table border="1">

	<tr>
		<th>購買日付</th>
		<th>品種</th>
		<th>産地</th>
		<th>重量</th>
		<th>価格</th>
		<th>販売者ID</th>
		<th>再購入</th>
	</tr>
	
	<c:forEach var="buylist" items="${buyListHistory}">	
	<tr>
		<td>${buylist.get("DEADLINE")}</td>
		<td>${buylist.get("FISHNAME")}</td>
		<td>${buylist.get("BUYLOCATION")}</td>
		<td>${buylist.get("WEIGHT")}</td>
		<td>${buylist.get("PRICE")}</td>
		<td><a href="#">${buylist.get("SUCCESSSELLERID")}</a></td>
		<td><button type="button" 
		onclick="writeBuyBoard('${buylist.get("FISHNAME")}', '${buylist.get("FISHNUM")}', '${buylist.get("BUYLOCATION")}', '${buylist.get("SUCCESSSELLERID")}')">
		再購入へ</button></td>
	</tr>
	</c:forEach>
	
</table>
</body>
</html>
