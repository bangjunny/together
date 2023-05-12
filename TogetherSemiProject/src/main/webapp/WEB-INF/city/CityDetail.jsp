<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp" %>
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
.cbcontent_img{
	width:400px;
	height:420px;
	margin:20px;
}
</style>
</head>
<body>
<!-- 게시판 명 -->
	<h1>지역 게시판</h1>
	<!-- 해당 글 정보 영역 -->
	<div style="width: 800px; background-color: #ddd; margin: 0 auto; margin-top: 40px;">
		<h3>${dto.subject}</h3>
		<h6 style="float: right;"><b>추천수</b> ${dto.cblike}</h6>
		<h6 style="float: right;"><b>조회수</b> ${dto.readcount}&nbsp;</h6>

		<h6 style="float: left"><b>작성자</b> ${dto.uname}&nbsp;</h6>
		<h6><b>작성일</b> ${dto.cbwriteday }</h6>

		<hr>
			<c:if test="${photocount=='0'}">
			<div class="cbcontent" align="center">
            	<img id="photoarea" class="cbcontent_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
    		</div>
    		</c:if>
    		<c:if test="${photocount!='0'}">
    		<c:forEach var="pdto" items="${pdto}">
    		<div class="cbcontent" align="center">
            	<img id="photoarea" class="cbcontent_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/city/${pdto.photo_idx}">
    		</div>
    	</c:forEach>
    	</c:if>
		<br>	
		<pre>
        ${dto.cbcontent}
    	</pre>
		<br> <br> <br> 
		<i class="bi bi-hand-thumbs-up" style="font-size: 40px; margin-left: 200px"></i>
		<br>${dto.cblike}
		<hr>
		<!-- 버튼 영역 -->
		<div style="margin: auto">
			<!-- <button type="submit" class="btn btn-sm btn-success updatebtn"
				style="margin-left: 180px" onclick="location.href='';">수정</button> -->
			<button type="button" class="btn btn-sm btn-success"
				onclick="history.back()">목록으로</button>
			<!-- <button type="button" class="btn btn-sm btn-success" id="delbtn">삭제</button> -->
			<c:choose>
			 <c:when test="${sessionunum eq dto.unum}">
			  <button type="button" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="location.href='updateboardform.jsp?num=${dto.cbnum}'">
			    <i class="bi bi-pencil-square"></i>&nbsp;수정
			  </button>
			  
			  <button type="button" id="delbtn" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="del(${dto.cbnum})">
			    <i class="bi bi-trash"></i>&nbsp;삭제
			  </button>
				</c:when>
				<c:otherwise>
				  <button type="button" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="alert('작성자가 아닙니다')">
				    <i class="bi bi-pencil-square"></i>&nbsp;수정
				  </button>
				  
				  <button type="button" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="alert('작성자가 아닙니다')">
				    <i class="bi bi-trash"></i>&nbsp;삭제
				  </button>
				</c:otherwise>
				</c:choose>
		</div>
		<hr>
		<!-- 댓글 입력 영역 -->
		<form action="newcomment" method="post" id="newcomment">
			<input type="hidden" name="unum" value="${udto.unum}">
			<input type="hidden" name="uname" value="${udto.uname}">
			<input type="hidden" name="cbnum" value="${dto.cbnum}">
			<!-- 댓글 입력 창 -->
			<div class="mb-3 mt-3">
				<textarea class="form-control" rows="5" id="content" name="recontent"
					style="height: 200px; resize: none; width: 500px;"
					placeholder="내용을 입력해주세요"></textarea>
			</div>
			<button type="submit" class="btn btn-primary btn-sm"
				style="float: right; margin-right: 30px;">입력</button>
		</form>
		<br>
		<div>
			<!-- 댓글 출력 영역 -->
			<caption align="top" style="width: 500px">총 ${totalComment}개의 댓글</caption>
			<table style="border : 1px solid black;width:700px;">
			
			<hr>
			<!-- 댓글이 없는 경우 -->
			<c:if test="${totalComment=='0'}">
				<tr>
					<td>댓글이 없습니다</td>
				</tr>
			</c:if>
			<!-- 댓글이 있는 경우 -->
			<c:if test="${totalComment!='0' }">
			<c:forEach var="listcomment" items="${listcomment}">
			<c:if test="${listcomment.recontent=='' }">
			<tr style="border: 1px solid black;">
				<td>
				<c:forEach begin="1" end="${listcomment.depth}">
					&nbsp;&nbsp;
				</c:forEach>
				<c:if test="${listcomment.step!='0' }">
				<i class="bi bi-arrow-return-right"></i>
				</c:if>
				삭제된 댓글입니다
				</td>
			</tr>	
			</c:if>
			<c:if test="${listcomment.recontent!='' }">
				<tr style="border: 1px solid black;">				
					<td>
					<c:forEach begin="1" end="${listcomment.depth}">
					&nbsp;&nbsp;
					</c:forEach>
					<c:if test="${listcomment.step!='0' }">
					<i class="bi bi-arrow-return-right"></i>
					</c:if>
					<input id="renum" type=hidden name="renum" value="${listcomment.renum}">
					${listcomment.uname}
					</td>
					<td style="float:right">
					${listcomment.rewriteday}
					</td>
				</tr>
				<tr>
					<td>
					<c:forEach begin="1" end="${listcomment.depth}">
					&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					${listcomment.recontent}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${sessionScope.unum==listcomment.unum}">
						<button type="submit" id="deleteComment" style="float:right">삭제</button>
						<button id="updateComment" style="float:right">수정</button>
						</c:if>
						<button id="addComment" style="float:right">답글</button>
					</td>
				</tr>
				<tr>
				<!-- 답글 입력 영역 -->
				<td colspan="2" >
					<form id="fixComment" action="addcomment" method="post">
						<input type="hidden" name="renum" value="${listcomment.renum}">
						<input type="hidden" name="unum" value="${udto.unum}">
						<input type="hidden" name="uname" value="${udto.uname}">
						<input type="hidden" name="cbnum" value="${dto.cbnum}">
						<input type="hidden" name="ref" value="${listcomment.ref}">
						<input type="hidden" name="step" value="${listcomment.step}">
						<input type="hidden" name="depth" value="${listcomment.depth}">
						<div id="recontent" style="display: none;" >
							<textarea id="contentSide" class="form-control" rows="5" name="recontent"
							style="height: 100px; resize: none; width: 494px;"
							placeholder="${listcomment.recontent}"></textarea>
							<button type="submit" class="btn btn-primary btn-sm"
							id="submit" style="float: right; margin-right: 30px;">입력</button>
						</div>
					</form>
					</td>
				
				</tr>	
				</c:if>
				</c:forEach>
			</c:if>
			</table>
			
		</div>
		<br>
		<hr>
		<div>
			<br><br>
			<!-- 이전 글 다음 글 출력 영역 -->
			<div><h4>이전 글</h4>
				<c:if test="${not empty precontent}">
					<a href="<c:url value='/city/detail?cbnum=${prenum}'/>"><h4>${precontent}</h4></a>
				</c:if>
				<c:if test="${empty precontent}">
					<h4>이전 게시글이 없습니다</h4>
				</c:if>
			</div>
			<br>
			<div><h4>다음 글</h4>
				<c:if test="${not empty nxtcontent}">
					<a href="<c:url value='/city/detail?cbnum=${nxtnum}'/>"><h4>${nxtcontent}</h4></a>
				</c:if>
				<c:if test="${empty nxtcontent}">
					<h4>다음 게시글이 없습니다</h4>
				</c:if>
			</div>
		</div>
	</div>
	
	</div>
</body>
<script type="text/javascript">
	$(document).on("click", "#delbtn", function() {
		let b=confirm("삭제를 하려면 [확인]을 눌러주세요");
		if(b){
			location.href="delete?cbnum="+${dto.cbnum};
		}
	});
	
	$(document).on("click", "#addComment", function() {
		$(this).parent().parent().next().find("#fixComment").attr("action","addcomment");
		$(this).parent().parent().next().find("#contentSide").attr("placeholder","내용을 입력해주세요")
		let s = $(this).parent().parent().next().find("#recontent").css("display");
	    if (s == "none") {
	        $(this).parent().parent().next().find("#recontent").css("display", "block");
	    } else {
	        $(this).parent().parent().next().find("#recontent").css("display", "none");
	    }
	});
	
	$(document).on("click", "#updateComment", function() {
		$(this).parent().parent().next().find("#fixComment").attr("action","updatecomment");
		
		let s = $(this).parent().parent().next().find("#recontent").css("display");
	    if (s == "none") {
	        $(this).parent().parent().next().find("#recontent").css("display", "block");
	    } else {
	        $(this).parent().parent().next().find("#recontent").css("display", "none");
	    }
	});
	
	$(document).on("click", "#deleteComment",function(){
		var valueByName=$(this).parent().parent().prev().prev().find('#renum').val();
		let s=confirm("삭제하시겠습니까?")
		alert(valueByName);	
		if(s){
			location.href='deleteComment?renum='+valueByName+'&cbnum='+${dto.cbnum}
		}
	});
	
</script>
</html>