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
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<style>
        body, body * {
            font-family: 'Jua'
        }

        .container  {
            width: 700px;
            margin: 0 auto;
            margin-top: 40px;
            background-color: #ddd;
        }

        .layout > input, textarea {
            width: 100%;
            height: 600px;
            box-sizing: border-box;
            margin-top: 10px;

        }

        .layout > textarea{
            width: 100%;
            margin-top: 50px;
            min-height: 300px;
        }
        
        .ck.ck-editor {

		width: 90%;
		max-width: 800px;
		margin: 0 auto;
		}

		.ck-editor__editable {
			height: 80vh;
		}


    </style>
</head>
<body>
<h1>지역 게시판</h1>

<div style="float:left;">
	<%-- <c:choose>
		<c:when test="${dto.uphoto==null}">
			<!-- Result값이 있다면 실행할 로직 -->
			<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243" style="width:40px; border-radius:100px;">
		</c:when>
		<c:otherwise>
			<!-- 그렇지 않다면 실행할 로직 -->
			<img src="https://${imageUrl}/userprofile/${dto.uphoto}" style="width:40px;">    
		</c:otherwise>
	</c:choose> --%>
</div>
      <h4>${dto.uname}님이 작성 중입니다</h4>
<div class="container">
    <form action="cityinsert" method="post" enctype="multipart/form-data">
        <br>
        <input type="text" class="form-control" name="subject" placeholder="제목을 입력해주세요" style="width: 100%">
        <br>
        <input type="hidden" name="unum" value="${unum}">
        <input type="hidden" name="city1" value="${city1}">
        <input type="hidden" name="city2" value="${city2}">
        <input type="hidden" name="uname" value="${uname}">
        <input type="file" name="upload" id="myfile" multiple="multiple">
        <br>
        <textarea class = "showimg" name ="cbcontent" placeholder="내용입력"></textarea>
        <br>
        <hr>
            <button type="submit" class="btn btn-success" style="margin-left: 260px">작성</button>
            <button type="button" class="btn btn-success" onclick="history.back()" style="margin-left: 50px">취소</button>
        <br>
        <br>

    </form>
</div>
<script type="text/javascript">
	$("#myfile").change(function(){
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
	$("#")
</script>
</body>

</html>