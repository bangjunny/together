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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
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
	
	.container {
	  max-width: 1800px;
	  margin: 100 100 100 100;
	  flex : auto;
	  padding: 40px 20px;
	  background-color: #fff;
	  border: 1px solid #ddd;
	  box-shadow: 0px 0px 5px #ddd;
	  text-align: center;
	}
	
	.card {
	  width: 18rem;
	  margin: auto;
	  margin-top: 50px;
	  padding: 20px;
	  flex : auto;
	}
	
	.text {
	  width: 18rem;
	  margin: auto;
	  font-size:30px;
	  margin-top: 50px;
	  padding: 20px;
	  flex : auto;
	}
	.thumbnail {
			max-width: 700px;
			margin-bottom: 30px;
			margin-right: 30px;
			padding: 0;
	}

</style>
<script type="text/javascript">
$(function() {
	
	list();
	
});//function close

function list()
{
	$.ajax({
	    type: "GET",
	    url: "/myjjimlist",
	    dataType:"json",
	    success: function(res) {
	    	let s="";
	    	$.each(res,function(idx,ele){
	    		s+=`
	    			<div class = 'jjim_box'>
	    				<b>\${ele.mname}</b>
	    			</div>	
	    		`;
	    	});
	    	$("div.jjimlist").html(s);
	    }
	     
	 });
}
</script>
<body>
<div class="container text-center">
  <div class="row">
    <div class="card col">
      <h3>프로필 사진</h3>
      <c:choose>
        <c:when test="${not empty photoList}">
          <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <c:forEach var="photo" items="${photoList}">
                <c:if test="${photo.is_main == 1}">
                  <div class="carousel-item active">
                    <!-- 대표사진으로 출력하는 코드 -->
                    <h2>마이 프로필사진</h2>
                    <img src="https://${imageUrl}/userprofile/${photo.file_name}" class="profile-photo main" alt="대표사진">
                    <br><br>
                  </div>
                </c:if>
                <c:if test="${photo.is_main != 1}">
                  <div class="carousel-item">
                    <img src="https://${imageUrl}/userprofile/${photo.file_name}" class="profile-photo" alt="포토사진 ${photo.photo_idx}">
                    <br><br>
                    <label><i class="bi bi-x-square photodel" photo_idx="${photo.photo_idx}">사진 삭제하기</i></label>
                    <label><i class="bi bi-award-fill setmain" photo_idx="${photo.photo_idx}">대표사진으로 지정하기</i></label>
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
	          <p>프로필 사진을 한장씩 추가할 수 있어요.</p>
	        </c:otherwise>
      	</c:choose>
	         <!-- Button trigger modal -->           
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myPhotoModal">
                사진 업로드
            </button>
		</div>	
	</div>	
		
    	<div class="text col" id="mypageform" style="display: block;">
    	
        넘버 : ${dto.unum}<br>
        이름 : ${dto.uname}<br>
        생년월일 : ${dto.age}<br>
        성별 : ${dto.gender}<br>
        이메일 : ${dto.email}<br>
        관심카테고리 : ${dto.category}<br>
        전화번호 : ${dto.hp}<br>
        지역 : ${dto.city1} &nbsp; ${dto.city2}<br>
        가입일 : <fmt:formatDate value="${dto.joinday}" pattern="yyyy-MM-dd HH:mm"/><br>
        <br>
    	</div>
    	
    	<div class="text col" id="mypageupdate">
    		<!-- 마이페이지 수정폼 -->
    		마이페이지 수정
    		<button id="mypageupdatebtn">마이페이지 수정하기</button>
    		<div id="mypageupdateform" style="display: none;">
    		<%@include file="mypageupdatecheck.jsp" %>
    		</div>
    	</div>
    		<script type="text/javascript">
				$("#mypageupdatebtn").click(function() {
					$("#mypageform").css("display", "none");
					$("#mypageupdateform").css("display", "block");					
				});
				
			</script>
    	
    	   	
   </div> 
		
			 <div id="mylist_wrap">
			  <!-- 가입한 모임 목록 보여주기 -->
			  나의 모임 리스트 출력하기
			  <button id="mylist_1_btn">만든 모임</button>
			  <button id="mylist_2_btn">찜한 모임</button>
			  <button id="mylist_3_btn">가입한 모임</button>
			  
			  <div id="mylist_1" style="display: block;">
			  <%@ include file="mypagemoimlist.jsp" %>
			  </div>
			  
			  <div id="mylist_2" style="display: none;">
			   <c:choose>
       			 <c:when test="${not empty jjimList}">
          		   <c:forEach var="j" items="${jjimList}">
              		  <h2>내가 찜한 모임 이름 :  ${j.mname}</h2>
             		 </c:forEach>
      			  </c:when>
       			  <c:otherwise>
        			  <p>찜한 목록이 없어요</p>
       			  </c:otherwise>
      		</c:choose>  
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
		
    <br><br><br><br>
    		
			 <div id="mycity_wrap">
			  <!-- 가입한 모임 목록 보여주기 -->
			  나의 모임 리스트 출력하기
			  <button id="mycity_1_btn" onclick="goToTab('myPosts')">내가 쓴 게시글</button>
			  <button id="mycity_2_btn" onclick="goToTab('myFavorites')">내가 찜한 게시글</button>
			
			  
			  <div id="mycity_1" style="display: block;">
			  <%@ include file="mypagecblist.jsp" %>
			  </div>
				  
				<div id="mycity_2" style="display: none;">
					 <%@ include file="mypagecblikelist.jsp" %>
				</div>
			
			</div>
			<script type="text/javascript">
			    function goToTab(tab) {
			        var unum = <%= request.getParameter("unum") %>;
			        location.href = "/mypagedetail?unum=" + unum + "&tab=" + tab;
			    }
			</script>
<!--			
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
-->        
    <div class="mybtn">
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 200px;" onclick="location.href='/moim/moimlist'">모임리스트</button>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 200px;" onclick="location.href='mypagelist'">마이페이지리스트</button>
		
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 200px;" id="delshop">삭제</button>		
	</div>
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
				  <button type="button" class="btn btn-primary" id="submitBtn">저장</button>
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
	        console.log(data);
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
				alert("성공적으로 사진이 바뀌었습니다");
				window.location.href = "/user/mypage"; // 성공 시 mypage로 이동
				
			}
		});
	}
});
</script>
</body>
</html>