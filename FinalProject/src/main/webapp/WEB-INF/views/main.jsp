<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
<link rel="stylesheet" type="text/css"jk media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- 없어도 동작에 문제 없네 
<script type="text/javascript" src="./resources/js/jquery.jqGrid.js"></script> -->


 <!-- The jQuery library is a prerequisite for all jqSuite products -->
 <script type="text/javascript" src="./resources/js/jquery.min.js"></script> 
 <script type="text/javascript" src="./resources/js/jquery-ui.min.js"></script>
 <!-- 위에 2개없어도 동작은 하는데? 어디서 쓰고 있는거지? -->


 <!-- This is the localization file of the grid controlling messages, labels, etc.
 <!-- We support more than 40 localizations -->
 <script type="text/javascript"	src="./resources/js/i18n/grid.locale-ja.js"></script>
 
 <script type="text/javascript" src="./resources/js/jquery.jqGrid.min.js"></script>
 <script type="text/javascript" src="./resources/js/main.js"></script>
 
 	<link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 		<script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>
 		<link rel="stylesheet" type="text/css"jk media="screen" href="./resources/css/main.css" />
 
 <link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 <script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>
 
 <link rel="stylesheet" type="text/css" media="screen" href="./resources/css/alertify.core.css" />
<link rel="stylesheet" href="./resources/css/alertify.default.css" id="toggleCSS" />

<script type="text/javascript" src="./resources/js/alertify.js"></script>
<script type="text/javascript" src="./resources/js/alertify.min.js"></script>


<script>
$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
});
   
   
//jstl 을 사용하고 있어서 못 옮김.
var chartDrowFun = {

  chartDrow : function(){[]
      var chartData = '';

      //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
      var chartDateformat     = 'yy/MM/dd';
      //라인차트의 라인 수
      var chartLineCount    = 10;
      //컨트롤러 바 차트의 라인 수
      var controlLineCount    = 10;


      function drawDashboard() {

        var data = new google.visualization.DataTable();
        //그래프에 표시할 컬럼 추가
        data.addColumn('date', 'Date');
	    data.addColumn('number', '${list[0].fishName}');
	    data.addColumn('number', '${list[1].fishName}');
	    data.addColumn('number', '${list[2].fishName}');
	    data.addColumn('number', '${list[3].fishName}');
	    data.addColumn('number', '${list[4].fishName}');

        //그래프에 표시할 데이터

        data.addRows([
       	 <c:forEach items="${list}" var="item">
         	[new Date('${item.dates}'),
         		<c:forEach items="${item.avgList}" var="avgPrice">
         			${avgPrice},
         		</c:forEach>	
         	], 
     	</c:forEach> 
        ]);


          var chart = new google.visualization.ChartWrapper({
            chartType   : 'LineChart',
            containerId : 'lineChartArea', //라인 차트 생성할 영역
            options     : {
                            isStacked   : 'percent',
                            focusTarget : 'category',
                            //chartArea:{left:300,top:50,width:"1000px",height:"500px"},
                            chartArea:{
				        	  	left:200,
				        	    right:70, // !!! works !!!
				        	    top:100,
				        	  },
                            height          : 600,
                            width              : 1400,
                            legend          : { position: "top", textStyle: {fontSize: 30}},
                            pointSize        : 15,
                            tooltip          : {textStyle : {fontSize:50}, showColorCode : true,trigger: 'both'},
                            hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                years : {format: ['yy/']},
                                                                months: {format: ['MM/']},
                                                                days  : {format: ['dd']}}
                                                              },textStyle: {fontSize:25}},
                             vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:35}},

              animation        : {startup: true,duration: 100,easing: 'in' },
             
            },
            
          });

          var control = new google.visualization.ControlWrapper({
            controlType: 'ChartRangeFilter',
            containerId: 'controlsArea',  //control bar를 생성할 영역
            options: {
                ui:{
                      chartType: 'LineChart',
                      chartOptions: {
                      chartArea: {'width': '60%','height' : 80},
                        hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                          gridlines:{count:controlLineCount,units: {
                                years : {format: ['yyyy년']},
                                months: {format: ['MM월']},
                                days  : {format: ['dd일']},
                                hours : {format: ['HH시']}}
                          }}
                      }
                },
                  filterColumnIndex: 0
              }
          });

           var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
          date_formatter.format(data, 0); 

          var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
         // window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
          dashboard.bind([control], [chart]);
          dashboard.draw(data);

      }
        google.charts.setOnLoadCallback(drawDashboard);

    }
  }
 </script>
 
 
<title>Insert title here</title>
</head>
<body>
	<!-- 알림창ㄴ -->
	<div>
		<a id="popup" href="./resources/content.jsp" class="popdown" style="display: none"></a>
	</div>
	
	<!-- 구글 차트 -->
	<div id="Line_Controls_Chart">
		<div id="lineChartArea"></div>
		<div id="controlsArea" style="display: none"></div>
	</div>

	<!-- 베스트 셀러, 시즌 추천 -->
	<div class="smallList">
		<div class="flexs">
			<table id="jqGridbestSeller"></table>
		</div>
		<div class="flexs">
			<table id="jqGridseasonInfo" class="flexs"></table>
		</div>
	</div>


	<div id="tab">
		<div class="items">
			<div class="item " id="homeList" onclick="homeList()">取引リスト</div>
			<c:choose>
				<c:when test="${sessionScope.userMode == 'buyer' }">
					<div class="item " id="myList_ing_buyer"
						onclick="myList_ing_buyer()">購買要請中</div>
					<div class="item " id="myAllList_buyer" onclick="myAllList_buyer()">注文要望</div>
				</c:when>
				<c:when test="${sessionScope.userMode == 'seller' }">
					<!-- <div class="item " onclick="myList_ing_seller()">선호리스트</div> -->
					<div class="item " id="sellerWishList" onclick="sellerWishList()">関心リスト</div>
					<div class="item " id="myList_ing_seller"
						onclick="myList_ing_seller()">参加リスト</div>
				</c:when>
			</c:choose>
			<div class="item search_title">検索</div>
			<div class="item search_text">
				<input type="text" id="search_cells" title="">
			</div>
		</div>
	</div>

	<div id="list">
		<div>
			<table id="jqGrid"></table>
			<div id="jqGridPager"></div>
		</div>
	</div>

	<input type="hidden" id="sellerInfo" name="sellerInfo">
	<input type="hidden" id="userMode" value="${sessionScope.userMode}">

</body>
</html>