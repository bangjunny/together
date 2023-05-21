<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
 body {
		 font-family:'Gowun Dodum', sans-serif;
	}
	#mypage_navbar{		
		margin-top:0px;
		

	}
	#mynav_text{		
		margin-left:280px;
		margin-right:35px;
		

	}
	.nav-item{
		margin-left:20px;
		margin-right:20px
	
	}
	.nav-item{
		font-weight:700;
		margin-left:20px;
		margin-right:20px
	
	}
 	.container {
	  width: 1440px;
	  margin: 0 auto;
	  margin-bottom:50px;
	}
	
	@media (max-width: 740px) {
	  .cblike-item {
	    width: 100%;
	    
	  }
	}
	.cblike-container {
		
	  margin:0 auto;
	  margin-bottom:50px;
	  width: 1400px;
	  margin-top:30px;
	  margin-left:-10px;
  }
  	
	.cblike-item {
	margin-top:10px;
	margin-right:20px;
    display: inline-block;
	width: 48%;
	margin-bottom: 20px;
	margin-left:-10px;
	background-color: #fff;
	box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
    font-size: 18px;
    height: 200px; /* 세로 크기를 200px로 고정 */
    overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
    margin-bottom: 10px;
    height:200px;
    transition: box-shadow 0.3s ease;
  }
   .cblike-item:hover {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  .cblike-thumbnail {
	  width: 80px;
	  height: 80px;
	  margin-right: 10px;
	}
  
   .cblike-item .cblike-content {
    flex-grow: 1;
  }
  	.cblike-title {
	 margin: 0;
	 text-overflow: ellipsis;
	overflow: hidden;
    white-space: nowrap;
    width: 500px; 
	}
	
  .cblike-item .cblike-details {
    color: #888;
    font-size: 14px;
    margin-top:10px;
    margin-bottom: 10px;
  }
  
  .cblike-item .cblike-description {
    color: #333;
    font-size: 16px;
    margin-bottom:10px;
  }
  
  .cblike-item .cblike-link {
    color: #007bff;
    font-weight: bold;
    text-decoration: none;
    transition: color 0.3s ease;
  }
   .cblike-item:hover {
    color: #0056b3;
  }
  .cblike-link {
	  display: inline-block;
	  padding: 5px 10px;
	  background-color: #fff;
	  color: black;
	  text-decoration: none;
	}
	.cblike-description {
    	height:100%;
    	overflow:hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-line-clamp: 3; /* 최대 세 줄까지 표시하도록 설정 */
  }
  
    
</style>

</head>
<body>
<!-- 마이페이지내브바 -->
<nav class="navbar navbar-expand-lg bg-body-tertiary" id="mypage_navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="/user/mypagedetail?unum=${unum}" id="mynav_text">MYPAGE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/user/mypagedetail?unum=${unum}">내 정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagegaiplist?unum=${unum}">내 모임</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagejjimlist?unum=${unum}">내가 찜한 모임</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/mypagecblist?unum=${unum}">내가 작성한 게시물</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/user/mypagecblikelist?unum=${unum}">내가 추천한 게시물</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	<div class="cblike-container">
		 <h3 style="margin-bottom:10px;">내가 추천한 게시물 보기</h3>
			<c:if test="${totalCount==0 }">
				<div class="cblike-item">
					<b style="font-size:1.3em">추천한 게시글이 없습니다</b>
				</div>
			</c:if>
			 <c:if test="${totalCount>0 }">	
			 	<c:forEach var="cb" items="${cbLikeList}">	
				  <div class="cblike-item">
				  	<a class="cblike-link" href="/city/detail?cbnum=${cb.cbnum}"> 			     
				      <div class="cblike-content">
				      <div class="cblist-title">
				        <b style="font-size:1.5em">${cb.subject}</b></div>
				        <div class="cblike-details">
				          지역:${cb.city1},${cb.city2} | 조회수: ${cb.readcount} | 
				          작성일: <fmt:formatDate value="${cb.cbwriteday}" pattern="yyyy-MM-dd"/>      
				        </div>
				        <div class="cblike-description">
				          ${cb.cbcontent}
				       	  	<c:choose>
						   		 <c:when test="${moim.mphoto!=null}">
						   		<!-- 이미지있다면 실행할 로직 -->
						   		<img class="mymoim_img" src="https://${imageUrl}/moim/${cb.mphoto}">
						   		 </c:when>		
							</c:choose>
				        </div>				            
				      </div>
				     </a>	
				    </div>
				   
			    </c:forEach>
			  </c:if> 
	</div>
</div>		
    
   	
<!-- 페이징 처리 -->
		<div style="margin:0 auto;width: 700px; text-align:center; font-size:16px; margin-bottom:200px;">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a style="color:black; text-decoration:none; cursor:pointer;"
				href="mypagecblikelist?unum=${unum }&currentPage=${startPage-1}">이전</a>
			</c:if>
			<!-- 페이지번호 출력 -->
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==pp}">
					<a style="color:blue; font-size: 23px; text-decoration:none; cursor:pointer;"
					href="mypagecblikelist?unum=${unum }&currentPage=${pp}">${pp}</a>
				</c:if>
				<c:if test="${currentPage!=pp}">
					<a style="color:black; text-decoration:none; cursor:pointer;"
					href="mypagecblikelist?unum=${unum }&currentPage=${pp}">${pp}</a>
				</c:if>
				&nbsp;
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<a style="color:black; text-decoration:none; cursor:pointer;"
				href="mypagecblikelist?unum=${unum }&currentPage=${endPage+1}">다음</a>
			</c:if>
		</div>

</body>
</html>