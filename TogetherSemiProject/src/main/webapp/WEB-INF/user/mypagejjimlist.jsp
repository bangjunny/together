<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 찜한 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

	#mypage_navbar{		
		margin-top: 80px;
	}
 	.container {
	  margin-top:50px;
	  margin-left:10px;
	  max-width: 1440px;
	  margin: 100 100 100 100;
	  flex : auto;
	  padding: 20px 20px 20px 20px;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  box-shadow: 0px 0px 5px #ddd;
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
<!-- 마이페이지내브바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mypage_navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="/user/mypagedetail?unum=${unum}">MYPAGE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagegaiplist?unum=${unum}">내 모임</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagejjimlist?unum=${unum}">내가 찜한 모임</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagecblist?unum=${unum}">내가 쓴 게시물</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagecblikelist?unum=${unum}">내가 추천한 게시물</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="myinfoupdate">내 정보 수정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="myuser_out">회원탈퇴</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container container-fluid">
	 <h3 class="mb-4">내가 찜한 모임리스트</h3>
		<div class="jjimitem-container" style="width: 30rem;">
		  	<c:forEach var="jjim" items="${jjimList}">
		  		<a href="/moim/moimdetail?mnum=${jjim.mnum}">
			         <div class="jjimitem">        
				         	 <div class="image-container">				         	 	
				         	 	  <img src="https://${imageUrl}/moim/${jjim.mphoto}">
				              </div>   
			         		<div class="jjimcontent">       
			                   <h3>${jjim.subject}</h3>
			                   <p>${jjim.mcontent}</p>
			                   <p>${jjim.mname}</p>
			                   <p>${jjim.category}</p>
			                   <p>${jjim.mnum}</p>
			                   <p>${jjim.mphoto}</p>
			               </div>   
			           </div>
		         </a>              
		    </c:forEach>
		</div>
</div>
</body>
</html>