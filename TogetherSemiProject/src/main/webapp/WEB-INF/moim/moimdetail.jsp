<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>
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
</style>
</head>
<body>
	<div class="moim">
		<h2>${dto.mname}</h2>
		<span style="float: right; color: #ccc; font-size: 13px;"> <fmt:formatDate
				value="${dto.createday}" pattern="yyyy-MM-dd HH:mm" />
		</span><br>
		<span style="color: #ccc; font-size: 13px;">${dto.category} ${unum}명 </span><br><hr>
		<c:if test="${dto.mphoto!=''}">
		<img src="https://${imageUrl}/test/${dto.mphoto}" style="max-width: 500px;">
		</c:if>
		<br>
		<pre style="font-size: 16px;">${dto.mcontent}</pre>
		<br>
		<hr>
		<i class="bi bi-suit-heart jjim" style="font-size:20px;float:left;"></i>
		<button type="button" class="btn btn-outline-secondary btn-block">가입신청</button>
		
	</div>
</body>
</html>
