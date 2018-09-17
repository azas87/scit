<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/writeBuyBoardForm.css"/>
<link href='https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
  <link href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css' rel='stylesheet' type='text/css'>
  <link href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/css/bootstrap-switch.css' rel='stylesheet' type='text/css'>
  <link href='https://davidstutz.github.io/bootstrap-multiselect/css/bootstrap-multiselect.css' rel='stylesheet' type='text/css'>
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js' type='text/javascript'></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/js/bootstrap.min.js' type='text/javascript'></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js' type='text/javascript'></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/js/bootstrap-switch.min.js' type='text/javascript'></script>
  <script src='https://davidstutz.github.io/bootstrap-multiselect/js/bootstrap-multiselect.js' type='text/javascript'></script>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="./resources/js/WriteBuyBoard.js" ></script> -->
<style>

.indent-small {
  margin-left: 5px;
}
.form-group.internal {
  margin-bottom: 0;
}
.dialog-panel {
  margin: 10px;
}
.datepicker-dropdown {
  z-index: 200 !important;
}
.panel-body {
  background: #e5e5e5;
  /* Old browsers */
  background: -moz-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* FF3.6+ */
  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #e5e5e5), color-stop(100%, #ffffff));
  /* Chrome,Safari4+ */
  background: -webkit-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* Chrome10+,Safari5.1+ */
  background: -o-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* Opera 12+ */
  background: -ms-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* IE10+ */
  background: radial-gradient(ellipse at center, #e5e5e5 0%, #ffffff 100%);
  /* W3C */
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e5e5e5', endColorstr='#ffffff', GradientType=1);
  /* IE6-9 fallback on horizontal gradient */
  font: 600 15px "Open Sans", Arial, sans-serif;
  
}
label.control-label {
  font-weight: 600;
  color: #777;
}


.box { 
 width: 200px; /* 원하는 너비설정 */
 }


</style>


<script>
$(document).ready(function() {  
	  $('.multiselect').multiselect();
	  $('.datepicker').datepicker();  
	});

</script>
<body>

  <div class='container'>
    <div class='panel panel-primary dialog-panel'　>
      <div class='panel-heading' style="background-color: #3aa9d5;">
        <h5>新しい魚種情報</h5>
      </div>
      <div class='panel-body'>
        <form class='form-horizontal' role='form'  action="updateFishInfo">
  
		 <div class='form-group'></div>
		
          <div class='form-group'>
            <label class='control-label col-md-2 col-md-offset-2' for='id_accomodation'></label>
            <div class='col-md-2'>	
            	<div class="dropdown">
            	 <input type="hidden" class='form-control' id ="fishName" value="${fish.fishName}"/>
			</div>
            </div>
          </div>
   
 		  <div class='form-group'>
            <label class='control-label col-md-2 col-md-offset-2' for='id_adults'>魚種</label>
            <div class='col-md-8'>
              <div class='col-md-2'>
                <div class='form-group internal'>
                   <input type="text" class='form-control' id ="fishName" name="fishName" value="${fish.fishName}" readonly="readonly"/>
                </div>
              </div>
            </div>
          </div> 
          <div class='form-group'>
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>カテゴリ</label>
            <div class='col-md-8'>
              <div class='col-md-2'>
                <div class='form-group internal'>
               	<select id="fishCategoryNum" name="fishCategoryNum" class='form-control'> 
               		<c:forEach var="category" items="${categoryList}">
						<option value="${category.fishCategoryNum}">${category.categoryName}</option>
					</c:forEach>
               	</select>
                </div>
              </div>
            </div>
          </div>
          
          <div class='form-group'>
            <label class='control-label col-md-2 col-md-offset-2' for='id_adults'>規格</label>
            <div class='col-md-8'>
              <div class='col-md-2'>
                <div class='form-group internal'>
                   <input type="text" class='form-control' id ="unit" name="unit" value="${fish.unit}"/>
                </div>
              </div>
            </div>
          </div>
          <div class='form-group'>
            <label class='control-label col-md-2 col-md-offset-2' for='id_email'>旬</label>
             <div class='col-md-8'>
              <div class='col-md-2'>
                <div class='form-group internal'>
                  <input type="text" class='form-control' id ="seasonInfo" name="seasonInfo" value="${fish.seasonInfo}"/>
                </div>
              </div>
           </div>
          </div>

          <div class='form-group'>
           <label class='control-label col-md-2 col-md-offset-2' for='id_email'>産地</label>
             <div class='col-md-8'>
              <div class='col-md-2'>
                <div class='form-group internal'>
                <input type="text" class='form-control' id ="locations" name="locations" style=" width:528px;" value="${fish.locations}"/>
                 
                </div>
              </div>
           </div>	
          </div>
    
          <div class='form-group'>
            <label class='control-label col-md-2 col-md-offset-2' for='id_comments'>基本情報</label>
            <div class='col-md-6'>
              <textarea class='form-control' id='fishInfo' placeholder='Additional comments' rows='20' name="fishInfo">${fish.fishInfo}</textarea>
            </div>
          </div>
          <div class='form-group'>
            <div class='col-md-offset-4 col-md-3'>

   
            </div>
            <div class='col-md-3'>
             <button class='btn-lg btn-danger' style="float:right;background-color:#3aa9d5;border-color:#3aa9d5; float:right;" type='submit' onclick="return check()"  id="btn2">登録</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>


</body>
</html>