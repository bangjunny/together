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
	width:300px;
	height:300px;
	}	
	
	#photoarea1{
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
	<!-- 해당 글 정보 영역 -->
	<div style="width: 1140px; margin: 0 auto; margin-top: 40px; border-radius: 5px;background-color: #FCFCF5">
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
		<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png" style="width: 30px;height: 30px;float:left;margin-bottom:10px; margin-left:40px; border-radius:100px;">                               
		</c:otherwise>
		</c:choose>
		<h5 style="float: left; margin-left:5px;margin-bottom:20px;">${dto.uname}&nbsp;</h5>
		<h6 style="color:#A4A4A4; margin-top:13px;"> <fmt:formatDate value="${dto.cbwriteday }" pattern="yyyy.MM.dd HH:MM"/> </h6>
		<hr style="width:94%; margin-left:40px">
			<c:if test="${photocount=='0'}">
			<div class="cbcontent" align="center">
            	<img id="photoarea1" class="cbcontent_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png">
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
		<pre style="width: 1000px; margin:0 auto;">
        ${dto.cbcontent}
    	</pre>	
		<br><br><br> 
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
			<button type="button" id="golist" class="btn btn-sm" style="margin-left:40px; width:100px;border:1px solid #FE9A2E;color:#FE9A2E"><i class="bi bi-card-list"></i>
			목록으로</button>
			<c:choose>
			 <c:when test="${sessionunum eq dto.unum}">
			  <button type="button" class="btn btn-sm btn-outline-success" style="width:100px" id="btnupdate">
			    <i class="bi bi-pencil-square"></i>&nbsp;수정
			  </button>
			  
			  <button type="button" id="delbtn" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="del(${dto.cbnum})">
			    <i class="bi bi-trash"></i>&nbsp;삭제
			  </button>
				</c:when>
				<c:otherwise>
				  <button type="button" class="btn btn-sm btn-outline-success" style="width:100px" onclick="Swal.fire({
					  icon: 'error',
					  title: '',
					  text: '작성자가 아닙니다',
					  footer: ''
					})">
				    
				    <i class="bi bi-pencil-square"></i>&nbsp;수정
				  </button>
				  
				  <button type="button" class="btn btn-sm btn-outline-danger" style="width:100px" onclick="Swal.fire({
					  icon: 'error',
					  title: '',
					  text: '작성자가 아닙니다',
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
					style="height: 200px; resize: none; width: 1060px;margin:0 auto"
					placeholder="내용을 입력해주세요" maxlength="499" required="required"></textarea>
			</div>
			<button type="submit" class="btn btn-sm text-white"
				style="float: right; margin-right: 40px; width:100px;background-color: #FE9A2E">입력</button>
				<br>
		</form>
		<br>
		<div>
			<!-- 댓글 출력 영역 -->
			<button type="button" id="showComment" style="margin-left: 40px; margin-bottom: 10px;width:150px; background-color:#FE9A2E" 
			class="btn btn-sm text-white"><h6 style="margin-top:5px"><i class="bi bi-chat-dots"></i>&nbsp;댓글 보기 (${totalComment})</h6></button>
			<div style="display:none;margin:72px;" id="commentArea">
				<c:if test="${totalComment=='0'}">
				<table>
					<tr style="height:100px;">
						<td style="text-align:center;width:1096px;border:1px solid #ddd;border-radius:5px;"><h4>댓글이 없습니다 댓글을 달아주세요</h4></td>
					</tr>
				</table>
				</c:if>
				<c:if test="${totalComment!='0'}">
			<c:forEach var="listcomment" items="${listcomment}">
				<c:choose>
					<c:when test="${listcomment.depth=='0'}">
					<!-- 원 댓글 -->
					<br>
					<table style="display: block;border:1px solid #ddd;max-width: 1026px;border-radius:5px;" class="commentView" data-ref="${listcomment.ref}" data-step="${listcomment.step}" data-depth="${listcomment.depth }">
						<tr style="border: 1px solid #ddd;" value="${listcomment.ref}">
							<td style="width:800px;background-color:#ddd;">
								<c:forEach begin="1" end="${listcomment.depth}">
									&nbsp;&nbsp;
								</c:forEach>
								<c:if test="${listcomment.recontent!='' }">
								<input id="renum" type="hidden" name="renum" value="${listcomment.renum}">
								${listcomment.uname}
								</c:if>
								
							</td>
							<td style="float:right;width:226px; text-align:right;background-color:#ddd;">
							<c:if test="${listcomment.recontent!='' }">
								<fmt:formatDate value="${listcomment.rewriteday}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
							
							</td>
						</tr>
						<tr style="height:100px; word-break: break-all;">
							<td colspan="2">
							<c:forEach begin="1" end="${listcomment.depth}">
							&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							&nbsp;
							<input id="recomment" type="hidden" value="${listcomment.recontent}">
							<c:if test="${listcomment.recontent!='' }">
							<pre>${listcomment.recontent}</pre>
							</c:if>
							<c:if test="${listcomment.recontent=='' }">
							삭제된 댓글입니다
							</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							&nbsp;
							<c:if test="${listcomment.recontent!=''}">
        					<button type="button" id="commentFunction" class="btn btn-sm text-white" style="width:100px;background-color:#FE9A2E;margin-bottom:10px;">답글 보기</button>
            				<button id="addComment" style="float:right;margin-right:10px;" class="btn btn-sm btn-outline-secondary">답글</button>
							<c:if test="${sessionScope.unum==listcomment.unum}">
								<button type="submit" id="deleteComment" style="float:right;margin-right:3px;" class="btn btn-sm btn-outline-secondary">삭제</button>
								<button id="updateComment" style="float:right;margin-right:3px;" class="btn btn-sm btn-outline-secondary">수정</button>
							</c:if>
							</c:if>
							</td>
						</tr>
						<!-- 답글 입력 영역 -->
						<tr>
							<td colspan="2">
								<form id="fixComment" action="addcomment" method="post">
									<input type="hidden" name="renum" value="${listcomment.renum}">
									<input type="hidden" name="unum" value="${udto.unum}">
									<input type="hidden" name="uname" value="${udto.uname}">
									<input type="hidden" name="cbnum" value="${dto.cbnum}">
									<input type="hidden" name="ref" value="${listcomment.ref}">
									<input type="hidden" name="step" value="${listcomment.step}">
									<input type="hidden" name="depth" value="${listcomment.depth}">
									<div id="recontent" style="display: none;" >
									<br>
										<textarea id="contentSide" class="form-control" rows="5" name="recontent"
										style="height: 100px; resize: none; width: 800px;margin: 0 auto"
										placeholder="${listcomment.recontent}" required="required"></textarea>
									<button type="submit" class="btn btn-sm text-white"
									id="submit" style="float: right; margin-right: 30px; margin-top: 20px; width:100px; background-color:#FE9A2E">입력</button>
									<br>
									</div>
								</form>
							</td>
							
						</tr>
					</table>
					</c:when>
					<c:otherwise>
					<!-- 답글 영역 --> 
					<table style="display:none;border:1px solid #ddd;max-width: 1026px;border-radius:5px;" id="commentView" data-ref="${listcomment.ref}" data-depth="${listcomment.depth }">
						<tr style="border: 1px solid #ddd;border-radius:5px;" value="${listcomment.ref}">
							<td style="width: 800px;background-color:#ddd">
								<c:forEach begin="1" end="${listcomment.depth}">
								&nbsp;&nbsp;
								</c:forEach>
								<c:if test="${listcomment.step!='0'}">
									<i class="bi bi-arrow-return-right"></i>
								</c:if>
								<c:if test="${listcomment.recontent!='' }">
									<input id="renum" type="hidden" name="renum" value="${listcomment.renum}">
									${listcomment.uname}
								</c:if>
								
							</td>
							<td style="float:right;width:226px; text-align:right;background-color:#ddd;">
							<c:if test="${listcomment.recontent!='' }">
								<fmt:formatDate value="${listcomment.rewriteday}" pattern="yyyy.MM.dd HH:mm"/>
							</c:if>
							<c:if test="${listcomment.recontent=='' }">
							<h6 style="color:#ddd">&nbsp;</h6>
							</c:if>							
							</td>
						</tr>
						<tr style="height:80px; word-break: break-all;">
							<td colspan="2">
								<c:forEach begin="1" end="${listcomment.depth}">
									&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								&nbsp;
								<input id="recomment" type="hidden" value="${listcomment.recontent}">
								<c:if test="${listcomment.recontent!='' }">
									<pre>${listcomment.recontent}</pre>
								</c:if>
								<c:if test="${listcomment.recontent=='' }">
									삭제된 댓글입니다
								</c:if>
							</td>
						</tr>
						<tr>
							<c:if test="${listcomment.recontent!='' }">
							<td colspan="2">
							&nbsp;
							
							<c:if test="${sessionScope.unum==listcomment.unum}">
								<button type="submit" id="deleteComment" style="float:right;" class="btn btn-sm btn-outline-secondary">삭제</button>
								<button id="updateComment" style="float:right;" class="btn btn-sm btn-outline-secondary">수정</button>
							</c:if>
            				<button id="addComment" style="float:right;" class="btn btn-sm btn-outline-secondary">답글</button>
							</c:if>
							</td>
						</tr>
						<!-- 답글 입력 영역 -->
						<tr>
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
									<br>
										<textarea id="contentSide" class="form-control" rows="5" name="recontent"
										style="height: 100px; resize: none; width: 800px;margin: 0 auto"
										placeholder="${listcomment.recontent}" required="required"></textarea>
									<button type="submit" class="btn btn-sm text-white"
									id="submit" style="float: right; margin-right: 30px; margin-top: 20px; width:100px; background-color:#FE9A2E">입력</button>
									<br>
									</div>
								</form>
							</td>
						</tr>
					</table>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				</c:if>
			
		</div>
		<hr style="width:94%; margin-left:40px">
		<div>
			
			<!-- 이전 글 다음 글 출력 영역 -->
			<div>
			<h5 style="margin-left:40px;"><b>이전 글</b></h5>
				<c:if test="${not empty precontent}">
					<a style="text-decoration: none;" href="<c:url value='/city/detail?cbnum=${prenum}'/>"><h6 style="margin-left: 60px;color:black">${precontent}</h6></a>
				</c:if>
				<c:if test="${empty precontent}">
					<h6 style="margin-left: 60px;color:#BDBDBD">이전 게시글이 없습니다</h6>
				</c:if>
			</div>
			<hr style="width:94%; margin-left:40px">
			<div>
			<h5 style="margin-left:40px;"><b>다음 글</b></h5>
				<c:if test="${not empty nxtcontent}">
					<a style="text-decoration: none;" href="<c:url value='/city/detail?cbnum=${nxtnum}'/>"><h6 style="margin-left: 60px;color:black">${nxtcontent}</h6></a>
				</c:if>
				<c:if test="${empty nxtcontent}">
					<h6 style="margin-left: 60px;color:#BDBDBD">다음 게시글이 없습니다</h6>
				</c:if>
			</div>
			<br>
		</div>
	</div>
	
	</div>
</body>
<script type="text/javascript">
	$(document).on("click", "#delbtn", function() {
			Swal.fire({
				  title: '삭제하시겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '네! 삭제할래요!',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.isConfirmed) {
					  location.href="delete?cbnum="+${dto.cbnum};
				    
				  }
				})

	});
				
	$(document).on("click", "#addComment", function() {
		$(this).parent().parent().next().find("#fixComment").attr("action","addcomment");
		$(this).parent().parent().next().find("#contentSide").attr("placeholder","내용을 입력해주세요")
		let s = $(this).parent().parent().next().find("#recontent").css("display");
	    if (s == "none") {
	        $(this).parent().parent().next().find("#recontent").css("display", "block");
	        $(this).parent().parent().parent().parent().siblings().find("#recontent").css("display","none")
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
	        $(this).parent().parent().parent().parent().siblings().find("#recontent").css("display","none")
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
		Swal.fire({
			  title: '수정하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네! 수정할래요!',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				  location.href='cityupdateform?unum='+unum+'&cbnum='+cbnum;
			    
			  }
			})
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
		let ref=$(this).parent().parent().parent().parent().data("ref");
		let depth=$(this).parent().parent().parent().parent().data("depth");
		//console.log(ref)
		//console.log(depth)
		$("table[data-ref='" + ref + "'][data-depth!='0']").each(function() {
	        let display = $(this).css("display");
	        $(this).css("display", display === "none" ? "block" : "none");
	    });
		
	})
	
	$("#commentArea").hide();

$("#showComment").click(function() {
  if ($("#commentArea").css("display") === "none") {
	  $("#showComment").css("background-color","white")
	  $("#showComment").css("color","#FE9A2E")
	  $("#showComment").attr("class","btn btn-sm")
	  $("#commentArea").css("display", "block");
      $("#commentArea").slideUp(0).slideDown("slow");
  } else {
      $("#commentArea").slideUp("slow", function() {
    	  $("#showComment").css("background-color","#FE9A2E")
    	  $("#showComment").attr("class","btn btn-sm text-white")
        $("#commentArea").css("display", "none");
    });
  }
});

$("#golist").click(function(){
	location.href="/city/list"
})

$(document).on("click","#photoarea",function(){
	let src=$(this).attr("src");
	Swal.fire({
		  title: '',
		  text: '',
		  imageUrl: src,
		  imageWidth: 600,
		  imageHeight: 600,
		  imageAlt: 'Custom image',
		});
	
});

let golist=$("#golist");

golist.mouseover(function(){
	golist.css("background-color","#FE9A2E")
	golist.css("color","white")
})

golist.mouseout(function(){
	golist.css("background-color","")
	golist.css("color","#FE9A2E")
})


</script>
</html>



