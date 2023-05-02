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
		font-family: 'Jua'
	}
	a:link,a:visited,a:hover {
		color: black;
		text-decoration: none;
	}
	
	div.mainlayout header,div.mainlayout section{
		border: 0px solid gray;
		position: absolute;
	}
	
	div.mainlayout .header{
		width: 100%;
		top: 10px;
		left: 10px;
		text-align:center;
		height:100px;
		line-height: 100px;
		background-color: #f0ffff;
	}
	
	div.mainlayout .info{
		width: 200px;
		top: 220px;
		left: 20px;
		text-align:center;
		height:250px;
		padding: 30px 30px;
	}
	
	div.mainlayout .menu{
		width: 100%;
		top: 110px;
		left: 0px;
		text-align:center;
		height:80px;
		line-height:80px;
		font-size: 20px;
	}
	
	div.mainlayout .main{
		width: 800px;
		top: 220px;
		left: 300px;
		height:500px;
		font-size: 16px;
	}
</style>
</head>
<body>
<div class="mainlayout">
	<header class="header">
		<tiles:insertAttribute name="header"/>
	</header>
	<section class="menu">
		<tiles:insertAttribute name="menu"/>
	</section>
	<section class="info">
		<tiles:insertAttribute name="info"/>
	</section>
	<section class="main">
		<tiles:insertAttribute name="main"/>
	</section>
</div>
</body>
</html>











