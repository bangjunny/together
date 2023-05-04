<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body, body * {
	font-family: 'Jua'
}
</style>
</head>
<body>
	<h1>지역 게시판</h1>
	<div
		style="width: 500px; background-color: #ddd; margin: 0 auto; margin-top: 40px;">
		<h3>제목${dto.subject}</h3>
		<h6 style="float: right;">추천수${dto.cblike}</h6>
		<h6 style="float: right;">조회수${dto.readcount}&nbsp;</h6>

		<h6 style="float: left">작성자${dto.uname }</h6>
		<h6>작성일${dto.cbwriteday }</h6>

		<hr>
		<div>
			<div>
				<div style="margin-left:10px; border: 5px solid pink; width: 95%; min-height:200px;">사진영역${dto.cbphoto}</div>
			</div>
		</div>
		<br>	
		<pre>
        게시글 영역${dto.cbcontent}
    	</pre>
		<br> <br> <br> <i class="bi bi-hand-thumbs-up"
			style="font-size: 40px; margin-left: 200px"></i> <i
			class="bi bi-hand-thumbs-down"
			style="font-size: 40px; margin-left: 30px"></i>

		<hr>
		<div style="margin: auto">
			<button type="submit" class="btn btn-sm btn-success updatebtn"
				style="margin-left: 180px" onclick="location.href='';">수정</button>
			<button type="button" class="btn btn-sm btn-success"
				onclick="history.back()">목록으로</button>
			<button type="button" class="btn btn-sm btn-success" id="delbtn">삭제</button>
		</div>
		<hr>
		<form action="/action_page.php">
			<div class="mb-3 mt-3">
				<textarea class="form-control" rows="5" id="comment" name="text"
					style="height: 200px; resize: none; width: 500px;"
					placeholder="내용을 입력해주세요"></textarea>
			</div>
			<button type="submit" class="btn btn-primary btn-sm"
				style="float: right; margin-right: 30px;">입력</button>
		</form>
		<br>
		<br>
		<hr>
		<div>
			<br><br>
			<div>
			이전 게시글
			<c:choose>
            	<c:when test="${dto.cbnum==1}">
            	<!-- Result값이 있다면 실행할 로직 -->
            		<h4>이전 글이 없습니다</h4>
            	</c:when>
            	
            	<c:otherwise>
            	<!-- 그렇지 않다면 실행할 로직 -->
                
            	</c:otherwise>
      		</c:choose>
			</div>
			<div>
			다음 게시글
			</div>
		</div>
	</div>

	</div>
</body>
<script type="text/javascript">
	$("#delbtn").click(function() {
		let a = confirm("삭제하려면 확인을 눌러주세요");
		if (a) {
			location.href = ''
		}
	})
</script>
</html>