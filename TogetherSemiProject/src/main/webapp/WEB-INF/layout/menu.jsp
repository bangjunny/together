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
	div.menu1{
		width: 1000px;
		margin-left: 250px;
	}
	
	div.menu1 ul{
		list-style: none;
	}
	
	div.menu1 ul li{
		float: left;
		width: 120px;
		height: 70px;
		line-height:70px;
		border: 3px solid gray;
		margin-right:10px;
		border-radius:30px;
		cursor:pointer;
		background-color: #afeeee;
	}
	
	div.menu1 ul li:hover{
		box-shadow: 5px 5px 5px gray;
		background-color: #db7093;
	}
	
	div.menu1 ul li a:hover{
		color:white;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<div class="menu1">
	<ul>
		<li>
			<a href="${root}/">Home</a>
		</li>
		<li>
			<a href="${root}/shop/list">Shop</a>
		</li>
		<li>
			<a href="${root}/board/list">Board</a>
		</li>
		<li>
			<a href="${root}/guest/list">Guest</a>
		</li>
		<li>
			<a href="${root}/contact">Contact</a>
		</li>
	</ul>
</div>
</body>
</html>











