<!-- Add for JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Add for Korean Encoding (UTF-8)-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--  Change for Useing Session false -> true -->
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>sallerInfoDetail</title>
</head>

<body>
<h1>판메자 상세 정보</h1>
<table>
	<tr>
		<th>판매자Id</th><th>별점</th><th>산지</th><th>주요판매목록</th>
	</tr>
	<tr>
		<th colspan="4">리뷰</th>
	</tr>
</table>

</body>
</html>