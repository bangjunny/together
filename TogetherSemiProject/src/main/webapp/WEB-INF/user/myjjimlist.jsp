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

<body>
<div>
나와라 제발 제발 
${jjimList.mname}
</div>

<div class="jjimListContainer">
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
</div>
</body>
</html>
