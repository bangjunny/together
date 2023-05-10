<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp"%>
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
		font-family: 'NanumPenScript'
	}
	a:link,a:visited,a:hover {
		color: black;
		text-decoration: none;
	}
	div.moim {
		width: 900px;
		height:1100px;
		margin-left:250px;
		background-color:#ccc;
	}
	div.mcontent {
		font-size: 20px;
		margin:20px 10px;
		height:700px;
		background-color:white;
		text-align:center;
	}
	.mcontent_img{
		width:838px;
		height:420px;
		margin:20px;
}
	#moim_resi_wrap{
		width: 100%;
		display:flex;
		text-align: center;
	}
	#moim_resi_wrap button{
		width: 300px;
		margin: 0 auto 0 10%;
	}
	#jjim{
		width: 210px;
		font-size: 30px;
		display: flex;
		justify-content: flex-end;
	}
	#jjim:hover{
		cursor: pointer;
	}


</style>
</head>
<body>
<h3>상세페이지</h3>
	<div class="moim">
		<div><br>
		<h2 style="text-align:center;">${dto.mname}</h2>
		
		<span style="float: left;font-size: 14px;">지역: ${dto.city1} ${dto.city2}</span>
		<span style="float: right; color:black; font-size: 14px;">
		작성일:
		<fmt:formatDate value="${dto.createday}" pattern="yyyy-MM-dd HH:mm" />
		</span> 
		<br> 
		<span style="color:black; font-size: 14px;">카테고리:${dto.category},
		모임인원:${dto.unum}명</span>
		<br>
		
		<span style="float: left; color:black; font-size:16px;">모임장: ${dto.jang}</span>
		
		<br>
		</div>
		
		<hr>
		
		<div class="mcontent">
		 <c:choose>
   		 <c:when test="${dto.mphoto==null}">
   		<!-- Result값이 있다면 실행할 로직 -->
   		<img class="mcontent_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
   		 </c:when>
   		 <c:otherwise>
		 <!-- 그렇지 않다면 실행할 로직 -->
		 <img class="mcontent_img" src="https://${imageUrl}/moim/${dto.mphoto}">	 
   		 </c:otherwise>
		</c:choose>
		
		${dto.mcontent}
		
		</div>
		
		<div style="text-align:center;">
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 70px;" onclick="location.href='./moimlist?currentPage=${currentPage}'">목록</button>
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 70px;" onclick="">수정</button>
			<button type="button" class="btn btn-sm btn-outline-secondary" 
				style="width: 70px;" onclick="">삭제</button>
		</div>	
		<hr>
		
		<div id="moim_resi_wrap">
		<div id="jjim">
		<c:choose>
		<c:when test="${!pressChk}">		
			<a class="jjim_btn" onclick="updateJjimcount();">
				<i class="bi bi-heart"></i>
			</a>
		</c:when>			
		<c:otherwise>
			<a class="jjim_cancle" onclick="deleteJjim();">
				<i class="bi bi-heart-fill"></i>
			</a>	
		</c:otherwise>
		</c:choose>
		</div>
		
				<c:choose>
		<c:when test="${!pressGaipChk}">		
			<div id="gaip_btn">
				<button type="button" onclick="moimGaip();">가입신청</button>
			</div>
		</c:when>			
		<c:otherwise>
				<div id="gaip_cancle">
				<button type="button" onclick="deleteGaip();">가입대기</button>
			</div>
		</c:otherwise>
		</c:choose>
			
		</div>	
	</div>
	<script type="text/javascript">
	function updateJjimcount(){
		
		const mnum = ${dto.mnum};
		const unum = ${sessionScope.unum};
	
	$.ajax({
		type:"get",
		url:"updateJjimcount",
		dataType:"text",
		   data: {
			      mnum: mnum,
			      unum: unum
			    },
		success:function(res){
		
			if(res == "success") {
				alert("찜하셨습니다");
				$("#jjim").html('<a class="jjim_cancle" onclick="deleteJjim();"><i class="bi bi-heart-fill"></i></a>');
			} 
		},
	});
		
}
	
	function deleteJjim(){
		
		const mnum = ${dto.mnum};
		const unum = ${sessionScope.unum};
	
	$.ajax({
		type:"get",
		url:"deleteJjim",
		dataType:"text",
		   data: {
			      mnum: mnum,
			      unum: unum
			    },
		success:function(res){
			if(res == "success") {
				alert("찜 취소");
				$("#jjim").html('<a class="jjim_btn" onclick="updateJjimcount();"><i class="bi bi-heart"></i></a>');
			} 
		},
	});	
}
	
	function moimGaip(){

		const mnum = ${dto.mnum};
		const unum = ${sessionScope.unum};
		
	
		  if (confirm("가입 신청을 하시겠습니까?")) {
			    $.ajax({
			      type: "get",
			      url: "moimgaip",
			      dataType: "text",
			      data: {
			        mnum: mnum,
			        unum: unum
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("가입 신청이 성공적으로 완료됐습니다.");
			          $("#gaip_btn").html('<div id="gaip_cancle"><button type="button" style="width: 300px; margin: 0 auto 0 10%;" onclick="deleteGaip();">가입대기</button></div>');
			        }
			      },
			    });
			  } else {
			    return; // 함수 즉시 종료
			  }
			}
	
	
	function deleteGaip(){

		const mnum = ${dto.mnum};
		const unum = ${sessionScope.unum};
		alert("가입 신청을 취소하시겠습니까?")
	
			    $.ajax({
			      type: "get",
			      url: "deletegaip",
			      dataType: "text",
			      data: {
			        mnum: mnum,
			        unum: unum
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("가입 신청이 취소되었습니다.");
			          $("#gaip_cancle").html('<div id="gaip_btn"><button type="button" style="width: 300px; margin: 0 auto 0 10%;" onclick="moimGaip();">가입신청</button></div>');
			        }
			      },
			    });
			
			}
	</script>
	
	
</body>
</html>
