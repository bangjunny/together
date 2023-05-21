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
      font-family: 'NanumPenScript';
   }
   
   .footer{
   		width: 100%;
   		height: 290px;
   		background-color: rgb(44, 42, 41);
   }
   .footer_wrap{
   		width:700px;
   		height: 100%;
   		margin: 0 auto;
   		text-align: center;
   		color: gray;
   		
   }
   .footer h2{
   		position: relative;
   		top: 50px; 		
   }
   .footer_bot_txt{
   		position: relative;
   		top: 50px;
   }

</style>
</head>
<body>

	<div class="footer">
		<div class="footer_wrap">
			<h2 onclick="location.href='/'" style="cursor: pointer">TOGETHER</h2>
			<div class="footer_bot_txt">
			<p>
			<span>서울특별시 강남구 819 3 삼오빌딩 7층 701호 </span><br>
			<span>대표 : 다함께</span><br>
			<span>사업자 등록번호 : 533-6433-1.16.1</span><br>
			<span>TEL. 02-7777-7777</span>
			</p>
			<br>
			<br> 
			<span>COPYRIGHT ⓒ 2022 TOGETHER CORP. ALL RIGHTS RESERVED.</span>
			</div>
		</div>
	</div>
	
</body>
</html>
