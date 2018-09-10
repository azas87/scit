<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/writeBuyBoardForm.css"/>

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/WriteBuyBoard.js" ></script>

<body>
	<form action="writeBuyBoard">
	<div class="dropdown">
		
	어종<input type="text" id ="fishName" name="fishName"/>
		<div id="myDropdown" class="dropdown-content">
  		</div>
  		
	</div>
		산지<select id="location" name="location"></select></br>
		중량<input type="number" id ="weight" name="weight"/></br>
		가격<input type="number" id ="price" name="price"/></br>
		<input type="hidden" id ="uploadDate" name="uploadDate"/></br>
		
		 予約時日付<select id="loadDate" >
		 		<option value="">未定</option>
		 	</select>
       	 
       	 <select id="hour" >
       	 		<option value="">未定</option>
         	<c:forEach begin="1" end="24" var="x" step="1">
         		<c:if test="${x<10}">
         			<option value="0${x}">0${x}</option>
         		</c:if>
         		<c:if test="${x>10}">
         			<option value="${x}">${x}</option>
         		</c:if>
         	</c:forEach>
       	 </select>時
		
		 <select id="minute">
		 	<option value="">未定</option>
         	<option value="00">00</option>
         	<option value="30">30</option>
       	 </select>分
       	 </br>
       	 
       	 締め切り時間<select id="finishHour" name="birthDate">
         	<c:forEach begin="1" end="4" var="x" step="1">
         			<option value="${x}">${x}時間後</option>
         	</c:forEach>
       	 </select>
       	 </br>
       	 
       	 <input type="hidden" id ="deadline" name="deadline"/>
		
		우선순위1<select id="priority1" name="priority1">
						<option value="">未定</option>
					<c:forEach var="buy" items="${buylist}">
						<option value="${buy.successSellerId}">${buy.successSellerId}</option>
					</c:forEach>
				</select>
		우선순위2<select id="priority1" name="priority1">
						<option value="">未定</option>		
					<c:forEach var="buy" items="${buylist}">
					  <option value="${buy.successSellerId}">${buy.successSellerId}</option>
					</c:forEach>
				</select>
				
		우선순위3<select id="priority1" name="priority1">
						<option value="">未定</option>		
					<c:forEach var="buy" items="${buylist}">
					  <option value="${buy.successSellerId}">${buy.successSellerId}</option>
					</c:forEach>
				</select>
		코멘트<input type="text" id ="buyListComment" name="buyListComment"/>
		
	 <button id="btn2" onclick="return check()">완료</button>

	</form>
		<c:if test="${buylistFromHistory.fishName!=null}">
			<input type="hidden" id="setFishName" value="${buylistFromHistory.fishName}">
			<input type="hidden" id="setLoction" value="${buylistFromHistory.location}">
			<input type="hidden" id="setSellerId" value="${buylistFromHistory.successSellerId}">
		</c:if>





</body>
</html>