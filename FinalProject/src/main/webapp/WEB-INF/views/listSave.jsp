<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%-- <% response.setHeader("Content-Disposition","attachment;filename=list.xls");
response.setHeader("Content-Description", "JSP Generated Data"); 
response.setContentType("application/vnd.ms-excel");%> --%>

<%@ page import="java.text.SimpleDateFormat"  %>
<%@ page import="java.util.Date"  %>
<% 
SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy.MM.dd" );
Date currentTime = new Date ();
String today = mSimpleDateFormat.format ( currentTime );

    response.setHeader("Content-Disposition", "attachment; filename="+today+".xls"); 

    response.setHeader("Content-Description", "JSP Generated Data"); 
    response.setContentType("application/vnd.ms-excel");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
 <tr><td>購買日付</td>
 <td>品種</td>
 <td>産地</td>
 <td>重量</td>
 <td>価格</td>
 <td>販売者ID</td></tr>
 <c:forEach var="m" items="${list}" varStatus="status">
		<tr class="test2">
			<td>${m.deadline}</td>
			<td>${m.fishName}</td>
			<td>${m.location}</td>
			<td>${m.weight}</td>
			<td>${m.price}</td>
			<td>${m.successSellerId}</td>
		</tr>
</c:forEach> 
</table>
</body>
</html>