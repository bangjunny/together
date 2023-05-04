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

.container {
  max-width: 1800px;
  margin: 20 auto;
  flex : auto;
  padding: 40px 20px;
  background-color: #fff;
  border: 1px solid #ddd;
  box-shadow: 0px 0px 5px #ddd;
  text-align: center;
}

.card {
  width: 18rem;
  margin: auto;
  margin-top: 50px;
  padding: 20px;
  flex : auto;
}

.text {
  width: 18rem;
  margin: auto;
  font-size:30px;
  margin-top: 50px;
  padding: 20px;
  flex : auto;
}

	
</style>
</head>
<body>
<div class="container text-center">
	<div class ="row">
	<div class ="card col">
	 	<c:choose>
	          <c:when test="${dto.uphoto==null}">
	         <!-- Result값이 있다면 실행할 로직 -->
	         <img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
	          </c:when>
	          <c:otherwise>
	       <!-- 그렇지 않다면 실행할 로직 -->
	       <img src="https://${imageUrl}/user/${dto.uphoto}">    
	          </c:otherwise>
	      </c:choose>
	</div>	
	<div class="text col">	
		넘버  : ${dto.unum}<br>
		이름 : ${dto.uname}<br>
		생년월일 : ${dto.age}<br>
		성별 : ${dto.gender}<br>
		이메일 : ${dto.email}<br>
		비밀번호 : ${dto.pass}<br>
		전화번호 : ${dto.hp}<br>
		지역  : ${dto.city1} &nbsp;
				${dto.city2}<br>
		가입일 : <fmt:formatDate value="${dto.joinday}" pattern="yyyy-MM-dd HH:mm"/><br>
	 </div>			
	
	</div>	
</div>
</body>
</html>
