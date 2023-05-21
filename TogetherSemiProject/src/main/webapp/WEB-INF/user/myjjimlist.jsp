<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜리스트</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	
	.mymoim_img{
		 border-radius: 50%;
		  object-fit: cover;
		  width: 50px; /* 이미지 너비 */
		  height: 50px; /* 이미지 높이 */
	}
	
    
</style>
<body>
<div>
나와라 제발 제발 
${jjimList.mname}
</div>
<div class="container mt-5">
        <h3 class="mb-4">나의 찜한 모임 리스트</h3>
        <table class="table table-bordered border-primary table-hover table-layout: fixed; width: 100%;">
            <thead class="table-light">
                <tr>
                    <th style="width: 20%;">모임 이름</th>
                    <th style="width: 15%;">카테고리</th>
                    <th style="width: 10%;">지역1</th>
                    <th style="width: 10%;">지역2</th>
                    <th style="width: 30%;">모임 소개</th>
                    <th style="width: 15%;">자세히보기</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="moim" items="${jjimList}">
                    <tr>
                        <td style="text-align: left;">
                        <c:choose>
					   		 <c:when test="${moim.mphoto==null}">
					   		<!-- Result값이 있다면 실행할 로직 -->
					   		<img class="mymoim_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
					   		 </c:when>
					   		 <c:otherwise>
							 <!-- 그렇지 않다면 실행할 로직 -->
							 <img class="mymoim_img" src="https://${imageUrl}/moim/${moim.mphoto}">	 
					   		 </c:otherwise>
							</c:choose>
							
                        
                        ${moim.mname}</td>
                        <td>${moim.category}</td>
                        <td>${moim.city1}</td>
                        <td>${moim.city2}</td>
                        <td>${moim.mcontent}</td>
                        <td><a href="/moim/moimdetail?mnum=${moim.mnum}&mname=${moim.mname}" class="btn btn-primary">자세히보기</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

<%-- <div class="jjimListContainer">
     <c:choose>
        <c:when test="${not empty jjimList}">
            <c:forEach var="j" items="${jjimList}">
                <div class="moimItem">
                    <h4> <img class="mymoim_img" src="https://${imageUrl}/moim/${j.mphoto}"></h4>
                    <h4>${j.mname}</h4>
                    <p>${j.mcontent}</p>
                  
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>찜한 모임이 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div> --%>
</body>
</html>
