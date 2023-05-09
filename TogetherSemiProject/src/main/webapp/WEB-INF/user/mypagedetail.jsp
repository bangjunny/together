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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container text-center">
    <div class="row">
        <div class="card col">

            <!-- 프로필 사진 출력 -->
            <c:choose>
                <c:when test="${pdto.unum==null}">
                    <!-- Result값이 있다면 실행할 로직 -->
                    <img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
                </c:when>
                <c:otherwise>
                    <!-- 그렇지 않다면 실행할 로직 -->
                    <img src="https://${imageUrl}/userprofile/${pdto.file_name}">
                </c:otherwise>
            </c:choose>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myPhotoModal">
                사진 수정하기
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
<div class="Photo">
  <form id="photoForm" method="post" enctype="multipart/form-data">
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
            <c:choose>
              <c:when test="${pdto.file_name==null}">
                <!-- Result값이 있다면 실행할 로직 -->
                <img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
              </c:when>
              <c:otherwise>
                <!-- 그렇지 않다면 실행할 로직 -->
                <img src="https://${imageUrl}/userprofile/${pdto.file_name}">    
              </c:otherwise>
            </c:choose>
            <!-- 카메라 모양 -->
            <i class="bi bi-camera-fill update-photo" style="font-size: 26px;cursor: pointer;"></i>
            <!-- 파일 업로드 태그 -->
            <div class="mb-3">
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


</body>
</html>