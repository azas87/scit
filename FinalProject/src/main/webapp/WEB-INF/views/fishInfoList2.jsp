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
    
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
function newPage()
{
	$('#f_main', parent.document).attr('height', '800px');
	$('#f_main', parent.document).attr('src', 'writeFishInfoForm?');
}


</script>
<style>

.title
{
	font-size: 2em;
}

.content
{
	margin-left: 30px;
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 1.5em;
}

.container
{
	max-width:1400px;
}

.card-title
{
	font-size:3em;
	
}

</style>
  <body>
<div class="contain">
<c:if test="${sessionScope.userMode=='manager'}">
	<div onclick="newPage()" class="myButton">新しい魚種の登録</div>
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
                  <h3 class="card-title" style="color: #3aa9d5;">
                   <strong>${fish.fishName }</strong>
                  </h4>
                  <div class="title"><i class="material-icons prefix">details</i> <b>産地</b></div>
                  <div class="content">
                  	 <i class="material-icons prefix">info_outline</i> 	${fish.locations }
                  	<br>
                  </div>	
                  <div class="title"><i class="material-icons prefix">details</i> <b>旬</b></div>
                  <div class="content">
                  	<i class="material-icons prefix">info_outline</i> ${fish.seasonInfo }
					<br>
					</div>
                  <div class="title"><i class="material-icons prefix">details</i> <b>基本情報</b></div>
                   <div class="content">
                	${fish.fishInfo }
                	<br>
                </div>
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