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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body, body *{
		font-family: 'Jua'
	}
	div.listtop{
	width:900px;
	height:1000px;
	border:0px solid gray;
	margin-left:250px;
	background-color:#ccc;
	}
	div.listmid{
	width:400px; 
	height:280px;
	float: left;
	margin: 20px;
	cursor: pointer;
	border:0px solid gray;
	text-align:center;
	background-color:#ddd;
	}
</style>
</head>
<body>

	
<div class="listtop">
<h2>모임리스트</h2>
<h5 class="alert alert-secondary" style="width:900px;">
총 ${totalCount} 개의 모임이 있습니다.
</h5>
	<table class="table" border="1" bgcolor="#ccc" >
		<tr>
			<td>
				 <div class="dropdown dropstart text-end" style="float:right">
    				<button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
      					선택
  					  </button>
   					 <ul class="dropdown-menu" id="city2" name="city2">
     					<li><a class="dropdown-item active" href="#">강남구</a></li>
    			  		<li><a class="dropdown-item" href="#">강서구</a></li>
    					<li><a class="dropdown-item disabled" href="#">구로구</a></li>
   					 </ul>
  				</div>
  			<div align="center" id="hobbyimg" style="cursor:pointer;">
				<img src="../photo/Sports.png" width="50">&nbsp;
				<img src="../photo/game.png" width="50">&nbsp;
				<img src="../photo/Live music.png" width="50">&nbsp;
				<img src="../photo/camera.png" width="50">&nbsp;
				<img src="../photo/Color palette.png" width="50">
			</div>
			</td>
		</tr>
		<tr>
		<td>
	<c:forEach var="dto" items="${list}" varStatus="i">	
	<div class="listmid">
		<c:choose>
   		 <c:when test="${dto.mphoto==null}">
   		<!-- Result값이 있다면 실행할 로직 -->
   		<img src="http://sjrhsefqqpro17075801.cdn.ntruss.com/moim/together.png?type=f&w=200&h=200&ttype=jpg"
		border="1" onclick="location.href='moimdetail?mnum=${dto.mnum}'" style="cursor:pointer;margin-top:10px">
   		 <br>
		<a	href="moimdetail?mnum=${dto.mnum}&currentPage=${currentPage}"
		style="color: black; font-size:17px;text-decoration: none; cursor: pointer;">
		<span style="text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: inline-block;max-width: 220px;">	
   		 <b style="font-size:20px;">${dto.mname}</b>
		</span>
		<br>
		번호:${dto.mnum},
		카테고리:${dto.category},
		모임인원:${dto.unum}명
		</a>
   		 </div>
   		 </c:when>
   		 <c:otherwise>
		 <!-- 그렇지 않다면 실행할 로직 -->	 
		 <img src="http://${imageUrl_small}/moim/${dto.mphoto}?type=f&w=200&h=200&ttype=jpg"
				border="1" onclick="location.href='moimdetail?mnum=${dto.mnum}'" style="cursor:pointer;margin-top:10px">	 
		<br>
		<a	href="moimdetail?mnum=${dto.mnum}&currentPage=${currentPage}"
		style="color: black; font-size:17px;text-decoration: none; cursor: pointer;">
		<span style="text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: inline-block;max-width: 220px;">
   		<b style="font-size:20px;">${dto.mname}</b>
		</span>
		<br>
		번호:${dto.mnum},
		카테고리:${dto.category},
		모임인원:${dto.unum}명
		</a>
   		 </c:otherwise>
		</c:choose>
	</div>	
	</c:forEach>	
	</tr>
	</td>
	</table>

<!-- 페이징처리하기 -->
	<div style="width: 900px;margin-left:400px;margin-top:100px;font-size: 20px;">
		<!-- 이전 -->
		<c:if test="${startPage>1}">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="moimlist?currentPage=${startPage-1}">이전</a>
		</c:if>
		&nbsp;
		<!-- 페이지 번호 출력 -->
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<c:if test="${currentPage==pp}">
				<a style="color: blue; font-size:23px; text-decoration: none; cursor: pointer;"
					href="moimlist?currentPage=${pp}">${pp}</a>
			</c:if>
			<c:if test="${currentPage!=pp}">
				<a style="color: black; text-decoration: none; cursor: pointer;"
					href="moimlist?currentPage=${pp}">${pp}</a>
			</c:if>
		&nbsp;
	</c:forEach>
		<!-- 다음 -->
		<c:if test="${endPage<totalPage}">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="moimlist?currentPage=${endPage+1}">다음</a>
		</c:if>
	</div>
	</div>
</body>
</html>











