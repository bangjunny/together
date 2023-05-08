<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="10;url=./list">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>

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
<style>
		.thumbnail {
			height: 200px;
			width: 200px;
			margin-bottom: 30px;
			margin-right: 30px;
			padding: 0;
		}

		.caption {
			word-wrap: break-word;
		}
	</style>
	<script>
		$(document).ready(function() {
			// 이미지 클릭시 모달 열기
			$(".thumbnail").click(function() {
				// 모달 내용 초기화
				$("#myPhotoModal .modal-body").html("");

				// 선택한 이미지 정보 가져오기
				var photo_idx = $(this).data("photo_idx");
				var unum = $(this).data("unum");
				var url = $(this).data("url");
				var name = $(this).data("file_name");
				var date = $(this).data("upload_date");
				

				// 모달 내용 추가
				var modalBody = "<img src='" + url + "' class='img-responsive' />";
				modalBody += "<p>" + name + "</p>";
				$("#myPhotoModal .modal-body").append(modalBody);

				// 모달 열기
				$("#myPhotoModal").modal();
			});
		});
	</script>

</head>
<body>

<div class="container text-center">
	<div class ="row">
		<div class ="card col">
		<button type="button" class="btn btn-outline-success btn-sm"
			data-bs-toggle="modal" data-bs-target="#myPageModal">마이페이지 내용 수정하기 </button>	
		 <!-- 프로필 사진 출력 -->
		<c:if test="${not empty UserPhotoDto.photo_idx}">
			<div class="col-md-3">
				<img src="${UserPhotoDto.photo_dix}" class="img-responsive" />
			</div>
		</c:if> 
		 
		      <!-- Button trigger modal -->
		     	      
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myPhotoModal">
				  사진 수정하기
				</button>
				
		      
		</div>	
		<div class="text col">
		
			넘버  : ${dto.unum}<br>
			이름 : ${dto.uname}<br>
			생년월일 : ${dto.age}<br>
			성별 : ${dto.gender}<br>
			이메일 : ${dto.email}<br>
			비밀번호 : ${dto.pass}<br>
			전화번호 : ${dto.hp}<br>
			지역  : ${dto.city1} &nbsp;
					${dto.city2}<br>
			가입일 : <fmt:formatDate value="${dto.joinday}" pattern="yyyy-MM-dd HH:mm"/><br>
			<br>
		 </div>
		 <div class="text col">
		 	<c:forEach var="post" items="${posts}">
                    <tr>
                        <td><a href="post?id=${post.id}">${post.title}</a></td>
                        <td><fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd"/></td>
                        <td>${post.viewCount}</td>
                        <td><a href="editPost?id=${post.id}">수정</a></td>
                        <td><a href="deletePost?id=${post.id}">삭제</a></td>
                    </tr>
                </c:forEach>
		 
		 </div>
		 <br><br><br><br>
				 			
		<div>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 200px;" onclick="location.href='login'">모임리스트</button>
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 200px;" onclick="location.href='mypagelist'">마이페이지리스트</button>
		
		<button type="button" class="btn btn-outline-success btn-sm"
		style="width: 200px;" id="delshop">삭제</button>		
		</div>
	</div>	
</div>
<hr>
<!-- 사진 변경 모달 -->
<div class="modal" id="myPhotoModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">사진 수정</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
		
		    <!-- Modal body -->
		    <div class="modal-body">
		   	 <form id="photoForm">
		        <img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243"
		         border="2" style="margin-left: 30px;border-radius: 50px;" id="modalphoto">
		         <!-- 카메라 모양 -->
		        <i class="bi bi-camera-fill update-photo"
		        style="font-size: 26px;cursor: pointer;"></i>
		        <!-- 파일 업로드 태그 -->
			      <div class="mb-3">
			      <label for="photoInput" class="form-label">사진 선택</label>
			      <input class="form-control" type="file" id="photoInput" name="uphoto">
			    </div>
		   	</form>
			</div>
	      
	      <!-- Modal footer -->
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			  <button type="button" class="btn btn-primary" id="submitBtn">저장</button>
			</div>
    </div>
  </div> 
 </div>  
<script>
$(function() {
  // 사진 변경 모달이 열릴 때 실행되는 함수
  $('#myPhotoModal').on('show.bs.modal', function (event) {
    var modal = $(this);
    // 저장 버튼 클릭 시 실행될 함수 등록
    modal.find('#submitBtn').click(function() {
      var form = document.getElementById('photoForm');
      var formData = new FormData(form);
      $.ajax({
        url: 'photoUpload',  // 파일 전송을 처리할 서블릿 URL
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(result) {
          // 파일 전송이 성공하면 모달을 닫고 페이지를 새로고침합니다.
          modal.modal('hide');
          location.reload();
        },
        error: function(xhr, status, error) {
          // 파일 전송이 실패하면 오류 메시지를 출력합니다.
          console.error(error);
          alert('파일 전송에 실패했습니다.');
        }
      });
    });
  });
});
</script>
</body>
</html>
