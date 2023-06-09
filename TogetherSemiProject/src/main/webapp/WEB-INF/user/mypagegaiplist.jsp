<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../commonvar.jsp" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 모임 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.main{
	height:100%;
	}
 		#mypage_navbar{		
		margin-top:0px;
		margin-bottom:30px;
		

	}
	#mynav_text{		
		margin-left:280px;
		margin-right:35px;
		

	}
	.nav-item{
		font-weight:700;
		margin-left:20px;
		margin-right:20px
	
	}
	
 	.container {
	  margin-top:0px;	
	  margin-left:10px;
	  margin-bottom:200px;
	  max-width: 1440px;
	  margin: 100 100 100 100;
	  flex : auto;
	  padding: 20px 20px 20px 20px;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  box-shadow: 0px 0px 5px #ddd;
	}
	
	.mymoim-container{
	
	display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* 반응형으로 조정 */
    grid-gap: 20px; /* 아이템 사이의 간격을 조정 */
    max-width: 100%; /* 최대 가로 크기를 100%로 설정 */
    overflow: hidden;
	
	
	}
	.mymoimitem {
		width: 250px; /* 가로 크기를 고정 */
   		height: 370px; /* 세로 크기를 고정 */
		display: flex;
		flex-direction: column;
	   	align-items: center;
	    text-align: center;
	    text-decoration:none;
	    border-radius: 10px;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
		margin-left: 30px;
		margin-bottom:10px;
	}
	 .image-container:hover{
	    border-radius: 10px;
	    transform: scale(1.01);
	    transition: transform 0.3s ease;
	  }
	  
	.image-container {
	border-radius: 10px;
	 width: 250px; /* 이미지의 원래 크기에 맞게 조정하세요 */
	 height: 250px; /* 이미지의 원래 크기에 맞게 조정하세요 */
	 overflow: hidden;
	
	 
	}
	.image-container img {
	  width: 100%;
	  height: 100%;
	  object-fit: cover;
	  
	}
	
	.mymoimitem:hover .image-container img {
	  transform: scale(1.1);
	}
	
	 .mymoim-content {
	  	color:black;
	    display: -webkit-box;
	    -webkit-line-clamp: 3; /* 표시할 줄 수 */
	    -webkit-box-orient: vertical;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    margin-top: 10px;
	     text-decoration:none;
	  }
	  .mymoim-container a{
	  	 color: black; /* a 태그의 텍스트 색상을 검은색으로 설정 */
    	text-decoration: none; /* 밑줄 제거 */
	  
	  }
	.mymoim-title{
	margin-top:5px;
	font-weight: bold;
	font-size:20px;
	}
	
	.mymoim-details{
		
        color:gray;
        font-weight: normal;
        font-size:13px;
        
	}
	
	#star {
		color:#FE9A2E;		
		font-size: 20px;
	}
	.navbar-nav .nav-item:hover .nav-link {
	  /*네브바 호버 이벤트 */
	  background-color: #FFF7E9;
	  color: orange;
	  border-radius: 5px;
	}
	.navbar-nav .nav-item .nav-link.active {
	  color: orange;
	}
	
    
</style>

</head>
<body>
<!-- 마이페이지내브바 -->
<nav class="navbar navbar-expand-lg bg-body-tertiary" id="mypage_navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="/user/mypagedetail?unum=${unum}" id="mynav_text" style="font-family:IBM Plex Sans KR;">MYPAGE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
      <ul class="navbar-nav ">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/mypagedetail?unum=${unum}" style="font-family:IBM Plex Sans KR;">내 정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/user/mypagegaiplist?unum=${unum}" style="font-family:IBM Plex Sans KR;">내 모임</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagejjimlist?unum=${unum}" style="font-family:IBM Plex Sans KR;">내가 찜한 모임</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagecblist?unum=${unum}" style="font-family:IBM Plex Sans KR;">내가 작성한 게시글</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagecblikelist?unum=${unum}" style="font-family:IBM Plex Sans KR;">내가 추천한 게시글</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
 <h3 class="mb-4">내 모임 총 ${totalCount }개</h3>
		<div class="mymoim-container">			 
		 	<c:forEach var="gm" items="${gaipMoimList}">	
		 	 <a href="/moim/moimdetail?mnum=${gm.mnum}&mname=${gm.mname}">
			  
					 <div class="mymoimitem">
			  		<div class="image-container">	
			  				<c:choose>
								<c:when test="${gm.mphoto==null}">
									<!-- Result값이 없다면 실행할 로직 -->								
										<img src="http://sjrhsefqqpro17075801.cdn.ntruss.com/moim/together.png?type=f&w=200&h=200&ttype=jpg">
								</c:when>
								
								<c:otherwise>
									<img src="http://${imageUrl}/moim/${gm.mphoto}">
								</c:otherwise>
							</c:choose>	  		
				     </div> 
			  				  		     
			      <div class="mymoim-content">
				      <div class="mymoim-title">				      	
				        <p>
				         <c:if test="${gm.mcount eq 1}">
				         <label id="star">
				         <i class="bi bi-star-fill"></i>
				         </label></c:if>
				        ${gm.mname}</p>
				        </div>
				        <div class="mymoim-details">
				        <p>
				       
				        ${gm.city1},${gm.city2}				        
				        </p>
				       
				        </div>
				        <p>${gm.category}</p>    	
					            
			      </div>
			    </div>	            	
				
		    </a>  
		 </c:forEach>
	</div>	 
</div>
</body>
</html>