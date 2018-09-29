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
 		<link rel="stylesheet" type="text/css"jk media="screen" href="./resources/css/home.css" />
 
 <link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 <script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>


<script>
$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
  
	 homeList('allBuyList');
	 bestSeller();
	 seasonInfo();
	//myBuyList();
	///printClock();
	 


	 
	 /*
	 // 자동 글쓰기 테스트.
	 setTimeout(function(){
		 console.log("settimeout");
		 autoWriteTest();
		ListRefresh();
	}, 60000);
		*/
	 
	 // 10분 마다 자동갱신
	 setInterval(function(){
		 console.log(new Date());
		 //ListRefresh();
		
	}, refreshInterver);
	 
	

	    
    $('.search').hover(function(){
        // Hover over code
        var title = $(this).attr('title');
        $(this).data('tipText', title).removeAttr('title');
        $('<p class="tooltip"></p>')
        .text(title)
        .appendTo('body')
        .fadeIn('slow');
	}, function() {
	        // Hover out code
	        $(this).attr('title', $(this).data('tipText'));
	        $('.tooltip').remove();
	}).mousemove(function(e) {
	        var mousex = e.pageX + 20; //Get X coordinates
	        var mousey = e.pageY + 10; //Get Y coordinates
	        $('.tooltip').css({ top: mousey, left: mousex })
	});
	
	$('#jqGrid').jqGrid('navGrid',"#jqGridPager", {                
	    search: false, // show search button on the toolbar
	    add: false,
	    edit: false,
	    del: false,
	    refresh: true,
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
	
	tab('#tab',0);
	
//	$("#popup").attr("href", "./resources/content.jsp");


	// 팝업 띄우기
	//$('#popup').trigger('click');
	
	
	$('.item').click(function(){
		
		$('.item').css('background','url(./resources/img/bg.png) repeat');
		$('.item').css('color','black');
		$('.item').css('border-right','1px solid white');
		$('.item').css('border-radius','0px');
		
		if(($(this).attr('class') == "item search_text"))
		{
			console.log("title");
			$('.search_title').css('background','white');
			$('.search_title').css('color','black');
			$('.search_title').css('border-right','2px solid white');
		}
		
		$(this).css('background','white');
		$(this).css('color','black');
		$(this).css('border-right','2px solid white');
		$(this).css('border-radius','5px'); 
		
		
		/* 
		$('.item').css('background','white');
		$('.item').css('color','black');
		$('.item').css('border-right','1px solid blue');
		$('.item').css('border-left','1px solid blue');
		$('.item').css('border-radius','0px');
		
		$(this).css('background','url(./resources/img/bg.png) repeat');
		$(this).css('color','black');
		$(this).css('border-right','0px');
		$(this).css('border-left','0px');
		$(this).css('border-radius','5px'); */
		
		
	});
	
	/* $('#jqGridPager_left').css('display','none');
	$('#jqGridPager_center').css('width','600px');
	$('#jqGridPager_right').css('padding-right','26px');
	
	
	$('#input_jqGridPager').css('width','600px');
	$('#input_jqGrid2Pager').css('width','600px');
	
	$('.ui-pg-input').css('width','60px');
	
	$('#input_jqGridPager').css('font-size','1.5em');
	$('#input_jqGrid2Pager').css('font-size','1.5em');
	
	$('#jqGrid2Pager_left').css('display','none');
	$('#jqGrid2Pager_center').css('width','530px');
	$('#jqGrid2Pager_center').css('padding-left','50px');
	$('#jqGrid2Pager_right').css('padding-right','26px');
	
	$('#jqGrid2Pager').css('height','50px'); */
		
});
   
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
         			Number('${avgPrice}'),
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
<div>
	<!-- <div id="popup" class="popdown" >알림창 데모</div>-->
	<a id="popup" href="./resources/content.jsp" class="popdown" style="display:none">알림창 데모</a> 
</div>
   <div id="Line_Controls_Chart">
   <!-- 라인 차트 생성할 영역 -->
       <div id="lineChartArea"></div>
   <!-- 컨트롤바를 생성할 영역 -->
       <div id="controlsArea" style="display:none"></div>
     </div>

<div class="smallList">
	<div class="flexs">
		<table id="jqGridbestSeller" ></table><!--상위3개만  -->
	</div>
	<div class="flexs">	
		<table id="jqGridseasonInfo"  class="flexs"></table><!--상위3개만  -->			
	</div>	
</div>	


<div id="tab">
	<div class="items">
		<div class="item " id="homeList"  onclick="homeList()">取引リスト</div>
		<c:choose>
			<c:when test="${sessionScope.userMode == 'buyer' }">
				<div class="item " id="myList_ing_buyer" onclick="myList_ing_buyer()">注文要望リスト</div>
				<div class="item " id="myAllList_buyer" onclick="myAllList_buyer()">取引済みリスト</div>
			</c:when>
			<c:when test="${sessionScope.userMode == 'seller' }">
				<!-- <div class="item " onclick="myList_ing_seller()">선호리스트</div> -->
				<div class="item " id="sellerWishList" onclick="sellerWishList()">関心リスト</div>
				<div class="item " id="myList_ing_seller" onclick="myList_ing_seller()">参加リスト</div>
			</c:when>
		</c:choose>
		<!-- <div class="item search" title="검색어">検索 : <input type="text" id="search_cells" title=""></div> -->
		
			<div class="item search_title" >検索</div>
			<div class="item search_text">
				<input type="text" id="search_cells" title="">
			</div>
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