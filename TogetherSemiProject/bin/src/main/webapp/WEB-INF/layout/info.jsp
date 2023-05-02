<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body, body *{
		font-family: 'Jua'
	}
	
	div.info img{
		width: 100px;
		height: 40px;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="info">
	<b style="color:magenta; font-size:20px;">금주 개봉작</b>
	<img src="${root}/photo/back3.jpg"><br><br>
	<img src="${root}/photo/back6.jpg"><br><br>
	<img src="${root}/photo/back7.jpg"><br><br>
</div>
</body>
</html>











