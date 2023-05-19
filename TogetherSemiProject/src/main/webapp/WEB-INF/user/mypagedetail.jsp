<%@page import="com.semi.dto.MoimDto"%>
<%@page import="com.semi.mapper.MoimMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mypage Detail</title>

<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">


</head>
<style>
	body, body * {
            font-family: 'Noto Sans', sans-serif;
    }

	  .MPtable tbody tr:hover {
	    background-color: #FFF7E9;
	  }
	  
	#mypageupdateicon{
		margin-left:10px;
		color: #FE9A2E;
		cursor:pointer;
	
	}     
    #myinfotable{
     text-algin:left;
    }    
	.photodel, .setmain{
		cursor:pointer;
	}

	.profile-photo {
	  width: 400px;
	  height: 400px;
	  object-fit: cover;
	}
	
	.profile-photo.main {
	  border-radius: 50%;
	  object-fit: contain;
	}
	
	.showimg{
	
	width:250px;
	object-fit: contain;
	}
	
	#myprofile{
		margin-left:20px;
	}
	
	.container {
	  margin-top:100px;
	  margin-left:10px;
	  max-width: 1440px;
	  margin: 100 100 100 100;
	  flex : auto;
	  padding: 20px 20px 20px 20px;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  box-shadow: 0px 0px 5px #ddd;
	}
	
	.card {
	  width: 18rem;
	  margin: auto;
	  margin-top: 50px;
	  padding: 20px;
	  flex : auto;
	}

	#sidebarmenu {
		position: relative;
		margin-right : 100px;
		width: 150px;
	}
	
	#sidebarmenu button {		
		margin-top: 80px;
	}
	
	.offcanvas-body button{
		margin-top : 30px;
		margin-left: 37px;
		width: 200px;
		background: #FE9A2E;
        background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        border-radius: 3px;
	}
	.offcanvas-body button:hover{
		margin-top : 30px;
		margin-left: 37px;
		width: 200px;
		background: #FE642E;
        background-size: 200%;
        color:white;
        font-weight: 800;
        border:none;
        cursor:pointer;
        border-radius: 3px;
	}
	
	#mylist_wrap {
		display: none;
		margin-top:150px;
	}
	
	#mycity_wrap {
		display: none;
		margin-top:150px;
	}	

</style>

<body>
<!-- 삼선버튼 -->
<button class="btn btn-outline" type="button" id="dropdownMenuBtn" data-bs-toggle="dropdown" aria-expanded="false">
  <i class="bi bi-list" style="font-size:30px;">메뉴</i>
</button>

<!-- 드롭다운 메뉴 -->
<ul class="dropdown-menu" aria-labelledby="dropdownMenuBtn">
  <li><a class="dropdown-item" onclick="location.href='/user/mypagedetail?unum=${unum}'"><i class="bi bi-house-fill"></i> 마이프로필 홈</a></li>
  <li><a class="dropdown-item" onclick="location.href='/user/mypagegaipmoimlist?unum=${unum}'"><i class="bi bi-people-fill"></i> 내 모임</a></li>
  <li><a class="dropdown-item" onclick="location.href='/user/mypagegaipmoimlist?unum=${unum}'"><i class="bi bi-people-fill"></i> 내가 찜한 모임</a></li>
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


<!-- 
<div class="offcanvas offcanvas-end" id="mypagemenu" style="width:300px">
  	<div class="offcanvas-header">
    <h1 class="offcanvas-title">MyPage Menu</h1>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
	</div>
	<div class="offcanvas-body">
	    <button class="btn sidebar_1_btn"><i class="bi bi-house-fill"></i>&nbsp; 마이프로필 홈</button><br>
	    <button class="btn sidebar_2_btn"><i class="bi bi-people-fill"></i>&nbsp; 내 모임</button><br>
	    <button class="btn sidebar_3_btn" onclick="location.href='/user/mypagecblist?unum=${unum}'"><i class="bi bi-pencil-square"></i>&nbsp; 내가 작성한 글</button><br>
	    <button class="btn sidebar_3_btn" onclick="location.href='/user/mypagecblikelist?unum=${unum}'"><i class="bi bi-heart-fill"></i>&nbsp; 내가 추천한 게시글</button>

	</div>
</div>

<div class="container-fluid mt-3" id="sidebarmenu">
  <button class="btn btn-outline danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#mypagemenu">
    <i class="bi bi-list" style="font-size:30px;">메뉴</i>
  </button>
</div>

		<script type="text/javascript">
				$(".sidebar_1_btn").click(function() {
					$("#myprofile").css("display", "block");
					$("#mylist_wrap").css("display", "none");
				});
				$(".sidebar_2_btn").click(function() {
					$("#myprofile").css("display", "none");
					$("#mylist_wrap").css("display", "block");
				});
				
		</script>

 사이드바-->
<div class="container text">
	<div id="myprofile"  style="display: block;">
  		<div class="row">
	    <div class="card col text-center">
	      <h3>프로필 사진</h3>
	      <c:choose>
	        <c:when test="${not empty photoList}">
	          <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	            <div class="carousel-inner">
	              <c:forEach var="photo" items="${photoList}">
	                <c:if test="${photo.is_main == 1}">
	                  <div class="carousel-item active">
	                    <!-- 대표사진으로 출력하는 코드 -->	                             
	                    <img src="https://${imageUrl}/userprofile/${photo.file_name}" class="profile-photo main" alt="대표사진">
	                    <br><br>
	                    <label><i class="bi bi-award-fill">나의 대표사진</i></label>    
	                  </div>
	                </c:if>
	                <c:if test="${photo.is_main != 1}">
	                  <div class="carousel-item">
	                    <img src="https://${imageUrl}/userprofile/${photo.file_name}" class="profile-photo" alt="포토사진 ${photo.photo_idx}">
	                    <br><br>
	                    <label><i class="bi bi-award setmain" photo_idx="${photo.photo_idx}">대표사진으로 지정하기</i></label>
	                    <label><i class="bi bi-x-square photodel" photo_idx="${photo.photo_idx}">사진 삭제하기</i></label> 
	                  </div>
	                </c:if>
	              </c:forEach>
	            </div>
	            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	              <span class="visually-hidden">Previous</span>
	            </button>
	            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	              <span class="carousel-control-next-icon" aria-hidden="true"></span>
	              <span class="visually-hidden">Next</span>
	            </button>
	          </div>
	        </c:when>
		        <c:otherwise>
		          <img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
		          <p>프로필 사진을 추가해보세요!</p>
		        </c:otherwise>
	      	</c:choose>
		         <!-- Button trigger modal -->           
	            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#myPhotoModal">
	                사진 업로드
	            </button>
			</div>	
				<div class="text col" style="display: block;">
				    <table class="table table-borderless table-hover MPtable" id="myinfotable">
				        <tbody>
				            <tr>
				                <th scope="row">넘버</th>
				                <td>${dto.unum}</td>
				            </tr>
				            <tr>
				                <th scope="row">이름</th>
				                <td>${dto.uname}</td>
				            </tr>
				            <tr>
				                <th scope="row">생년월일</th>
				                <td>${dto.age}</td>
				            </tr>
				            <tr>
				                <th scope="row">성별</th>
				                <td>${dto.gender}</td>
				            </tr>
				            <tr>
				                <th scope="row">이메일</th>
				                <td>${dto.email}</td>
				            </tr>
				            <tr>
				                <th scope="row">관심카테고리</th>
				                <td>${dto.category}</td>
				            </tr>
				            <tr>
				                <th scope="row">전화번호</th>
				                <td>${dto.hp}</td>
				            </tr>
				            <tr>
				                <th scope="row">지역</th>
				                <td>${dto.city1}&nbsp;${dto.city2}</td>
				            </tr>
				            <tr>
				                <th scope="row">가입일</th>
				                <td><fmt:formatDate value="${dto.joinday}" pattern="yyyy-MM-dd"/></td>
				            </tr>
				        </tbody>
				    </table>
				    <div class="text" id="mypageupdate">
		    		<!-- 마이페이지 수정폼 -->
		    		<label>
		    		<a data-toggle="tooltip" data-placement="right" title="마이페이지 수정하기" >
		    		<i class="bi bi-gear" id="mypageupdateicon">수정</i>
		    		</a>
		    		</label>
		    		<!--
		    		<button class="btn btn-outline-danger">마이페이지 수정하기</button>
		    		-->
		    		<div id="mypageupdateform" style="display: none;">
		    		<%@include file="mypageupdatecheck.jsp" %>
		    		</div>
			    	</div>
		    		<script type="text/javascript">
		    			$(document).ready(function() {
		    			  $('[data-toggle="tooltip"]').tooltip();
		    			  
						$("#mypageupdateicon").click(function() {
								
								$("#myinfotable").css("display", "none");
								$("#mypageupdateform").css("display", "block");	
						});			
						});	
					</script>
			</div>
		</div> 	  
	</div>	  
	 <!-- 가입한 모임 목록 보여주기 -->
		
		<div id="mylist_wrap"  style="display: none;"> 
			  나의 모임 리스트 출력하기
			  
			  <button id="mylist_1_btn">내가 만든 모임</button>
			  </a>
			  <button id="mylist_2_btn">내가 찜한 모임</button>
			  <button id="mylist_3_btn">가입한 모임</button>
			  
			  <div id="mylist_1" style="display: block;">
			  <%@ include file="mypagemoimlist.jsp" %>
			  </div>
			  <div id="mylist_2" style="display: none;">
			  <%@ include file="mypagejjimlist.jsp" %>
			  </div>
			 
			<div id="mylist_3" style="display: none;">
				 <%@ include file="mypagegaiplist.jsp" %>
			</div>	
		</div>	
			<script type="text/javascript">
				$("#mylist_2_btn").click(function() {
					$("#mylist_1").css("display", "none");
					$("#mylist_2").css("display", "block");
					$("#mylist_3").css("display", "none");
				});
				$("#mylist_1_btn").click(function() {
					$("#mylist_1").css("display", "block");
					$("#mylist_2").css("display", "none");
					$("#mylist_3").css("display", "none");
				});
				$("#mylist_3_btn").click(function() {
					$("#mylist_1").css("display", "none");
					$("#mylist_2").css("display", "none");
					$("#mylist_3").css("display", "block");
				});
				
			</script>
  
</div>	

<hr>
<div class="Container Photo">
<form action="/user/mypageinsert" method="post" enctype="multipart/form-data">
	<!-- 사진 변경 모달 -->
	<div class="modal" id="myPhotoModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">사진 넣기</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
			
			    <!-- Modal body -->
			    <div class="modal-body">
					 <c:choose>
			          <c:when test="${pdto.file_name==null}">
			         <!-- Result값이 있다면 실행할 로직 -->
			         <img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243" class="showimg">
			          </c:when>
			          <c:otherwise>
			       <!-- 그렇지 않다면 실행할 로직 -->
			       <img src="https://${imageUrl}/userprofile/${pdto.file_name}" class="showimg">    
			          </c:otherwise>
			      </c:choose>
			   	 
			   	 	<div class="mb-3">
			         <!-- 카메라 모양 -->
			        <i class="bi bi-camera-fill update-photo"
			        style="font-size: 26px;cursor: pointer;"></i>
			        <!-- 파일 업로드 태그 -->
				      <label for="photoInput" class="form-label">사진 선택</label>
				      <input class="form-control" type="file" id="upload" name="upload">
				    </div>
				</div>
		      
		      <!-- Modal footer -->
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				  <button type="submit" class="btn btn-primary" id="submitBtn">저장</button>
				</div>
	    </div>
	  </div> 
	 </div>
</form>
</div> 
<script type="text/javascript">
$("#upload").change(function(){
	console.log("1:"+$(this)[0].files.length);
	console.log("2:"+$(this)[0].files[0]);
	//정규표현식
	var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
	var f=$(this)[0].files[0];//현재 선택한 파일
	if(!f.type.match(reg)){
		alert("확장자가 이미지파일이 아닙니다");
		return;
	}
	if($(this)[0].files[0]){
		var reader=new FileReader();
		reader.onload=function(e){
		$(".showimg").attr("src",e.target.result);
		}
		reader.readAsDataURL($(this)[0].files[0]);
	}
});	


$(document).ready(function() {
	  $('#submitBtn').click(function() {
	    var formData = new FormData($('form')[0]);

	    $.ajax({
	      url: "/user/mypageinsert",
	      type: 'POST',
	      data: formData,
	      async: false,
	      success: function (data) {
	    	alert("사진이 성공적으로 올라갔습니다");
	        window.location.href = "/user/mypage"; // 성공 시 mypage로 이동
	      },
	      cache: false,
	      contentType: false,
	      processData: false
	    });
	  });    
});

//x아이콘 이벤트		
$(document).on("click",".photodel",function(e){
	
	console.log('click');
	let b=confirm("해당 사진을 삭제하시겠습니까?");
	if(b){
		let photo_idx=$(this).attr("photo_idx");
		//alert(photo_idx);
		$.ajax({
			type:"get",
			url:"/user/deletephoto",
			data:{"photo_idx":photo_idx},
			dataType:"text",
			success:function(){
				alert("삭제되었습니다");
				window.location.href = "/user/mypage"; // 성공 시 mypage로 이동
				
			}
		});
	}
});
//메인포토 이벤트		
$(document).on("click",".setmain",function(e){
	
	console.log('click');
	let m=confirm("해당 사진을 대표사진으로 선택하시겠습니까?");
	if(m){
		let photo_idx=$(this).attr("photo_idx");
		//alert(photo_idx);
		$.ajax({
			type:"get",
			url:"/user/updatephoto",
			data:{"photo_idx":photo_idx},
			dataType:"text",
			success:function(){
				alert("성공적으로 사진이 바뀌었습니다")
				window.location.href = "/user/mypage"; // 성공 시 mypage로 이동
				
			}
		});
	}
});
</script>
</body>
</html>