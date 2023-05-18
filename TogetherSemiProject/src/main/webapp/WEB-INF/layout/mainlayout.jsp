<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
		font-family: 'NanumPenScript';
	}
	#main_container{
		background-color: rgba(245, 245, 220, 0.2);	
	}
	.header{
		height: 100px;
	}
	.footer{
		margin-top: 100px;
	}
	
</style>
</head>
<body>
	
<div class="mainlayout">
	<header class="header">
		<tiles:insertAttribute name="header"/>
	</header>
	<section class="main">
		<tiles:insertAttribute name="main"/>
	</section>
	<footer class="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
	
</div>

</body>
</html>











