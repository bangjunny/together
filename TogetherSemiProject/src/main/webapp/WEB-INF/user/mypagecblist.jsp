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
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
 body, body * {
		font-family: 'NanumPenScript'
	}
	
/* 	.mymoim_img{
		 border-radius: 50%;
		  object-fit: cover;
		  width: 50px; /* 이미지 너비 */
		  height: 50px; /* 이미지 높이 */
	} */
	
	body {
		margin-top:100px;
	}
    
</style>

</head>
<body>
 <div class="container mt-5" style="margin-top:100px;">
        <h3 class="mb-4">내가 쓴 게시물 보기</h3>
        <table class="table table-bordered border-primary table-hover table-layout: fixed; width: 100%;">
            <thead class="table-light">
            	<caption>내가 쓴 게시물 보기</caption>
                <tr>
                    <th style="width: 20%;">게시물 제목</th>
                    <th style="width: 15%;">조회수</th>
                    <th style="width: 10%;">지역1</th>
                    <th style="width: 10%;">지역2</th>
                    <th style="width: 30%;">게시물 내용</th>
                    <th style="width: 15%;">자세히보기</th>
                    
                </tr>
            </thead>
            <tbody>
            <c:if test="${totalCount==0}">
		<tr height="50">
			<td colspan="6" align="center" valign="middle">
				<b style="font-size:1.3em">등록된 게시글이 없습니다</b>
			</td> 
		</tr>
	</c:if>
            <c:if test="${totalCount>0 }">
                <c:forEach var="cb" items="${cbList}">
                    <tr>
                        <td style="text-align: left;">  		               
                        ${cb.subject}</td>
                        <td>${cb.readcount}</td>
                        <td>${cb.city1}</td>
                        <td>${cb.city2}</td>
                        <td>${cb.cbcontent}</td>
                       
                        <td><a href="/city/detail?cbnum=${cb.cbnum}" class="btn btn-primary">자세히보기</a></td>
                    </tr>
                </c:forEach>
                </c:if>
            </tbody>
        </table>        
    </div>
   	<br>
<!-- 페이징 처리 -->
		<div style="width: 700px; text-align:center; font-size:20px;">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a style="color:black; text-decoration:none; cursor:pointer;"
				href="mypagecblist?unum=${unum }&currentPage=${startPage-1}">이전</a>
			</c:if>
			<!-- 페이지번호 출력 -->
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==pp}">
					<a style="color:green; text-decoration:none; cursor:pointer;"
					href="mypagecblist?unum=${unum }&currentPage=${pp}">${pp}</a>
				</c:if>
				<c:if test="${currentPage!=pp}">
					<a style="color:black; text-decoration:none; cursor:pointer;"
					href="mypagecblist?unum=${unum }&currentPage=${pp}">${pp}</a>
				</c:if>
				&nbsp;
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<a style="color:black; text-decoration:none; cursor:pointer;"
				href="mypagecblist?unum=${unum }&currentPage=${endPage+1}">다음</a>
			</c:if>
		</div>
</body>
</html>