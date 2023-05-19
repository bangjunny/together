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
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
 body {
		 font-family: Arial, sans-serif;
	}
	@media (max-width: 740px) {
	  .cblike-item {
	    width: 100%;
	  }
	}
	.container {
	  width: 1440px;
	  margin: 0 auto;
	}
	
	.cblike-container {
	  	margin-top: 150px;
	  	padding: 20px;
	    width: 1440px;
	    margin: 100 auto;
	    padding: 20px;
  }
  	
	 .cblike-item {
    display: inline-block;
	width: 48%;
	margin-bottom: 20px;
	padding: 10px;
	background-color: #fff;
	box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
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
	  font-size: 1.2em;
	  margin: 0;
	}
  
   .cblike-item {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
  }
  .cblike-item .cblike-details {
    color: #888;
    font-size: 14px;
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
  
  .table {
    table-layout: fixed;
    width: 100%;
  }

  .table th {
    white-space: nowrap;
  }

  .table-caption {
    caption-side: top;
    caption-padding: 10px;
    caption-font-weight: bold;
    font-size: 1.2em;
  }

  .table-hover tbody tr:hover {
    background-color: rgba(0, 123, 255, 0.1);
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


<div class="container">
	<div class="cblike-container">
		<h2>내가 추천한 게시물 보기</h2>
		<c:if test="${totalCount==0 }">
			<div class="cblike-item">
				<b style="font-size:1.3em">등록된 게시글이 없습니다</b>
			</div>
		</c:if>
		 <c:if test="${totalCount>0 }">	
		 	<c:forEach var="cb" items="${cbLikeList}">	
			  <div class="cblike-item">
			  	<a class="cblike-link" href="/city/detail?cbnum=${cb.cbnum}"> 			     
			      <div class="cblike-content">
			        <h3 class="cblike-title">${cb.subject}</h3>
			        <div class="cblike-details">
			          작성자: 홍길동 |지역:${cb.city1},${cb.city2} |작성일: 2023-05-18 | 조회수: ${cb.readcount}
			       	          
			        </div>
			        <div class="cblike-description">
			          ${cb.cbcontent}
			       	  	<c:choose>
					   		 <c:when test="${moim.mphoto!=null}">
					   		<!-- 이미지있다면 실행할 로직 -->
					   		<img class="mymoim_img" src="https://${imageUrl}/moim/${moim.mphoto}">
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
 <div class="container cblike-container">
        <h3 class="mb-4">내가 추천한 게시물 보기</h3>        
        <table class="table table-bordered border-primary table-hover table-layout: fixed; width: 100%;">
            <thead class="table-light">
            	<caption>내가 추천한 게시물 보기</caption>
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
                <c:forEach var="cb" items="${cbLikeList}">
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
 -->   	
   	
<!-- 페이징 처리 -->
		<div style="width: 700px; text-align:center; font-size:20px;">
			<!-- 이전 -->
			<c:if test="${startPage>1}">
				<a style="color:black; text-decoration:none; cursor:pointer;"
				href="mypagecblikelist?unum=${unum }&currentPage=${startPage-1}">이전</a>
			</c:if>
			<!-- 페이지번호 출력 -->
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${currentPage==pp}">
					<a style="color:green; text-decoration:none; cursor:pointer;"
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