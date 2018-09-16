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
 <script>
	
	   
	   
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
			                              height          : 600,
			                              width              : '100%',
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
			               
			              }
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
			            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
			            dashboard.bind([control], [chart]);
			            dashboard.draw(data);
			 
			        }
			          google.charts.setOnLoadCallback(drawDashboard);
			 
			      }
			    }
			 
			$(document).ready(function(){
			  google.charts.load('current', {'packages':['line','controls']});
			  chartDrowFun.chartDrow(); //chartDrow() 실행
			}); 
 </script>
 <link rel="stylesheet" href="./resources/css/jquery.popdown.css">
 <script type="text/javascript" src="./resources/js/jquery.popdown.js" /></script>

<!-- 경고창 -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/alertify.core.css" />
<link rel="stylesheet" href="./resources/css/alertify.default.css" id="toggleCSS" />
<script type="text/javascript" src="./resources/js/alertify.js"></script>
<script type="text/javascript" src="./resources/js/alertify.min.js"></script>

	
</head>


<style>
/* Popup box BEGIN */
.hover_bkgr_fricc{
    background:rgba(0,0,0,.4);
    cursor:pointer;
    display:none;
    height:100%;
    position:fixed;
    text-align:center;
    top:0;
    width:100%;
    z-index:10000;
}
.hover_bkgr_fricc .helper{
    display:inline-block;
    height:100%;
    vertical-align:middle;
}
.hover_bkgr_fricc > div {
    background-color: #fff;
    box-shadow: 10px 10px 60px #555;
    display: inline-block;
    height: auto;
    max-width: 551px;
    min-height: 200px;
    vertical-align: middle;
    width: 60%;
    position: relative;
    border-radius: 8px;
    padding: 15px 5%;
}
.popupCloseButton {
    background-color: #fff;
    border: 3px solid #999;
    border-radius: 50px;
    cursor: pointer;
    display: inline-block;
    font-family: arial;
    font-weight: bold;
    position: absolute;
    top: -20px;
    right: -20px;
    font-size: 25px;
    line-height: 30px;
    width: 30px;
    height: 30px;
    text-align: center;
}
.popupCloseButton:hover {
    background-color: #ccc;
}
.trigger_popup_fricc {
    cursor: pointer;
    font-size: 20px;
    margin: 20px;
    display: inline-block;
    font-weight: bold;
}
/* Popup box BEGIN */


.legend
{
	font-size: 20px;
}

</style>
<script>

$(window).load(function () {
    $(".trigger_popup_fricc").click(function(){
       $('.hover_bkgr_fricc').show();
    });
   
    $('.popupCloseButton').click(function(){
        $('.hover_bkgr_fricc').hide();
    });
});

function reset () {
	$("#toggleCSS").attr("href", "./resources/css/alertify.default.css");
	alertify.set({
		labels : {
			ok     : "OK",
			cancel : "Cancel"
		},
		delay : 5000,
		buttonReverse : false,
		buttonFocus   : "ok"
	});
}


function cancel() {
	
	reset();
	alertify.prompt("パスワードをもう一度入力してください。", function (e, str) {
		if (e) {
			alertify.success("You've clicked OK and typed: " + str);
			
			$.ajax({
				url:"cancel",
				type:"post",
				data:{"password":str,
					  },
				success:function(data){
					alert('성공');
				},
				error:function(){
					alert("통신실패");
				}
			});
	
			
			
		} else {
			alertify.error("You've clicked Cancel");
		}
	}, "");
	return false;
}



</script>
<body>

   <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
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



<div class="hover_bkgr_fricc">
    <span class="helper"></span>
    <div>
        <div class="popupCloseButton">X</div>
        <form action="checkingStatus">
        	<input type="radio" name="grade" value="newResitration">新規登録
			<input type="radio" name="grade" value="reentrance">再登録<br>
		
			<input type="radio" name="memberStatus" value="seller">購入者
			<input type="radio" name="memberStatus" value="buyer">販売者<br>
			<input type="submit" value="確認">
    	</form>
    </div>
</div>

<div><Br></div>

<div id="contain">

<!-- 	<div id="header">
		<div id="clock">	</div>
		
	</div> -->
	<div id="nav">
		<div class="items">
			<c:choose>
				<c:when test="${sessionScope.loginId == null }">

					<div class="item" ><a href="loginForm?">로그인</a></div>
					<div class="item " ><a class="trigger_popup_fricc">회원가입</a></div>
				</c:when>
				
				<c:when test="${sessionScope.loginId != null }">
					<div class="item" ><a href="logOut?">로그아웃</a></div>
					<div class="item" ><a href="writeBuyBoardForm?">글등록</a></div>
					<div class="item" ><a href="buyListHistory?">구매내역</a></div>
					<div class="item" ><a href="javascript:void(0);" onclick="cancel(); return false;">탈퇴</a></div>

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

<div><Br></div>


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
