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
	width: 900px;
	height:1100px;
	border:0px solid gray;
	margin-left:200px;
	background-color:#ccc
}
pre.moimpre{
	font-size: 16px;
	margin:20px 10px;
	height:700px;
	border:1px solid gray;
	background-color:white
}
pre img{
	width:450px;
	height:450px;
}

</style>
</head>
<body>
<h3>상세페이지</h3>
	<div class="moim">
		<div><br>
		<h2 style="text-align:center;">${dto.mname}</h2>
		<span style="float: left;font-size: 14px;">지역: ${dto.city1} ${dto.city2}</span>
		<span style="float: right; color:black; font-size: 14px;">
		작성일:
		<fmt:formatDate value="${dto.createday}" pattern="yyyy-MM-dd HH:mm" />
		</span> <br> <span style="color:black; font-size: 14px;">카테고리:${dto.category},
		모임인원:${dto.unum}명</span>
		<br>
		<span style="float: left; color:black; font-size:16px;">모임장: ${dto.jang}</span>
		<br>
		</div>
		<hr>
		<pre class="moimpre">
		 <c:choose>
   		 <c:when test="${dto.mphoto==null}">
   		<!-- Result값이 있다면 실행할 로직 -->
   		<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
   		 </c:when>
   		 <c:otherwise>
		 <!-- 그렇지 않다면 실행할 로직 -->
		 <img src="https://${imageUrl}/moim/${dto.mphoto}">	 
   		 </c:otherwise>
		</c:choose>
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
