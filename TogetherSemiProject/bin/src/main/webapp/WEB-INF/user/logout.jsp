<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout page</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<style>

		body {
			background-color: #f2f2f2;
			margin-top: 20px;
			text-align: center;
			font-size: 20px;
			color: #333;
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		 .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 40px 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0px 0px 5px #ddd;
            text-align: center;
        }

		h1 {
			font-size: 30px;
			font-weight: bold;
			margin-bottom: 30px;
		}

		.btn-primary {
			background-color: #007bff;
			border-color: #007bff;
			font-weight: bold;
			padding: 10px 30px;
			margin-top: 30px;
			font-size: 20px;
		}

		.btn-primary:hover {
			background-color: #0069d9;
			border-color: #0062cc;
		}
	</style>
	
</style>
</head>
<body>
<div class="container-fluid">
	 <div class="container">
	<h1>로그아웃 되었습니다.</h1>
	<a href="NewLogin.jsp" class="btn btn-primary">로그인 화면으로 돌아가기</a>
	</div>	
</div>	
</body>
</html>












