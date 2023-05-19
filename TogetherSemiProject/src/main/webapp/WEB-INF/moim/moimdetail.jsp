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
		width: 1440px;
		height:1300px;
		margin: 200px auto 0 auto;
		background-color:white;
	}
	div.mcontent {
		font-size: 15px;
		text-align:center;
		margin:10px auto 0 auto;
		width:80%;
		height:473px;
		background-color:white;
		overflow: auto;
	}
	
	.mcontent_img{
		width:100%;
		height:350px;	
}
	div.top{
	position:relative;
	}
	div.topright{
		width:1300px;
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
		margin-left:460px;
		margin-top:40px;
	}
	#moim_resi_wrap button{
		width: 300px;
		height:40px;
		margin: 0 auto 0 10%;
		
	}
	#jjim{
		width: 520px;
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
	/* #gaipmember0::-webkit-scrollbar{
	display: none;
	}
	#gaipmember1::-webkit-scrollbar{
	display: none;
	} */
	
	#gaipmember0{
		position:absolute;
		left:750px;
		top:470px;
		width: 360px;
		height:250px;
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
		left:1100px;
		top:480px;
		width: 350px;
		height:250px;
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
	width:100%;
	}
	#midbtn{
	text-align:right; 
	padding:3px;
	}
	#gaipck{
	font-size:18px;
	position:relative;
		left:850px;
		bottom:120px;
	}
	#gaipmb{
	font-size:18px;
	position:relative;
		left:1180px;
		bottom:175px;
	}
@media ( max-width: 1300px ){
	.mcontent_img{
	width:380px;
	height:250px;
	position:relative;
	top:15px;
	left:20px;
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
	width:380px;
	height:250px;
	position:relative;
	top:15px;
	left:20px;
	}
	div.mcontent {
		font-size: 15px;
		text-align:center;
		margin:10px auto 0 auto;
		width:80%;
		height:200px;
		background-color:white;
		overflow: auto;
	}
#gaipmember0{
		position:absolute;
		left:140px;
		top:1155px;
		width: 360px;
		height:200px;
		font-size:13px;
		overflow: auto;
	}
	#gaipmember1{
		position:absolute;
		left:540px;
		top:1160px;
		width: 360px;
		height:200px;
		font-size:13px;
		overflow: auto;
	}
	#gaipck{
	font-size:18px;
	position:absolute;
		left:240px;
		top:1120px;
	}
	#gaipmb{
	font-size:18px;
	position:absolute;
		left:620px;
		top:1120px;
	}
	#moim_resi_wrap button{
		width: 250px;
		height:40px;
		margin: 0 auto 0 10%;
	}	
	#midhr{
	width:50%;
	}
	#midbtn{
	text-align:center; 
	padding:3px;
	}
}
@media (  max-width: 767px ){
	#gaipmember0{
		position:absolute;
		left:10px;
		top:975px;
		width:360px;
		height:300px;
		font-size:13px;
		overflow: auto;
		
	}
	#gaipmember1{
		position:absolute;
		left:380px;
		top:980px;
		width: 350px;
		height:300px;
		font-size:13px;
		overflow: auto;
	}
	#gaipck{
	font-size:18px;
	position:relative;
		left:450px;
		top:590px;
	}
	#gaipmb{
	font-size:18px;
	position:relative;
		left:50px;
		top:540px;
	}
	#moim_resi_wrap{
		width: 55%;
		display:flex;
		margin-left:460px;
		margin-top:80px;
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
	top:15px;
	left:5px;
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
	#midbtn{
	text-align:center; 
	padding:3px;
	}
	#moim_resi_wrap button{
		width: 200px;
		height:40px;
		margin: 0 auto 0 10%;
  }
  #moim_resi_wrap{
		width: 100%;
		display:flex;
		margin-left:460px;
		margin-top:40px;
	}
	div.topleft{
	width:500px;
	height:200px;
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
						<button type="button" class="btn btn-outline-secondary" style="background-color:rgb(254, 154, 46);" onclick="moimOut();">모임탈퇴</button>
					</div>
			</c:when>
				<c:when test="${!pressGaipChk}">		
					<div id="gaip_btn">
						<button type="button" class="btn btn-outline-secondary" style="background-color:#F6E3CE;" onclick="moimGaip();">가입신청</button>
					</div>
				</c:when>			
				<c:otherwise>
						<div id="gaip_cancle">
							<button type="button" class="btn btn-secondary" style="background-color:rgb(254, 154, 46);" onclick="deleteGaip(${acceptChk});">가입대기</button>
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
		<c:choose>
			 <c:when test="${sessionScope.unum == udto.unum}">
		<button class="btn btn-success" onclick="location.href='/moim/moimschedule?mnum=${dto.mnum}'">일정 만들기</button>
		</c:when>
		<c:otherwise><button class="btn btn-success" hidden>일정 만들기</button></c:otherwise>
		</c:choose>
		<hr id="midhr">
		<h5><b>모임 일정</b></h5>
		<c:choose>
			<c:when test="${scheduleCount eq 0}">
				<h3>일정이 없습니다</h3>
			</c:when>
			<c:otherwise>
		 <div class="janginfo" style="height:180px; overflow:auto;">
		 	<table class="table" id="schedule" style="width:450px;">
		 	<c:forEach var="msdto" items="${slist}" varStatus="i">
		 		<c:if test="${i.count % 1 == 1}">
		 		<tr>
		 		</c:if>
		 			<td style="font-size:20px;">
		 			${msdto.mssubject } &nbsp;&nbsp;&nbsp;<span style="font-size:13px;"><b>￦</b> ${msdto.mscost }</span>
		 			<br>
		 			<span style="font-size:13px;"><i class="bi bi-calendar"></i> ${msdto.msdate } ${msdto.mstime }</span>		 			
		 			<span style="font-size:13px;"><i class="bi bi-geo-alt"></i> ${msdto.mslocation }</span>		 			
		 			</td>
		 			<td><button class="btn btn-outline-success" id="jsbtn" style="height:70px" onclick="joinSchedule('${msdto.mssubject}');">참석</button></td>
		 			<c:choose>
						<c:when test="${sessionScope.unum == udto.unum}">
						<td>
						<button class="btn btn-outline-danger" style="height:70px" onclick="deleteSchedule('${msdto.mssubject}');">삭제</button>
						</td>
						</c:when>
						<c:otherwise><td><button class="btn btn-outline-danger" style="height:70px" hidden>삭제</button></td></c:otherwise>
					</c:choose>
		 		
		 		<c:if test="${i.count % 1 == 0}">
					</tr><tr>
				</c:if>
		 		</c:forEach>
		 	</table>			
		</div>
		</c:otherwise>
		</c:choose>
		</div>
		<br>
		<c:if test="${dto.unum == sessionScope.unum }">
		<!--  <div id="gaipmemberlist">  -->
		<b id="gaipck">가입신청 확인</b><br><br>
			<div id="gaipmember0" >
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
			<b id="gaipmb">가입한 멤버</b><br><br>
			<div id="gaipmember1">
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
		<br><br><br><br><br>
		<hr>
		<!-- 버튼영역 -->
		<div id="midbtn">
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;background-color:rgb(254, 154, 46);" onclick="location.href='./moimlist'"><i class="bi bi-list-stars"></i>&nbsp;목록</button>
			<c:choose>
			 <c:when test="${sessionScope.unum == udto.unum}">
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;background-color:rgb(254, 154, 46);" onclick="location.href='./updateform?mnum=${dto.mnum}&mname=${dto.mname}'"><i class="bi bi-pencil-square"></i>&nbsp;수정</button>
			<button type="button" class="btn btn-sm btn-outline-secondary" id="delmoim" onclick="del(${dto.mnum})"
				style="width: 100px;background-color:rgb(254, 154, 46);"><i class="bi bi-trash"></i>&nbsp;삭제</button>
			</c:when>
			<c:otherwise>
			<button type="button" class="btn btn-sm btn-outline-secondary"
				style="width: 100px;background-color:rgb(254, 154, 46);" onclick="alert('작성자가 아닙니다')"><i class="bi bi-pencil-square"></i>&nbsp;수정</button>
			<button type="button" class="btn btn-sm btn-outline-secondary" 
				style="width: 100px;background-color:rgb(254, 154, 46);" onclick="alert('작성자가 아닙니다')"><i class="bi bi-trash"></i>&nbsp;삭제</button>
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
			          $("#gaip_btn").html('<div id="gaip_cancle"><button type="button" class="btn btn-secondary" style="width: 350px; margin: 0 auto 0 10%;background-color:rgb(254, 154, 46);" onclick="deleteGaip();">가입대기</button></div>');
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
			          $("#gaip_cancle").html('<div id="gaip_btn"><button type="button" class="btn btn-outline-secondary" style="width: 350px; margin: 0 auto 0 10%;background-color:#F6E3CE;" onclick="moimGaip();">가입신청</button></div>');
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
	
	function deleteSchedule(mssubject){		
		if (confirm("일정을 삭제 하시겠습니까?")) {	
			$.ajax({
				type:"get",
				url:"deleteSchedule",
				dataType:"text",
				   data: {
					      mssubject: mssubject,
					      mnum: mnum
					    },
				success:function(res){
					if(res == "success") {
						alert("일정이 삭제되었습니다.");
						window.location.reload();
					} 
				},
			});				
		}else{
			return;
		}
	}
	
	function joinSchedule(mssubject){
		const unum = ${sessionScope.unum};
		const joinButton = document.getElementById('jsbtn');
	
		  if (confirm("해당 일정에 참석 하시겠습니까?")) {
			    $.ajax({
			      type: "get",
			      url: "joinSchedule",
			      dataType: "text",
			      data: {
			        mssubject: mssubject,
			        unum: unum,
			        mnum: mnum
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("참석이 완료됐습니다.");
			          this.innerHTML = "취소";
			          this.setAttribute('onclick', `cancelSchedule('${mssubject}')`);
			          this.setAttribute('id', 'csbtn');
			        }
			      },
			    });
			  } else {
				alert("작동실패");  			
			    return; // 함수 즉시 종료
			  }
			}
	
</script>

</body>
</html>