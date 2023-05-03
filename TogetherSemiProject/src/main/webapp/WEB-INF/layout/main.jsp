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
	body{
		font-family: 'Jua';
		
	}
	a{
		cursor: pointer;
	}
	#main_container{
		width: 100%;
		height: 100%;
	}
	#main_head_logo{
		position: relative;
		left: 400px;
		top: 75px;
	}
	#main_header{
		width: 1200px;
		height: 500px;
		margin: 0 auto;
		display: flex;
		justify-content: space-around;
    	align-items: center;
		
	}
	#main_header_txt{
		margin-top: 25px;
		width: 400px;
		height: 300px;
		
	}
	#main_header_pic{
		width: 600px;
	}
	#main_btn_wrap{
		position: relative;
		left: 500px;
		bottom: 100px;
		width: 200px;
		display: flex;
		justify-content: space-between;
	}
	#main_list_go{
		margin-top: 100px;
		text-align: center;
	}
	.mainphoto{
		width: 200px;
		height: 200px;
		margin-right: 50px;
		margin-bottom: 50px;
	}
	#main_list_txt{
		margin: 0 auto;
		width: 800px;
		display: flex;
		justify-content: space-around;
		font-size: 20px;
		
	}
	#main_mid_pic{
		margin-top: 50px;
		width: 100%;
		height: 600px;
		background-image:url("./photo/mid_pic.jpg");
  		background-attachment: fixed;			
	}
	
</style>
</head>
<body>
<div id="main_container">
<div id="main_head_logo">
<img alt="" src="./photo/logo.png" style="width: 50px; height: 50px;"> 다 함께!
</div>
<div id="main_header">

	<div id="main_header_txt">
		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
	</div>
	<div id="main_header_pic">
		<img src="./photo/main_1.jpg">
	</div>
	
</div>
	<div id="main_btn_wrap">
		<button type="button" onclick="location.href='로그인'">로그인</button>
		<button type="button" onclick="location.href='회원가입'">회원가입</button>
	</div>
<div id="main_list_go">
	<a href="모임 게시판">
	<img class="mainphoto" src="./photo/moim.png">
	</a>
	<a href="지역 게시판">
	<img class="mainphoto" src="./photo/local.png">
	</a>
	<a href="지도 페이지">
	<img class="mainphoto" src="./photo/map.png">
	</a>
	<br>
	<div id="main_list_txt">
		<span>모임 게시판</span>
		<span>지역 게시판</span>
		<span>지도로 위치 검색</span>
	</div>
	
	<div id="main_mid_pic">
		<!-- <img src="./photo/mid_pic.jpg"> -->
	</div>
	<h1 style="position: relative; bottom: 500px; color: white;">대충 괜찮은 문장</h1>
	
</div>
<br><br>
</div>
</body>
</html>











