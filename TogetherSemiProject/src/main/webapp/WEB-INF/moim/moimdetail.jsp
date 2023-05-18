<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<style>
	body, body * {
		font-family: 'NanumPenScript';
	}
	a:link,a:visited,a:hover {
		color: black;
		text-decoration: none;
	}
	div.moim {
		width: 900px;
		height:1400px;
		margin: 200px auto 0 auto;
		background-color:white;
	}
	div.mcontent {
		font-size: 15px;
		margin:20px 10px;
		height:350px;
		background-color:white;
		text-align: center;
	}
	
	.mcontent_img{
		width:350px;
		height:250px;	
}
	div.top{
	position:relative;
	}
	div.topright{
		width:900px;
		height:10px;
		text-align:right;
	}
	div.topleft{
	width:500px;
	height:400px;
	}
	div.janginfo{
	float: left;
	color:black; 
	font-size:15px;
	}
	#moim_resi_wrap{
		width: 100%;
		display:flex;
		margin-left:70px;
		margin-top:80px;
	}
	#moim_resi_wrap button{
		width: 350px;
		height:40px;
		margin: 0 auto 0 10%;
		
	}
	#jjim{
		width: 450px;
		font-size: 33px;
		display: flex;
		justify-content: flex-end;
	}
	#jjim:hover{
		cursor: pointer;
	}
	/*  #gaipmemberlist{
		width: 900px;
		display: flex;
	}  */
	#gaipmember0{
		position:absolute;
		right:740px;
		top:50px;
		width: 430px;
		height:350px;
		font-size:13px;
		overflow: auto;
	}
	#memberlist0{
		width: 400px;
		display: flex;
	}
	.memberinfo{
		width: 300px;
	}
	.memberaccept{
		width: 100px;
		margin-left: 150px;
	}
	#gaipmember1{
		position:absolute;
		left:970px;
		top:50px;
		width: 350px;
		height:350px;
		font-size:13px;
		overflow: auto
	}
	#headhr{
	 	 height: 1px;
	 	 background-color: gray;	  	
	}
	#bodyhr{
		height: 1px;
	 	background-color: gray;
	}
	#foothr{
	 	 height: 1px;
	 	 background-color: gray;
	}
	#midhr{
	width:70%;
	}
@media ( max-width: 1200px ){
	div.moim {
		width: auto;
	}
	div.topright{
		width:auto;
		float:right;
		font-size:14px;
	}
	div.topleft{
	width:auto;
	
	}
	div.janginfo{
	width:auto;
	float:none;
	color:black; 
	font-size:15px;
	}
	.mcontent_img{
	width:300px;
	height:250px;
	position:relative;
	top:10px;
	left:50px;
	
}
#gaipmember0{
		position:absolute;
		left:100px;
		top:1050px;
		width: 450px;
		height:300px;
		font-size:13px;
		overflow: auto;
	}
	#gaipmember1{
		position:absolute;
		left:500px;
		top:1055px;
		width: 380px;
		height:300px;
		font-size:13px;
		overflow: auto;
	}
	#moim_resi_wrap button{
		width: 250px;
		height:40px;
		margin: 0 auto 0 10%;
	}	
	#midhr{
	width:50%;
	}
}
@media (  max-width: 767px ){
	#gaipmember0{
		position:absolute;
		left:20px;
		top:1050px;
		width:400px;
		height:300px;
		font-size:13px;
		overflow: auto;
		
	}
	#gaipmember1{
		position:absolute;
		left:350px;
		top:1055px;
		width: 300px;
		height:300px;
		font-size:13px;
		overflow: auto;
	}
	#moim_resi_wrap button{
		width: 150px;
		height:40px;
		margin: 0 auto 0 10%;
		
	}	
	.mcontent_img{
	width:200px;
	height:150px;
	position:relative;
	top:10px;
	left:3px;
}
	div.janginfo{
	position:relative;
	top:10px;
	float: left;
	color:black; 
	font-size:15px;
	}
	#midhr{
	width:40%;
	}
}

</style>
</head>
<body>
	<div class="moim">
	<div class="top">
		<h3 style="text-align:left">모임게시판</h3>
		<hr id="headhr"><br>
	<div class="topright">
	<h3 style="text-align:right;">[${dto.category}] ${dto.mname}</h3><br>	
		<span style="float: right;font-size: 14px;"><b>
		모임 시작일 :
		<fmt:formatDate value="${dto.createday}" pattern="yyyy-MM-dd" />
		</b></span> <br>
		<span style="float: justify;font-size: 14px;"><b>지역 : ${dto.city1} ${dto.city2}</b></span>
		<br> 
		<span style="float: justify; color:black; font-size: 14px;"><b>카테고리 : ${dto.category}</b></span>
		<br>
		<span style="float: justify; color:black; font-size: 14px;"><b>모임원 : 총 ${dto.mcount}명</b></span>
		<br>	
		<span style="float: justify; color:black; font-size:14px;"><b>모임장 : ${uname} </b></span>
		<br>
		
			<c:if test="${sessionScope.unum != dto.unum }">
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
									<i class="bi bi-heart-fill" style="color:red;"></i>
								</a>	
							</c:otherwise>
						</c:choose>
					</div>
					
					
			<c:choose>
			<c:when test="${acceptChk == 1}">
					<div>
						<button type="button" class="btn btn-outline-secondary" onclick="moimOut();">모임탈퇴</button>
					</div>
			</c:when>
				<c:when test="${!pressGaipChk}">		
					<div id="gaip_btn">
						<button type="button" class="btn btn-outline-secondary" onclick="moimGaip();">가입신청</button>
					</div>
				</c:when>			
				<c:otherwise>
						<div id="gaip_cancle">
							<button type="button" class="btn btn-secondary" onclick="deleteGaip(${acceptChk});">가입대기</button>
						</div>
				</c:otherwise>
			</c:choose>
					
			</div>	
		</c:if>
		</div>
		<div class="topleft">
		<div class=mcontent_img> 
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
		 </div>

		<br><br>
		<hr id="midhr">
		<h5><b>작성자 정보</b></h5>
		 <div class="janginfo">
		<span><b>이 메 일 : ${udto.email}</b></span><br>
		<span><b>전화번호 : ${udto.hp}</b></span><br>
		<span><b>이&nbsp;&nbsp;&nbsp;름 : ${udto.uname}</b></span><br>
		</div>
		</div>
		<c:if test="${dto.unum == sessionScope.unum }">
		<!--  <div id="gaipmemberlist">  -->
			<div id="gaipmember0" ><b id="gaipck">가입신청 확인</b><br><br>
					<c:forEach items="${list }" var="standby">
					<ul class="member_list0">
						<c:if test="${standby.acceptcall == 0 }">
						<li>
							<div class="memberinfo" >
								멤버 이름 : ${standby.uname } 멤버 성별 : ${standby.gender }
							</div>
							<div class="memberaccpet">
								<a onclick="acceptGaip(${standby.unum });"><i class="bi bi-check2" style="cursor: pointer;"></i></a> /
								<a onclick="deniedGaip(${standby.unum });"><i class="bi bi-x" style="cursor: pointer;"></i></a>
							</div>
						</li>
						</c:if>
					</ul>
					</c:forEach>
			</div>
			
			<div id="gaipmember1" >
			<b id="gaipmb">가입한 멤버</b><br><br>
				<c:forEach items="${list }" var="pass">
				<ul>
					<c:if test="${pass.acceptcall == 1 }">
					<li>	
						멤버 이름 : ${pass.uname } / 멤버 성별 : ${pass.gender }
					</li>	
					</c:if>
				</ul>	
				</c:forEach>
			</div>
		<!--  </div> -->
		</c:if>
		
		</div>
		<br>
		<hr>
		<!-- 버튼영역 -->
		<div style="text-align:right; padding:3px;">
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;" onclick="location.href='./moimlist'"><i class="bi bi-list-stars"></i>&nbsp;목록</button>
			<c:choose>
			 <c:when test="${sessionScope.unum == udto.unum}">
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;" onclick="location.href='./updateform?mnum=${dto.mnum}'"><i class="bi bi-pencil-square"></i>&nbsp;수정</button>
			<button type="button" class="btn btn-sm btn-outline-secondary" id="delmoim" onclick="del(${dto.mnum})"
				style="width: 100px;"><i class="bi bi-trash"></i>&nbsp;삭제</button>
			</c:when>
			<c:otherwise>
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;" onclick="alert('작성자가 아닙니다')"><i class="bi bi-pencil-square"></i>&nbsp;수정</button>
			<button type="button" class="btn btn-sm btn-outline-secondary" 
				style="width: 100px;" onclick="alert('작성자가 아닙니다')"><i class="bi bi-trash"></i>&nbsp;삭제</button>
			</c:otherwise>
			</c:choose>
		</div>	
		<script>
		$(document).on("click", "#delmoim", function() {
			let b=confirm("삭제를 하려면 [확인]을 눌러주세요");
			if(b){
				location.href="delete?mnum="+${dto.mnum};
			}
		});
		</script>
		<hr id="bodyhr">
		<br>
		<div class="mcontent">
		${dto.mcontent}
		</div>
		
		<hr id="foothr">
		<br>
	</div>
		
	<script type="text/javascript">
	const mnum = ${dto.mnum};
	const mname= '${dto.mname}';
		
		
	function updateJjimcount(){
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
				$("#jjim").html('<a class="jjim_cancle" onclick="deleteJjim();"><i class="bi bi-heart-fill" style="color:red;"></i></a>');
			} 
		},
	});
		
}
	
	function deleteJjim(){
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
		const unum = ${sessionScope.unum};
	
		  if (confirm("가입 신청을 하시겠습니까?")) {
			    $.ajax({
			      type: "get",
			      url: "moimgaip",
			      dataType: "text",
			      data: {
			        mname: mname,
			        unum: unum
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("가입 신청이 성공적으로 완료됐습니다.");
			          $("#gaip_btn").html('<div id="gaip_cancle"><button type="button" class="btn btn-secondary" style="width: 350px; margin: 0 auto 0 10%;" onclick="deleteGaip();">가입대기</button></div>');
			        }
			      },
			    });
			  } else {
			    return; // 함수 즉시 종료
			  }
			}
	
	
	function deleteGaip(){
		const unum = ${sessionScope.unum};

		alert("가입 신청을 취소하시겠습니까?")
	
			    $.ajax({
			      type: "get",
			      url: "deletegaip",
			      dataType: "text",
			      data: {
			        mname: mname,
			        unum: unum
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("가입 신청이 취소되었습니다.");
			          $("#gaip_cancle").html('<div id="gaip_btn"><button type="button" class="btn btn-outline-secondary" style="width: 350px; margin: 0 auto 0 10%;" onclick="moimGaip();">가입신청</button></div>');
			        }
			      },
			    });
			
			}
	
	function acceptGaip(unum){	
		
	$.ajax({
		type:"get",
		url:"acceptgaip",
		dataType:"text",
		   data: {
			      mname: mname,
			      unum: unum
			    },
		success:function(res){
			if(res == "success") {
				alert("가입 신청을 승인하셨습니다.");
				window.location.reload();
			} 
		},
	});	
}
	function deniedGaip(unum){
		
		$.ajax({
			type:"get",
			url:"deniedgaip",
			dataType:"text",
			   data: {
				      mname: mname,
				      unum: unum
				    },
			success:function(res){
				if(res == "success") {
					alert("가입 신청을 반려하셨습니다.");
					window.location.reload();
				} 
			},
		});	
	}

	function moimOut(){
		const unum = ${sessionScope.unum};

		
		if(confirm("모임에서 탈퇴하시겠습니까?")){
			
		
	
			    $.ajax({
			      type: "get",
			      url: "moimout",
			      dataType: "text",
			      data: {
			        mname: mname,
			        unum: unum
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("모임에서 탈퇴했습니다.");
			          window.location.reload();
			        }
			      },
			    });
			
		}else{
			return;
		}
	}
	
</script>

</body>
</html>