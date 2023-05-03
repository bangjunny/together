<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body, body * {
	font-family: 'Jua'
}
div.moim {
	width: 600px;
	height:1000px;
	border:0px solid gray;
	
}
pre.moimpre{
	font-size: 14px;
	margin:20px 10px;
	height:700px;
	border:1px solid gray;
}
img.moimimg{
	max-width: 400px;
	position:absolute;
	top:250px;
	left:250px;
}

</style>
</head>
<body>
<h3>상세페이지</h3>
	<div class="moim">
		<div>
		<h2>${dto.mname}</h2>
		<span style="float: left;font-size: 14px;">${dto.city1} ${dto.city2}</span>
		<span style="float: right; color:black; font-size: 14px;">
		<fmt:formatDate value="${dto.createday}" pattern="yyyy-MM-dd HH:mm" />
		</span> <br> <span style="color:black; font-size: 14px;">카테고리:${dto.category},
			회원수:${unum}명 </span>
		</div>
		<hr>
		<pre class="moimpre">
		<c:if test="${dto.mphoto!=''}">
		<img src="https://${imageUrl}/test/${dto.mphoto}" class="moimimg">
		</c:if>
		<br>
		${dto.mcontent}
		</pre>
		<div style="text-align:center;">
		<button type="button" class="btn btn-sm btn-outline-secondary"
			style="width: 70px;" onclick="location.href='./moimlist?currentPage=${currentPage}'">목록</button>
		<button type="button" class="btn btn-sm btn-outline-secondary"
			style="width: 70px;" onclick="">수정</button>
		<button type="button" class="btn btn-sm btn-outline-secondary" 
			style="width: 70px;" onclick="">삭제</button>
		</div>	
		<hr>
		<div style="font-size: 35px;cursor:pointer; text-align:center">
		<i class="bi bi-heart jjim" ></i>&nbsp;
		<button type="button" style="width:370px;height:45px;text-align:center"
			class="btn btn-secondary btn-block" onclick="">가입신청</button>
		</div>	
	</div>
</body>
</html>
