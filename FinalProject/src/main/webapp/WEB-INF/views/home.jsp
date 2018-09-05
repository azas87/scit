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
	<style>
		div{
			border:1px solid #cccccc;
			padding:5px;
			margin: 5px;
			text-align: center;
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
    }

		#contain
		{
			width:800px;
			margin: 0 auto;
			overflow: hidden;
		}

		#header{
			width:780px;
			
			line-height:100px;
			
			color:#666;
			font-size:100px;
			text-align:center;
		}

		#nav{
			width:780px;
			height:200px;
		}

    #nav .items {
    display: flex;
    flex-direction: row;
    height:130px;

  }
  #nav .item{
    line-height: 130px;
    list-style: none;
    margin:0px;
    flex-grow: 1;
    //border:0;
  }
   /* #nav .item:nth-child(1)
  {

  } */

		#wrap{
			width:780px;
			overflow:hidden;
		}

		#content{
			width:600px;
			height:500px;
			float:left;


		}



		#content #hit ul, #content #fav ul
		{
			overflow:hidden;
			width:600px;
			padding:0px;
			margin: 0px 0px 0px 10px;
		}

		#content #hit ul li, #content #fav ul li
		{
			width:135px;
			height:230px;
			float:left;
			border:1px solid #dddddd;
			list-style: none;
			line-height: 220px;
			box-sizing:border-sizing;
			margin-right: 5px;
		}

		#content #hit ul li, #content #fav ul li
		{
			width:135px;
			height:230px;
			float:left;
			border:1px solid #dddddd;
			list-style: none;
			line-height: 220px;
			box-sizing:border-sizing;
		}


		#banner{
			width:135px;
			height:500px;
			float:left;
		}

		#footer{
			width:780px;
			height:100px;
			line-height: 100px;
		}
	</style>


<!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/jquery-ui.css" />
<!-- The link to the CSS that the grid needs -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/css/ui.jqgrid.css" />

<script type="text/javascript" src="./resources/js/buyListHistory.js"></script>
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
 
 
<script>
$(document).ready(function() {
	 homeList('allBuyList');
});

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function homeList(url2) {
	$("#jqGrid").jqGrid({
		url : url2,
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
				label : '購買日付',
				name : 'deadline',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 100,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '販売者ID',
				name : 'successSellerId',
				width : 100,
				height : 200,
				align:'center'
			}, {
				label : '再購入1',
				name : '再購入2',
				width : 100,
				height : 200,
				formatter: rebuy,
				align:'center'
			},

		],
		viewrecords : true,
		width : 950,
		height : 400,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		shrinkToFit : false,
		
		loadComplete:function(data)
		{
			$('.bigSize').hover(function(){
				console.log("test");
				var title = $(this).attr('title');
				$(this).data('tipText', title).removeAttr('title');
				$('<p class="tooltip"></p>').text(title).appendTo('body').fadeIn('slow');
			},
			function() {
				$(this).attr('title',$(this).data('tipText'));
				$('.tooltip').remove();
			}).mousemove(function(e) {
				var mousex = e.pageX + 20;
				var mousey = e.pageY + 10;
				$('.tooltip').css({top : mousey,left : mousex});
			});
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")
    		{	
       		 	//console.log(jQuery("#jqGrid").getRowData(rowid));
    		} 
    	},
    	
	});
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

$(document).ready(function()
{
	printClock();
	
    $(".item").mouseenter(function(){
      $(this).css('flex-grow',1);
      $(this).css('fo9/nt-size',"3.5em");
      $(this).css('background-color',"powderblue");
    });
    
    $(".item").mouseleave(function(){
      $(this).css('flex-grow',1);
      $(this).css('font-size',"1em");
      $(this).css('background-color',"white");
    });

    $('.item').hover(function(){
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

 /* 	$("#jqGrid").jqGrid({
		url : 'allBuyLilst',
		mtype : "GET",
		datatype : "json",
		colModel : 
		[ 
			{
				label : '購買日付',
				name : 'deadline',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '品種',
				name : 'fishName',
				width : 150,
				height : 200,
				align:'center'
			}, {
				label : '産地',
				name : 'location',
				width : 100,
				height : 200,
				align:'center'
			}, {
				label : '重量',
				name : 'weight',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '価格',
				name : 'price',
				width : 80,
				height : 200,
				align:'center'
			}, {
				label : '販売者ID',
				name : 'successSellerId',
				width : 100,
				height : 200,
				align:'center'
			}, {
				label : '再購入1',
				name : '再購入2',
				width : 100,
				height : 200,
				formatter: rebuy,
				align:'center'
			},

		],
		viewrecords : true,
		width : 950,
		height : 400,
		rowNum : 10,
		rowList:[10,20,30],
		pager : "#jqGridPager",
		loadonce: true,
		shrinkToFit : false,
		
		loadComplete:function(data)
		{
			$('.bigSize').hover(function(){
				console.log("test");
				var title = $(this).attr('title');
				$(this).data('tipText', title).removeAttr('title');
				$('<p class="tooltip"></p>').text(title).appendTo('body').fadeIn('slow');
			},
			function() {
				$(this).attr('title',$(this).data('tipText'));
				$('.tooltip').remove();
			}).mousemove(function(e) {
				var mousex = e.pageX + 20;
				var mousey = e.pageY + 10;
				$('.tooltip').css({top : mousey,left : mousex});
			});
		},
		gridComplete: function(){
		},
		onCellSelect: function(rowid, index, contents, event) 
    	{    
    		var cm = $(this).jqGrid('getGridParam','colModel');    
    		if(cm[index].name == "再購入2")
    		{	
       		 	//console.log(jQuery("#jqGrid").getRowData(rowid));
    		} 
    	},
    	
	}); */
	
	
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
    
}); 

function rebuy (cellvalue, options, rowObject) {
	 //console.log(rowObject);
	   return '<a href="#">再購入</a>'; 
	 };
	 
	 
	 $("#search").on("click",function(){
	      var data = $("#searchData").val()
	     var searchType = $("#searchType").val();
	     var rows = $("[title ='Records per Page']").val();
	     var postData  = {'data' : data , 'searchType' : searchType, 'rows' :  rows }


	     rowData = null


	     $("#jqGrid").jqGrid("clearGridData", true);


	     $("#jqGrid").setGridParam({
	    	 datatype	: "json",
	    	 postData	: postData,
	    	 loadComplete	: function(data) {
	    		 console.log(data);
	    	 }
	     }).trigger("reloadGrid");
	});
	

   	function allBuyList() {	
   		alert("all");
   		homeList('allBuyList');
   		//location.href="allBuyList?";
   	}

   	function myBuyList() {		
   		alert("my");
   		homeList('myBuyList');
   		//location.href="myBuyList?";
   	}

</script>
	
	
</head>
<body>
 	<div id="contain">
		<div id="header">
			<div id="clock">	</div>
		</div>

		<div id="nav">
			<p>NAVIGATION</p>
      <div class="items">
        <div class="item " title="로그인"><a href="loginForm?">로그인</a></div>
        <div class="item " title="회원가입"><a href="joinForm?">회원가입</a></div>
        <div class="item " title="글등록"><a href="writeBuyBoardForm?">글등록</a></div>
        <div class="item " title="구매내역"><a href="buyListHistory?">구매내역</a></div>
      </div>
		</div>

		<div id="wrap">
			<div id="content">
				<div id="hit">
					<ul>
						<li>hit1</li>
						<li>hit2</li>
						<li>hit3</li>
						<li>hit4</li>
					</ul>
				</div>
				<div id="fav">
					<ul>
						<li>fav1</li>
						<li>fav2</li>
						<li>fav3</li>
						<li>fav4</li>
					</ul>
				</div>
			</div>
			<div id="banner">BANNER</div>
		</div>

		<div id="footer">
			FOOTER
		</div>
	</div>

 

	
<input type="button" value="전체품목(리스트)" id="allBuyList" class="allBuyList" onclick="allBuyList()">
<input type="button" value="나의품목(리스트)" id="myBuyList" class="myBuyList" onclick="myBuyList()"><br>



<%-- <table border="1">
	<tr>
		<th>품종</th><th>원산지</th><th>중량</th><th>가격</th><th>구매자</th>
	</tr>

 	<c:forEach var="a" items="${buylist}" >
	<tr>
		<td>${a.fishName}</td>
		<td>${a.location}</td>
		<td>${a.weight}</td>
		<td>${a.price}</td>
		<td>${a.buyerId}</td>
	</tr>
	</c:forEach>	
</table> --%>

	<table id="jqGrid"></table>
	<div id="jqGridPager"></div>
	<div>test 김동규2 </div>

</body>
</html>
</head>
<body>
