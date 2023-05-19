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
	#header_container{
		width: 1140px;
		margin: 0 auto;
	}
	#header_wrap{
		width: 100%;
		margin: 15px auto 0 auto;
		display: flex;
		justify-content: space-between;
	}
	#header_logo{
		width: 20%;
	}
	.layout_a img{
		width: 75px;
		height: 75px;
	}
	#header_navbar{
		width : 40%;
		display: flex;
	}
	#header_navbar div{
		font-size: 20px;
		line-height: 75px;
		cursor: pointer;
		margin: 0 auto;
  		
	}
	#header_btns{
		width: 25%;
	}

</style>
</head>
<body>
	<div id="header_container">
		<div id="header_wrap">
			<div id="header_logo">
				<a class="layout_a" href="/">
					<img src="../photo/logo.png">
				</a>
			</div>	
			<div id="header_navbar">
					<div onclick="location.href='/moim/moimlist'">모임게시판</div>
					<div onclick="location.href='/city/list'">지역게시판</div>
					<div onclick="location.href='/mapcontact'">지역검색</div>
			</div>		
			<div id="header_btns">
			<c:choose>
				<c:when test="${sessionScope.unum ne null }">
					<span>${sessionScope.uname}</span>
					<button class="btn btn-light layout_a" onclick="location.href='/user/mypage'">마이페이지</button>
					<button class="btn btn-light layout_a" onclick="location.href='/user/logout'">로그아웃</button>
				</c:when>
				<c:otherwise>
					<span>Guest 상태로 조회 중입니다</span>
					<button type="button" class="btn btn-light layout_a" onclick="location.href='/user/login'">로그인</button>
				</c:otherwise>
			</c:choose>	
			</div>
	    </div>
	</div>



</body>
</html>












