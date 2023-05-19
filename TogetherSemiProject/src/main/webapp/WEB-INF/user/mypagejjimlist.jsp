<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
 	.container{
 		max-width:1440px;
 	
 	
 	}
 
	.jjimitem-container{
	  display: grid;
	  grid-template-columns: repeat(4, 1fr); /* 한 줄에 4개의 아이템을 나타내도록 설정 */
	  grid-gap: 20px; /* 아이템 사이의 간격을 조정하세요 */
	 
	 
	}
	.jjimitem {
		display: flex;
		flex-direction: column;
	   	align-items: center;
	    text-align: center;
	    text-decoration:none;
	     border-radius: 10px;
		 box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
		
	}
	 .image-container:hover{
	    transform: scale(1.01);
	    transition: transform 0.3s ease;
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
	  
	}
	
	.jjimitem:hover .image-container img {
	  transform: scale(1.1);
	}
	  .jjimcontent {
	    margin-top: 10px;
	     text-decoration:none;
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
<!-- 삼선버튼 -->
<button class="btn btn-outline" type="button" id="dropdownMenuBtn" data-bs-toggle="dropdown" aria-expanded="false">
  <i class="bi bi-list" style="font-size:30px;">메뉴</i>
</button>

<!-- 드롭다운 메뉴 -->
<ul class="dropdown-menu" aria-labelledby="dropdownMenuBtn">
  <li><a class="dropdown-item" onclick="location.href='/user/mypagedetail?unum=${unum}'"><i class="bi bi-house-fill"></i> 마이프로필 홈</a></li>
  <li><a class="dropdown-item" onclick="location.href='/user/mypagegaipmoimlist?unum=${unum}'"><i class="bi bi-people-fill"></i> 내 모임</a></li>
  <li><a class="dropdown-item" onclick="location.href='/user/mypagecblist?unum=${unum}'"><i class="bi bi-pencil-square"></i> 내가 작성한 글</a></li>
  <li><a class="dropdown-item" onclick="location.href='/user/mypagecblikelist?unum=${unum}'"><i class="bi bi-heart-fill"></i> 내가 추천한 게시글</a></li>
</ul>

<!-- 드롭다운 메뉴 스크립트 -->
<script>
  var dropdownMenu = document.getElementById('dropdownMenuBtn');
  dropdownMenu.addEventListener('click', function () {
    var dropdown = new bootstrap.Dropdown(dropdownMenu);
  });
</script>

<div class="container-fluid">
<div class="jjimitem-container" style="width: 30rem;">
  	<c:forEach var="jjim" items="${jjimList}">
  		<a href="/moim/moimdetail?mnum=${jjim.mnum}">
	         <div class="jjimitem">        
		         	 <div class="image-container" id="">
		         	 	
		         	 	  <c:choose>
					   		 <c:when test="${jjim.mphoto==null}">
		
					   		<!-- Result값이 있다면 실행할 로직 -->
					   		<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
					   		 </c:when>
					   		 <c:otherwise>
							 <!-- 그렇지 않다면 실행할 로직 -->
							 <img src="https://${imageUrl}/moim/${jjim.mphoto}">	 
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
</div>
</body>
</html>