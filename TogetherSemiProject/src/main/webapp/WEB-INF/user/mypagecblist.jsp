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
	#mypage_navbar{		
		margin-top: 80px;
	}
 	.container {
	  width: 1440px;
	  margin: 0 auto;
	}
		@media (max-width: 740px) {
	  .cblist-item {
	    width: 100%;
	  }
	}

	.cblist-container {
	  margin-top: 50px;
	  padding: 20px;
	  width: 1440px;
	  margin: 100 auto;
	   padding: 20px;
  }
  	
	.cblist-item {
    display: inline-block;
	width: 48%;
	margin-bottom: 20px;
	padding: 10px;
	background-color: #fff;
	box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
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

  .cblist-thumbnail {
	  width: 80px;
	  height: 80px;
	  margin-right: 10px;
	}
  
   .cblist-item .cblist-content {
    flex-grow: 1;
  }

  .cblist-title {
	font-size: 1.2em;
	margin: 0;
    text-overflow: ellipsis;
	overflow: hidden;
    white-space: nowrap;
    width: 500px; 
    
}
	
  .cblist-item .cblist-details {
    color: #888;
    font-size: 14px;
    margin-top:10px;
    margin-bottom: 10px;
  }
  
  .cblist-item .cblist-description {
    color: #333;
    font-size: 16px;
    margin-bottom:10px;
  }
  
  .cblist-item .cblist-link {
    color: #007bff;
    font-weight: bold;
    text-decoration: none;
    transition: color 0.3s ease;
  }
   .cblist-item:hover {
    color: #0056b3;
  }
	.cblist-link {
	  display: inline-block;
	  padding: 5px 10px;
	  background-color: #fff;
	  color: black;
	  text-decoration: none;
	}

	.cblist-description {
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mypage_navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="/user/mypagedetail?unum=${unum}" id="mynav_text">MYPAGE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/user/mypagedetail?unum=${unum}">내 정보</a>
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
<div class="container">
	<div class="cblist-container">
		 <h3 class="mb-4">내가 쓴 게시물 보기</h3>
			<c:if test="${totalCount==0 }">
				<div class="cblist-item">
					<b style="font-size:1.3em">등록된 게시글이 없습니다</b>
				</div>
			</c:if>
			<c:if test="${totalCount>0 }">	
			 	<c:forEach var="cb" items="${cbList}">	
				  <div class="cblist-item">
				  	<a class="cblist-link" href="/city/detail?cbnum=${cb.cbnum}"> 			     
				      <div class="cblist-content">
				      	<div class="cblist-title">
				        <h3 class="cblist-title">${cb.subject}</h3>
				        </div>
				        <div class="cblist-details">
				          지역:${cb.city1},${cb.city2} | 작성일: 2023-05-18 | 조회수: ${cb.readcount}
				       	          
				        </div>
				        <div class="cblist-description">
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
<!--  
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
-->    
    
   	<br>
<!-- 페이징 처리 -->
		<div style="margin:0 auto;width: 700px; text-align:center; font-size:16px;">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a style="color:black; text-decoration:none; cursor:pointer;"
				href="mypagecblist?unum=${unum }&currentPage=${startPage-1}">이전</a>
			</c:if>
			<!-- 페이지번호 출력 -->
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==pp}">
					<a style="color:blue; font-size: 23px; text-decoration:none; cursor:pointer;"
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