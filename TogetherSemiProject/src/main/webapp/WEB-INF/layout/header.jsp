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
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
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
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
	}
	#header_logo{
		width: 15%;
		display:flex;
		justify-content:flex-start
	}
	#header_logo img{
		margin-left:-55px;
	
	}
	
	#header_navbar{
		width : 55%;
		display: flex;
	}
	#header_navbar div{;
		font-size: 20px;
		line-height: 75px;
		cursor: pointer;
		margin: 0 auto;
  		
	}
	#header_navbar div:hover{
		color:gray;
	}
	#header_btns{
		width: 120px;
		margin-top:29px;
		font-size:13px;
		margin-left:110px;
	}
	.header_btn{
		margin-left:5px;
		background: #FE9A2E;
        background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        cursor:pointer;
        border-radius: 5px;
        transition: background-color 0.2s;
	}
	.header_btn:hover{
		background: #FE642E;
		
	}
	.header_btn:not(:hover){
		background: #FE9A2E;
		transition: background-color 0.2s;
	}
	#header_guide{
		width:100%;
		height:5px;
		background-color:orange;
		margin-top:10px;
		
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
  				<div onclick="navigateTo('/moim/moimlist')" id="heading_moim" style="font-family:Nunito;">C l u b</div>
  				<div onclick="navigateTo('/city/list')" id="heading_city" style="font-family:Nunito;">L o c a l</div>
  				<div onclick="navigateTo('/mapcontact')" id="heading_map" style="font-family:Nunito;">P l a c e</div>
			</div>	
			<div id="header_btns">
			<c:choose>
				<c:when test="${sessionScope.unum ne null }">
					<span>${sessionScope.uname}</span>
					<button class="header_btn" onclick="location.href='/user/logout'">로그아웃</button>
				</c:when>
				<c:otherwise>
					<span>Guest</span>
					<button type="button" class="header_btn" onclick="location.href='/user/login'">로그인</button>
				</c:otherwise>
			</c:choose>	
			</div>
	    </div>
	</div>
	<div id=header_guide></div>

	<script type="text/javascript">
		function navigateTo(url) {
  		// 클릭한 버튼에 스타일을 적용합니다.
  		event.target.style.color = "orange";
  
  		// 페이지 이동
  		location.href = url;
		}
	</script>

</body>
</html>












