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
	.showimg{
	
	width:250px;
	
	}
	
	.container {
	  max-width: 1800px;
	  margin: 20 auto;
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


<div>
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
<div class="container text-center">
  <div class="row">
    <div class="card col">
      <h3>프로필 사진</h3>
      <c:choose>
        <c:when test="${not empty photoList}">
          <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://${imageUrl}/userprofile/${pdto.file_name}" class="d-block w-100" alt="대표 사진">
              </div>
             <c:forEach var="photo" items="${photoList}">
                <div class="carousel-item">
                <h2>포토사진 ${photo.photo_idx}</h2>
                    <img src="https://${imageUrl}/userprofile/${photo.file_name}" class="d-block w-100" alt="포토사진 ${photo.photo_idx}"> 
              		  <form method="post" action="/setMainPhoto">
                      <input type="hidden" name="photo_idx" value="${photo.photo_idx}">
                      <button type="submit" class="btn btn-primary" id="setMain">대표 사진으로 지정</button>
                    </form>
              
              </div>
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
		
    	<div class="text col">
        넘버 : ${dto.unum}<br>
        이름 : ${dto.uname}<br>
        생년월일 : ${dto.age}<br>
        성별 : ${dto.gender}<br>
        이메일 : ${dto.email}<br>
        비밀번호 : ${dto.pass}<br>
        전화번호 : ${dto.hp}<br>
        지역 : ${dto.city1} &nbsp; ${dto.city2}<br>
        가입일 : <fmt:formatDate value="${dto.joinday}" pattern="yyyy-MM-dd HH:mm"/><br>
        <br>
    	</div>
   </div> 
		
			 <div>
			  <!-- 가입한 모임 목록 보여주기 -->
			  나의 모임 리스트 출력하기
			  <%@ include file="mypagemoimlist.jsp" %>
			</div>
		
    <br><br><br><br>
    
    <div class="mybtn">
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 200px;" onclick="location.href='login'">모임리스트</button>
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
</script>
<script>
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
</script>
<script>
 $(document).ready(function(){
	$("#setMain").click(function(){
		var photo_idx = $(this).attr("photo_idx");
		
		$.ajax({
	        type: "POST",
	        url: "/setMainPhoto",
	        data: {photo_idx: photo_idx},
	        success: function(data) {
	            if(data.result == "success"){
	            	alert("대표사진으로 설정되었습니다");
	            	window.location.reload();
	            }else {
	            	alert("오류가 발생했습니다")
	            }
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	            alert("서버와의 통신 오류")
	            console.log(xhr);
	        }
	    });
	})	 
 })
 
 

</script>

</body>
</html>