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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<!-- Include the Bootstrap 4 theme -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>

	#photoarea{
	width:400px;
	height:400px;
	}	
	
	#photozone{
	text-align:center;
	}
</style>
</head>
<body>
<!-- 게시판 명 -->
	<br>
	<br>
	<br>
	<!-- 해당 글 정보 영역 -->
	<div style="width: 1440px; margin: 0 auto; margin-top: 40px; border: 1px solid #6E6E6E; border-radius: 5px;">
		<br>
		<h3 style="margin-left:40px;margin-top:10px;">${dto.subject}</h3>
		<h6 style="float: right;">
        <b style="color:#A4A4A4;margin-top:20px;">추천수</b>&nbsp;<span class="likecount" style="margin-right:40px;">${dto.cblike}</span>&nbsp;
      	</h6 >
		<h6 style="float: right;"><b style="color:#A4A4A4">조회수</b> ${dto.readcount}&nbsp;</h6>
		
		<c:choose>
		<c:when test="${mainPhoto!=null }">
		<img src="https://kr.object.ncloudstorage.com/together-bucket-104/userprofile/${mainPhoto}" style="width: 30px;height: 30px;float:left;margin-bottom:10px; margin-left:40px; border-radius:100px;">
		</c:when>
		<c:otherwise>
		<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243" style="width: 30px;height: 30px;float:left;margin-bottom:10px; margin-left:40px; border-radius:100px;">                               
		</c:otherwise>
		</c:choose>
		<h5 style="float: left; margin-left:5px;margin-bottom:20px;">${dto.uname}&nbsp;</h5>
		<h6 style="color:#A4A4A4; margin-top:13px;"> <fmt:formatDate value="${dto.cbwriteday }" pattern="yyyy.MM.dd HH:MM"/> </h6>
		<hr style="width:94%; margin-left:40px">
			<c:if test="${photocount=='0'}">
			<div class="cbcontent" align="center">
            	<img id="photoarea" class="cbcontent_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
    		</div>
    		</c:if>
    		<c:if test="${photocount!='0'}">
    		<div id="photozone">
    		<c:forEach var="pdto" items="${pdto}">
            	<img id="photoarea" class="cbcontent_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/city/${pdto.photo_idx}">
    		</c:forEach>
    		</div>
    	</c:if>
		<br>
		<br>
		<br>
		<div style="width: 1000px; margin:0 auto;">
        ${dto.cbcontent}
    	</div>	
		<br> <br> <br> 
		<!-- 좋아요 버튼 -->
      <div id="likebutton" style="text-align:center ">
      <c:choose>
         <c:when test="${cblikecheck==0}">
            <i class="bi bi-hand-thumbs-up like"
               style="font-size: 40px; cursor: pointer; color:#FE9A2E"  onclick="cblike();"></i>
            <br>
         </c:when>
         <c:otherwise>
            <i class="bi bi-hand-thumbs-up-fill like2"
               style="font-size: 40px; cursor: pointer; color:#FE9A2E" onclick="cbdislike();"></i>
            <br>
         </c:otherwise>
      </c:choose>
      </div>
      <div class="likecount" style="text-align:center">${dto.cblike}</div>
		<hr style="width:94%; margin-left:40px">
		<!-- 버튼 영역 -->
		<div>
			<button type="button" id="golist" class="btn btn-sm text-white" style="margin-left:40px; width:100px;background-color: #FE9A2E"><i class="bi bi-card-list"></i>
			목록으로</button>
			<c:choose>
			 <c:when test="${sessionunum eq dto.unum}">
			  <button type="button" class="btn btn-sm btn-outline-danger" style="width:100px" id="btnupdate">
			    <i class="bi bi-pencil-square"></i>&nbsp;수정
			  </button>
			  
			  <button type="button" id="delbtn" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="del(${dto.cbnum})">
			    <i class="bi bi-trash"></i>&nbsp;삭제
			  </button>
				</c:when>
				<c:otherwise>
				  <button type="button" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: '작성자가 아닙니다...',
					  footer: ''
					})">
				    
				    <i class="bi bi-pencil-square"></i>&nbsp;수정
				  </button>
				  
				  <button type="button" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: '작성자가 아닙니다...',
					  footer: ''
					})">
				    <i class="bi bi-trash"></i>&nbsp;삭제
				  </button>
				</c:otherwise>
				</c:choose>
		</div>
		<br>
		<!-- 댓글 입력 영역 -->
		<form action="newcomment" method="post" id="newcomment">
			<input type="hidden" name="unum" value="${udto.unum}">
			<input type="hidden" name="uname" value="${udto.uname}">
			<input type="hidden" name="cbnum" value="${dto.cbnum}">
			<!-- 댓글 입력 창 -->
			<div class="mb-3 mt-3">
				<textarea class="form-control" rows="5" id="content" name="recontent"
					style="height: 200px; resize: none; width: 1360px;margin:0 auto"
					placeholder="내용을 입력해주세요" required="required"></textarea>
			</div>
			<button type="submit" class="btn btn-sm text-white"
				style="float: right; margin-right: 40px; width:100px;background-color: #FE9A2E">입력</button>
				<br>
		</form>
		<br>
		<div>
			<!-- 댓글 출력 영역 -->
			<br>
			<button type="button" id="showComment" style="margin-left: 40px; margin-bottom: 10px;width:150px; background-color:white;color:#FE642E" 
			class="btn btn-sm"><h6 style="margin-top:5px"><i class="bi bi-chat-dots"></i>&nbsp;댓글 보기</h6></button>
			<br>
			<table id="commentArea" style="border : 1px solid #ddd;width:1296px;margin:0 auto;display:none;">
			<!-- 댓글이 없는 경우 -->
				<c:if test="${totalComment=='0'}">
					<tr>
						<td style="height:80px;">댓글이 없습니다</td>
					</tr>
				</c:if>
			<!-- 댓글이 있는 경우 -->
				<c:if test="${totalComment!='0' }">
					<c:forEach var="listcomment" items="${listcomment}" varStatus="">
						<c:if test="${listcomment.recontent=='' }">
						<tbody style="display:block" id="commentView" data-ref="${listcomment.ref}" data-depth="${listcomment.depth }">
						<tr style="border: 1px solid #ddd;" value="${listcomment.ref}">				
							<td style="width: 1100px;background-color:#ddd;">
								<c:forEach begin="1" end="${listcomment.depth}">
								&nbsp;&nbsp;
								</c:forEach>
								<c:if test="${listcomment.step!='0' }">
									<i class="bi bi-arrow-return-right"></i>
								</c:if>
								<input id="renum" type="hidden" name="renum" value="${listcomment.renum}">
									${listcomment.uname}
								</td>
								<td style="float:right;width:196px; text-align:right;background-color:#ddd;">
									<fmt:formatDate value="${listcomment.rewriteday}" pattern="yyyy.MM.dd HH:MM"/>
								</td>
							</tr>
							<tr style="height:50px">
								<td>
									<c:forEach begin="1" end="${listcomment.depth}">
										&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
								<input id="recomment" type="hidden" value="${listcomment.recontent}">
									<c:if test="${listcomment.recontent!='' }">
									${listcomment.recontent}
									</c:if>
									<c:if test="${listcomment.recontent=='' }">
									삭제된 댓글입니다
									</c:if>
								</td>
							</tr>
								
						</tbody>
						</c:if>
						<c:if test="${listcomment.recontent!='' }">
						<c:choose>
								<c:when test="${listcomment.depth=='0'}">
									<tbody style="display:block" class="commentView" data-ref="${listcomment.ref}" data-depth="${listcomment.depth }">
										<tr style="border: 1px solid #ddd;" value="${listcomment.ref}">				
											<td style="width: 1100px;background-color:#ddd;">
											<c:forEach begin="1" end="${listcomment.depth}">
												&nbsp;&nbsp;
											</c:forEach>
											<c:if test="${listcomment.step!='0' }">
												<i class="bi bi-arrow-return-right"></i>
											</c:if>
											<input id="renum" type="hidden" name="renum" value="${listcomment.renum}">
												${listcomment.uname}
											</td>
											<td style="float:right;width:196px; text-align:right;background-color:#ddd;">
												<fmt:formatDate value="${listcomment.rewriteday}" pattern="yyyy.MM.dd HH:MM"/>
											</td>
										</tr>
										<tr style="height:100px">
											<td>
												<c:forEach begin="1" end="${listcomment.depth}">
													&nbsp;&nbsp;&nbsp;&nbsp;
												</c:forEach>
												&nbsp;
												<input id="recomment" type="hidden" value="${listcomment.recontent}"></div>
													${listcomment.recontent}
											</td>
										</tr>
										<tr>
											<td colspan="3">
												&nbsp;
													<button type="button" id="commentFunction" class="btn btn-sm text-white" style="width:100px;background-color:#FE9A2E">답글 보기</button>
													<c:if test="${sessionScope.unum==listcomment.unum}">
														<button type="submit" id="deleteComment" style="float:right;" class="btn btn-sm btn-danger">삭제</button>
														<button id="updateComment" style="float:right;background-color:#FE9A2E" class="btn btn-sm text-white">수정</button>
													</c:if>
            										<button id="addComment" style="float:right;background-color:#FE9A2E" class="btn btn-sm text-white">답글</button>
											</td>
										</tr>
										<tr>
										<!-- 답글 입력 영역 -->
											<td colspan="3" >
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
														style="height: 100px; resize: none; width: 600px;margin: 0 auto"
														placeholder="${listcomment.recontent}" required="required"></textarea>
													<button type="submit" class="btn btn-primary btn-sm"
													id="submit" style="float: right; margin-right: 30px; margin-top: 20px;">입력</button>
													<br>
													</div>
												</form>
											</td>
				
										</tr>	
									</tbody>
								</c:when>
							<c:otherwise>
								<tbody style="display:none" id="commentView" data-ref="${listcomment.ref}" data-depth="${listcomment.depth }">
									<tr style="border: 1px solid #ddd;" value="${listcomment.ref}">				
										<td style="width: 1100px;background-color:#ddd;">
											<c:forEach begin="1" end="${listcomment.depth}">
												&nbsp;&nbsp;
											</c:forEach>
											<c:if test="${listcomment.step!='0' }">
												<i class="bi bi-arrow-return-right"></i>
											</c:if>
											<input id="renum" type="hidden" name="renum" value="${listcomment.renum}">
											${listcomment.uname}
										</td>
										<td style="float:right;width:196px; text-align:right;background-color:#ddd;">
											<fmt:formatDate value="${listcomment.rewriteday}" pattern="yyyy.MM.dd HH:MM"/>
										</td>
									</tr>
									<tr style="height:50px">
										<td>
											<c:forEach begin="1" end="${listcomment.depth}">
												&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											<input id="recomment" type="hidden" value="${listcomment.recontent}"></div>
												${listcomment.recontent}
											</td>
									</tr>
									<tr>
										<td colspan="3">
											<c:if test="${sessionScope.unum==listcomment.unum}">
												<button type="submit" id="deleteComment" style="float:right" class="btn btn-sm btn-danger">삭제</button>
												<button id="updateComment" style="float:right;background-color:#FE9A2E" class="btn btn-sm text-white">수정</button>
											</c:if>
											<button id="addComment" style="float:right;background-color:#FE9A2E" class="btn btn-sm text-white">답글</button>
										</td>
									</tr>
									<tr>
										<!-- 답글 입력 영역 -->
										<td colspan="3" style="height:10px;">
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
												style="height: 100px; resize: none;width: 600px;margin: 0 auto"
												placeholder="${listcomment.recontent}" required="required"></textarea>
												<button type="submit" class="btn btn-primary"
												id="submit" style="float: right; margin-right: 30px; margin-top: 50px;">입력</button>
												<br>
											</div>
										</form>
									</td>
								</tr>	
							</tbody>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
		</c:if>
	</table>		
</div>
		<hr style="width:94%; margin-left:40px">
		<div>
			
			<!-- 이전 글 다음 글 출력 영역 -->
			<div>
			<h5 style="margin-left:40px;"><b>이전 글</b></h5>
				<c:if test="${not empty precontent}">
					<a href="<c:url value='/city/detail?cbnum=${prenum}'/>"><h6 style="margin-left: 60px;">${precontent}</h6></a>
				</c:if>
				<c:if test="${empty precontent}">
					<h6 style="margin-left: 60px;">이전 게시글이 없습니다</h6>
				</c:if>
			</div>
			<hr style="width:94%; margin-left:40px">
			<div>
			<h5 style="margin-left:40px;"><b>다음 글</b></h5>
				<c:if test="${not empty nxtcontent}">
					<a href="<c:url value='/city/detail?cbnum=${nxtnum}'/>"><h6 style="margin-left: 60px;">${nxtcontent}</h6></a>
				</c:if>
				<c:if test="${empty nxtcontent}">
					<h6 style="margin-left: 60px;">다음 게시글이 없습니다</h6>
				</c:if>
			</div>
			<br>
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
	        $(this).parent().parent().parent().siblings().find("#recontent").css("display","none")
	    } else {
	        $(this).parent().parent().next().find("#recontent").css("display", "none");
	    }
	});
	
	$(document).on("click", "#updateComment", function() {
		var placeHolder=$(this).parent().parent().prev().find('#recomment').val();
		$(this).parent().parent().next().find("#fixComment").attr("action","updatecomment");
		$(this).parent().parent().next().find("#contentSide").attr("placeholder",placeHolder);
		
		let s = $(this).parent().parent().next().find("#recontent").css("display");
	    if (s == "none") {
	        $(this).parent().parent().next().find("#recontent").css("display", "block");
	        $(this).parent().parent().parent().siblings().find("#recontent").css("display","none")
	    } else {
	        $(this).parent().parent().next().find("#recontent").css("display", "none");
	    }
	});
	
	$(document).on("click", "#deleteComment",function(){
		var valueByName=$(this).parent().parent().prev().prev().find('#renum').val();
		let s=confirm("삭제하시겠습니까?")	
		if(s){
			location.href='deleteComment?renum='+valueByName+'&cbnum='+${dto.cbnum}
		}
	});
	
	$(document).on("click","#btnupdate",function(){
		var unum=${dto.unum}
		var cbnum=${dto.cbnum}
		let s=confirm("게시글을 수정하시겠습니까?")
		if(s){
		location.href='cityupdateform?unum='+unum+'&cbnum='+cbnum;
		}
	})
	
	function cblike(){
      const unum = ${sessionunum}
      const cbnum = ${dto.cbnum}
      const cblikecheck = ${cblikecheck}
      const cblikecount = ${dto.cblike}
      $.ajax({
         type:"get",
         url:"cblike",
         dataType:"text",
         data:{"unum":unum,"cbnum":cbnum},
         success:function(res){
            alert("추천되었습니다");
            $(".likecount").html(res);
            $("#likebutton").html(`<i class="bi bi-hand-thumbs-up-fill like2"
               style="font-size: 40px; cursor: pointer; color:#FE9A2E" onclick="cbdislike();"></i>`);
         }
         
      });
   }
	function cbdislike(){
	      const unum = ${sessionunum}
	      const cbnum = ${dto.cbnum}
	      const cblikecheck = ${cblikecheck}
	      const cblikecount = ${dto.cblike}
	      $.ajax({
	         type:"get",
	         url:"cbdislike",
	         dataType:"text",
	         data:{"unum":unum,"cbnum":cbnum},
	         success:function(res){
	            alert("추천이 취소되었습니다");
	            $(".likecount").html(res);
	            $("#likebutton").html(`<i class="bi bi-hand-thumbs-up like"
	                  style="font-size: 40px; cursor: pointer; color:#FE9A2E" onclick="cblike();"></i>`);
	         }
	         
	      });
	   }
	
	$(document).on("click","#commentFunction",function(){
		let ref=$(this).parent().parent().parent().data("ref");
		let depth=$(this).parent().parent().parent().data("depth");
		//console.log(ref)
		//console.log(depth)
		$("tbody[data-ref='" + ref + "'][data-depth!='0']").each(function() {
	        let display = $(this).css("display");
	        $(this).css("display", display === "none" ? "block" : "none");
	    });
		
	})
	
	$("#commentArea").hide();

$("#showComment").click(function() {
  if ($("#commentArea").css("display") === "none") {
	  $("#showComment").css("border","1px solid #FE9A2E")
	  $("#commentArea").css("display", "block");
      $("#commentArea").slideUp(0).slideDown("slow");
  } else {
      $("#commentArea").slideUp("slow", function() {
    	  $("#showComment").css("border","")
        $("#commentArea").css("display", "none");
    });
  }
});

$("#golist").click(function(){
	location.href="/city/list"
})
</script>
</html>



