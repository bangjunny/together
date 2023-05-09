<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="10;url=./list">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body, body *{
		font-family: 'Jua'
	}
	.photo-label {
  display: inline-block;
  position: relative;
  width: 120px;
  height: 120px;
  border-radius: 50%;
  overflow: hidden;
  cursor: pointer;
  background-color: #ddd;
}
	
	
</style>
</head>
<body>

<h5 class="alert alert-success">
	총 ${utotalCount}명의 회원이 등록되어있습니다
	
</h5>
<table class="table table-bordered">
	<tr style="background-color: #ddd">
		<th style="width: 50px">번호</th>
		<th style="width: 300px">이름</th>
		<th style="width: 100px">성별</th>
		<th style="width: 100px">핸드폰</th>
		<th style="width: 100px">지역1</th>			
		<th style="width: 100px">지역2</th>			
		<th style="width: 100px">디테일페이지</th>			
	</tr>
	<c:forEach var="dto" items="${list}" varStatus="i">
		<tr>
			<td align="center">${i.count}</td>
			<td>
			<c:choose>
	          <c:when test="${dto.unum==null}">
	         <!-- Result값이 있다면 실행할 로직 -->
	         <img class="photo-label" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243"
	          id= border="1" hspace="10">
	          </c:when>
	          <c:otherwise>
		       <!-- 그렇지 않다면 실행할 로직 -->
		   
		          </c:otherwise>
		      </c:choose>
					
				<b>${dto.uname}</b>
				</td>
				<td>${dto.gender}</td>
				<td>${dto.hp}</td>
				<td>${dto.city1}</td>
				<td>${dto.city2}</td>
			
			<td align="center">
				<button type="button" class="btn btn-secondary btn-sm"
				onclick="location.href='mypagedetail?unum=${dto.unum}'">회원 프로필페이지 보기</button>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>