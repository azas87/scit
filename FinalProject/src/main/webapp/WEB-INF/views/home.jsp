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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.js"></script>
<script>
$(document).ready(function()
  {
	printClock();
	
    $(".item").mouseenter(function(){
      $(this).css('flex-grow',1);
      $(this).css('font-size',"3.5em");
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

</script>
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
    	font-size:3.5em Arial;
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
</head>
<body>
	<div id="contain">
		<div id="header">
			<div id="clock">	</div>
		</div>

		<div id="nav">
			<p>NAVIGATION</p>
      <div class="items">
        <div class="item " title="Click button"><a href="loginForm?">로그인</a></div>
        <div class="item " title="Drag button"><a href="joinForm?">회원가입</a></div>
        <div class="item " title="Select button"><a href="writeBuyBoardForm?">글등록</a></div>
        <div class="item " title="Double Click"><a href="buyListHistory?">구매내역</a></div>
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
</body>
</html>
</head>
<body>
