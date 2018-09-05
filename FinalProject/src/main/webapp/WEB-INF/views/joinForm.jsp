<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
 <script type="text/javascript" src="./resources/js/joinForm.js" ></script>
<!-- <script type="text/javascript" src="./resources/js/joinFormAJax.js" ></script> -->
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
.items {
    display: flex;
    flex-direction: row;
    height:80px;    

  }
.item{
    line-height: 80px;
    list-style: none;
    margin:0px;
    flex-grow: 1;
    text-align: left;
  }
</style>
<script>
$(document).ready(function()
  {
	
    $(".item").mouseenter(function(){
      $(this).css('flex-grow',1);
      $(this).css('font-size',"2em");
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
</script>
</head>
<body>
	<div id="contain">
		


			<form action="join" method="post" >

        <h1>Sign Up</h1>

        <fieldset>
          <legend><span class="number">1</span>ログイン情報</legend>

					<div id="items">
						<div class="item " title="Click button">
							<label for="name"><strong class="star">*</strong>ログインID</label>
		          			<input type="text" id="userid" name="id">
		          			<button id="btn" type="button">ID CHECK</button>
						</div>
						<div class="item " title="Click button">
							<label for="password"><strong class="star">*</strong>パスワード </label>
		          			<input type="password" id="userpwd" name="password"　placeholder="半角数字11桁">
		        　　　　　			
						</div>
						<div class="item " title="Click button">
							<label for="password2"><strong class="star">*</strong>パスワードを再入力してください</label>
		          			<input type="password" id="userpwd2" name="userpwd2">
		          		</div>
						<div class="item " title="Click button">
							<label for="email"><strong class="star">*</strong>email</label>
					        <input type="email" id="email" name="email">
					    </div>
					    <div class="item " title="Click button">
					        　　　　<label for="email2"><strong class="star">*</strong>emailを再入力してください</label>
					        <input type="text" name="nameKana"> 주소<input type="text" name="address">
					     	<input type="hidden" name="grade"/>
					     </div>
						 <legend><span class="number">2</span>あなたの情報</legend>
						
						<div class="item " title="Click button">
							<label for="username"><strong class="star">*</strong>氏名 </label>
							<input type="text" id="name" name="name">
							<label for="namekana"><strong class="star">*</strong>氏名（カナ) </label>
							<input type="text" id="namekana" name="namekana">
						</div>
						<div class="item " title="Click button">
							<label for="birth"><strong class="star">*</strong>生年月日:</label>
					        <select id="birthYear" name="birthYear">
						        <c:forEach begin="1920" end="2018" var="x" step="1">
						        	<option value="${3938-x}">${3938-x}</option>
						        </c:forEach>
					        </select>年
						</div>
						<div class="item " title="Click button">
							<select id="birthMonth" name="birthMonth">
					          <c:forEach begin="1" end="12" var="x" step="1">
					          	<option value="${x}">${x}</option>
					          </c:forEach>
		        	 		</select>月
						</div>
						<div class="item " title="Click button">
							<select id="birthDate" name="birthDate">
					        <c:forEach begin="1" end="31" var="x" step="1">
					        	<option value="${x}">${x}</option>
					        </c:forEach>
					        </select>日
						</div>
						<div class="item " title="Click button">
							<label><strong class="star">*</strong>学生・職業 :</label>
					        <select id="work" name="work">
						        <option value="高校１年生">高校１年生</option>
						      	<option value="高校２年生">高校２年生</option>
						      	<option value="高校３年生">高校３年生</option>
						      	<option value="高校４年生">高校４年生</option>
						      	<option value="高校生以外の学生">高校生以外の学生</option>
						      	<option value="社会人">社会人</option>
						      	<option value="先生">先生</option>
						      	<option value="保護者">保護者</option>
						      	<option value="日本への留学生">日本への留学生</option>
					      		<option value="その他">その他</option>
					      	 </select>
						</div>
						<div class="item " title="Click button">
							<label>性別 :</label>
				          <input type="radio" id="male" value="male" name="gender">男性
				          <input type="radio" id="female" value="female" name="gender">女性
				          </div>
				        <div class="item " title="Click button">
				        	<label for="phone">電話番号:</label>
				        	<input type="text" id="phone" name="phone" placeholder="ハイフンなしの半角数字11桁">
						</div>
        </fieldset>

        <button id="btn2" onclick="return check()">완료</button>
      </form>
		</div>




</body>
</html>
