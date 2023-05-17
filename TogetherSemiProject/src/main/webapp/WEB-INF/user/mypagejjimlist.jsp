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
	.jjimitem-container{
	  display: grid;
	  grid-template-columns: repeat(6, 1fr); /* 한 줄에 4개의 아이템을 나타내도록 설정 */
	  grid-gap: 20px; /* 아이템 사이의 간격을 조정하세요 */
	}
	.jjim-item {
	  display: flex;
	  align-items: center;
	}
	.image-container {
	  width: 200px; /* 이미지의 원래 크기에 맞게 조정하세요 */
	  height: 200px; /* 이미지의 원래 크기에 맞게 조정하세요 */
	  overflow: hidden;
	 
	}
	.image-container img {
	  width: 100%;
	  height: 100%;
	  object-fit: cover;
	  transition: transform 0.3s ease;
	}
	
	.jjimitem:hover .image-container img {
	  transform: scale(1.1);
	}
	
	#mmdetail{
		
        color:black;
        font-weight: 500;
        border:none;
        border-radius: 3px;
	
	
	}
	
    
</style>

</head>
<body>
<div class="jjimitem-container" style="width: 30rem;">
  	<c:forEach var="jjim" items="${jjimList}">
  		<a href="/moim/moimdetail?mnum=${jjim.mnum}">
         <div class="jjimitem">        
         	 <div class="image-container">
         	 	
         	 	  <c:choose>
			   		 <c:when test="${jjim.mphoto==null}">

			   		<!-- Result값이 있다면 실행할 로직 -->
			   		<img class="img-thumbnail" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
			   		 </c:when>
			   		 <c:otherwise>
					 <!-- 그렇지 않다면 실행할 로직 -->
					 <img class="img-thumbnail" src="https://${imageUrl}/moim/${jjim.mphoto}">	 
			   		 </c:otherwise>
					</c:choose>
              </div>   
         		<div class="jjimcontent">       
                   <h3>${jjim.subject}</h3>
                   <p>${jjim.mcontent}</p>
                   <p>${jjim.mname}</p>
                   <p>${jjim.mnum}</p>
               </div>   
           </div>
         </a>              
    </c:forEach>
</div>
</body>
</html>