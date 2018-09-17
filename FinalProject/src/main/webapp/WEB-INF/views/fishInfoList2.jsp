<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./resources/css/shop-homepage.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script src="./resources/js/bootstrap.bundle.min.js"></script>

  </head>
  
<script>
$(function(){
	$(".update").click(updateFishInfo);
	$(".delete").click(deleteFishInfo);
});

function updateFishInfo() {
	var fishName = $(this).parent().children(".fishName").val();
	
	location.href="deleteFishInfo?fishName="+fishName;
}
function deleteFishInfo() {
	var fishName = $(this).parent().children(".fishName").val();
	alert(fishName);
	location.href="updateFishInfoForm?fishName="+fishName;
}
</script>
<style>



.myButton {
	-moz-box-shadow:inset -8px 7px 7px -2px #9fb4f2;
	-webkit-box-shadow:inset -8px 7px 7px -2px #9fb4f2;
	box-shadow:inset -8px 7px 7px -2px #9fb4f2;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #567ec4), color-stop(1, #476e9e));
	background:-moz-linear-gradient(top, #567ec4 5%, #476e9e 100%);
	background:-webkit-linear-gradient(top, #567ec4 5%, #476e9e 100%);
	background:-o-linear-gradient(top, #567ec4 5%, #476e9e 100%);
	background:-ms-linear-gradient(top, #567ec4 5%, #476e9e 100%);
	background:linear-gradient(to bottom, #567ec4 5%, #476e9e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#567ec4', endColorstr='#476e9e',GradientType=0);
	background-color:#567ec4;
	-moz-border-radius:13px;
	-webkit-border-radius:13px;
	border-radius:13px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Impact;
	font-size:26px;
	font-weight:bold;
	padding:13px 66px;
	text-decoration:none;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #476e9e), color-stop(1, #567ec4));
	background:-moz-linear-gradient(top, #476e9e 5%, #567ec4 100%);
	background:-webkit-linear-gradient(top, #476e9e 5%, #567ec4 100%);
	background:-o-linear-gradient(top, #476e9e 5%, #567ec4 100%);
	background:-ms-linear-gradient(top, #476e9e 5%, #567ec4 100%);
	background:linear-gradient(to bottom, #476e9e 5%, #567ec4 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#476e9e', endColorstr='#567ec4',GradientType=0);
	background-color:#476e9e;
}
.myButton:active {
	position:relative;
	top:1px;
}
.contain{
	width: 345px;
	height: 100px;
	margin: 0 auto;

}
</style>
  <body>
<div class="contain">
<c:if test="${sessionScope.userMode=='manager'}">
	<a href="writeFishInfoForm?" class="myButton">新しい魚種の登録</a>
</c:if>
</div>
    <!-- Page Content -->
    <div class="container">

      <div class="row">

      
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

    
          <div class="row">

            <c:forEach items="${fishList}" var="fish">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">

                <a href="#"></a>
                <div class="card-body">
                <ul>
                  <h4 class="card-title">
                   <strong><a href="#">${fish.fishName }</a></strong>
                  </h4>
                  <li><h5>産地</h5>
                  	${fish.locations }
                  	<br>
                  <li><h5>旬</h5>
                  	${fish.seasonInfo }
					<br>
                  <li><h5>基本情報</h5>
                	${fish.fishInfo }
                	<br>
                </ul>
                </div>
               
                <div class="card-footer" style="background-color: #3aa9d5; ">
                <div style="float: right;">
                	<small class="text-muted">
                	<c:if test="${sessionScope.userMode=='manager'}">
                		<img src="./resources/img/icons8-trash-26.png" class="update">
                		<img src="./resources/img/icons8-pencil-26.png" class="delete">
                		<input type="hidden" class="fishName" name="fishName" value="${fish.fishName}">
                	</c:if>
                	</small>
               	</div>
                </div>
              </div>
            </div>
		</c:forEach>
 

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
  

  </body>

</html>