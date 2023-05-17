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
	
	.mymoim_img{
		 border-radius: 50%;
		  object-fit: cover;
		  width: 50px; /* 이미지 너비 */
		  height: 50px; /* 이미지 높이 */
	}
	
    
</style>

</head>
<body>
 <div class="container mt-5">
        <h3 class="mb-4">내가 추천한 글리스트</h3>
        <table class="table table-bordered border-primary table-hover table-layout: fixed; width: 100%;">
            <thead class="table-light">
                <tr>
                    <th style="width: 20%;">제목</th>
                    <th style="width: 15%;">조회수</th>
                    <th style="width: 10%;">지역1</th>
                    <th style="width: 10%;">지역2</th>
                    <th style="width: 30%;">내용</th>
                    <th style="width: 15%;">자세히보기</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cblike" items="${cbLikeList}">
                    <tr>
                        <td style="text-align: left;">
                                     
                        ${cblike.subject}</td>
                        <td>${cblike.readcount}</td>
                        <td>${cblike.city1}</td>
                        <td>${cblike.city2}</td>
                        <td>${cblike.cbcontent}</td>
                        
                        <td><a href="/city/detail?cbnum=${cblike.cbnum}" class="btn btn-primary">자세히보기</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>