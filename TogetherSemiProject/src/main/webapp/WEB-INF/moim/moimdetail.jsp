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
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body, body * {
		font-family: 'NanumPenScript';
	}
	a:link,a:visited,a:hover {
		color: black;
		text-decoration: none;
	}
	div.moim {
		width: 1140px;
		height:1140px;
		margin:0 auto;
		background-color:white;
	}
	div.mcontent {
		font-size: 17px;
		text-align:center;
		margin:5px auto 0 auto;
		width:1100px;
		height:300px;
		background-color:white;
		overflow: auto;
	}
	
	.mcontent_img{
		width:480px;
		height:300px;	
}
	div.top{
	position:relative;
	}
	div.topright{
		width:1100px;
		height:10px;
		text-align:right;
	
	}
	div.topleft{
	width:500px;
	height:350px;
	}
	div.janginfo{
	float: left;
	color:black; 
	font-size:15px;
	height:240px; 
	overflow:auto;"
	}
	#moim_resi_wrap{
		width: 100%;
		display:flex;
		margin-left:680px;
		margin-top:40px;
	}
	#moim_resi_wrap button{
		width: 350px;
		height:40px;
		margin: 0 auto 0 10%;
		
	}
	#jjim{
		width: 70px;
		font-size: 30px;
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
		left:500px;
		top:480px;
		width: 300px;
		height:260px;
		font-size:13px;
		overflow: auto;
		overflow-x:hidden;
	}
	#gaipmember1{
		position:absolute;
		left:820px;
		top:480px;
		width: 400px;
		height:260px;
		font-size:13px;
		overflow: auto;
		overflow-x:hidden;
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
	width:500px;
	height:350px;
	}
	div.janginfo{
	float: left;
	color:black; 
	font-size:15px;
	width:auto;
	height:240px; 
	overflow:auto;"
	}
	.mcontent_img{
	width:380px;
	height:250px;
	position:relative;
	top:10px;
	left:10px;
	}
	div.mcontent {
		font-size: 15px;
		text-align:center;
		margin:10px auto 0 auto;
		width:80%;
		height:125px;
		background-color:white;
		overflow: auto;
		overflow-x:hidden;
	}
#gaipmember0{
		position:absolute;
		left:100px;
		top:1055px;
		width: 300px;
		height:150px;
		font-size:13px;
		overflow: auto;
		overflow-x:hidden;
	}
	#gaipmember1{
		position:absolute;
		left:540px;
		top:1060px;
		width: 300px;
		height:150px;
		font-size:13px;
		overflow: auto;
		overflow-x:hidden;
	}
	
	#moim_resi_wrap button{
		width: 250px;
		height:40px;
		margin: 0 auto 0 10%;
	}	
	#midhr{
	width:90%;
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
		top:910px;
		width:300px;
		height:300px;
		font-size:13px;
		overflow: auto;
		overflow-x:hidden;
		
	}
	#gaipmember1{
		position:absolute;
		left:330px;
		top:910px;
		width: 300px;
		height:300px;
		font-size:13px;
		overflow: auto;
		overflow-x:hidden;
	}

	#moim_resi_wrap{
		width: 35%;
		display:flex;
		margin-left:400px;
		margin-top:80px;
	}
	#moim_resi_wrap button{
		width: 150px;
		height:40px;
		margin: 0 auto 0 22%;
		
	}	
	.mcontent_img{
	width:200px;
	height:150px;
	position:relative;
	top:15px;
	left:5px;
}
	div.janginfo{
	float: left;
	color:black; 
	font-size:15px;
	height:240px; 
	overflow:auto;"
	}
	#midhr{
	width:40%;
	}
	#midbtn{
	text-align:center; 
	padding:3px;
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
		<h5 style="text-align:left">모임게시판</h5>
		<hr id="headhr"><br>
	<div class="topright">
	<h3 style="text-align:right;"><b>[${dto.category}] ${dto.mname}</b></h3><br>	
		<span style="font-size: 17px;"><b>
		모임 시작일 :
		<fmt:formatDate value="${dto.createday}" pattern="yyyy-MM-dd" />
		</b></span> <br>
		<span style="font-size: 17px;"><b>지역 : ${dto.city1} ${dto.city2}</b></span>
		<br> 
		<span style=" color:black; font-size: 17px;"><b>카테고리 : ${dto.category}</b></span>
		<br>
		<span style=" color:black; font-size: 17px;"><b>모임원 : 총 ${dto.mcount}명</b></span>
		<br>	
		<span style=" color:black; font-size:17px;"><b>모임장 : ${uname} </b></span>
		<br>
		
			<c:if test="${sessionScope.unum != dto.unum }">
				<div id="moim_resi_wrap">	
			<c:choose>
			<c:when test="${acceptChk == 1}">
					<div>
						<button type="button" class="btn btn-outline-secondary" style="background-color:rgb(254, 154, 46,0.7);" onclick="moimOut();">모임탈퇴</button>
					</div>
			</c:when>
				<c:when test="${!pressGaipChk}">		
					<div id="gaip_btn">
						<button type="button" class="btn btn-outline-secondary" style="background-color:#F6E3CE;" onclick="moimGaip();">가입신청</button>
					</div>
				</c:when>			
				<c:otherwise>
						<div id="gaip_cancle">
							<button type="button" class="btn btn-secondary" style="background-color:rgb(254, 154, 46,0.7);" onclick="deleteGaip(${acceptChk});">가입대기</button>
						</div>
				</c:otherwise>
			</c:choose>
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
			</div>	
		</c:if>
		</div>
		<div class="topleft">
		<div class=mcontent_img> 
		<c:choose>
   		 	<c:when test="${dto.mphoto==null}">
   		<!-- Result값이 있다면 실행할 로직 -->
   				<img class="mcontent_img" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/together.png">
   		 	</c:when>
   		 	<c:otherwise>
		 <!-- 그렇지 않다면 실행할 로직 -->
		 		<img class="mcontent_img" src="https://${imageUrl}/moim/${dto.mphoto}">	 
   		 	</c:otherwise>
		 </c:choose>
		 </div>

		<br><br>
		<hr id="midhr">
		<h5><b>모임 일정</b></h5>
		<c:choose>
			<c:when test="${scheduleCount eq 0}">
				<h3>일정이 없습니다</h3>
			</c:when>
			<c:otherwise>
		 <div class="janginfo">
		 	<table class="table" id="schedule" style="width:480px;">
		 	<c:forEach var="msdto" items="${slist}" varStatus="i">
		 		<c:if test="${i.count % 1 == 1}">
		 		<tr>
		 		</c:if>
		 			<td style="font-size:20px;">
		 			${msdto.mssubject } <br><span style="font-size:13px;"><b>￦</b> ${msdto.mscost }</span>
		 			&nbsp;&nbsp;<span style="font-size:13px;cursor:pointer" onclick="personlist('${msdto.msnum }')"><i class="bi bi-person"></i>&nbsp;${msdto.jmcount}/${msdto.personnel }</span>
		 			<br>
		 			<span style="font-size:13px;"><i class="bi bi-calendar"></i> ${msdto.msdate} ${msdto.mstime.substring(0, 5)}
		 			</span>	&nbsp;	 			
		 			<span style="font-size:13px;"><i class="bi bi-geo-alt"></i> ${msdto.mslocation }</span>		 			
		 			</td>
		 			<c:if test="${msdto.sjcount eq 0}">
		 			<c:choose>
		 			<c:when test="${membercheckCount eq 1}">
		 			<td><br><button class="btn btn-outline-success" style="width:60px;height:50px;" onclick="joinSchedule('${msdto.msnum}');">참석</button></td>
		 			</c:when>
		 			<c:otherwise>
		 			<td><br><button class="btn btn-outline-secondary" style="width:60px;height:50px;" onclick="alert('모임원만 참석 가능합니다')">참석</button></td>
		 			</c:otherwise>
		 			</c:choose>
		 			</c:if>
		 			<c:if test="${msdto.sjcount eq 1}">
		 			<td><br><button class="btn btn-outline-danger" style="width:60px;height:50px; border: 1px solid #FE9A2E; color:#FE9A2E;" onclick="cancelSchedule('${msdto.msnum}');">취소</button></td>
		 			</c:if>
		 			<c:choose>
						<c:when test="${sessionScope.unum == udto.unum}">
						<td>
						<br><button class="btn btn-outline-danger" style="width:60px;height:50px" onclick="deleteSchedule('${msdto.mssubject}');">삭제</button>
						</td>
						</c:when>
						<c:otherwise><td><button class="btn btn-outline-danger" style="width:70px;height:70px" hidden>삭제</button></td></c:otherwise>
					</c:choose>
		 		
		 		<c:if test="${i.count % 1 == 0}"> 
					</tr><tr>
				</c:if>
		 		</c:forEach>
		 	</table>			
		</div>
		</c:otherwise>
		</c:choose>		
		<c:choose>
			 <c:when test="${sessionScope.unum == udto.unum}">
		<button class="btn btnsch" style="width:460px;margin-top:5px; background-color:#FE9A2E;color:white" onclick="location.href='/moim/moimschedule?mnum=${dto.mnum}'">일정 만들기</button>
		</c:when>
		<c:otherwise><button class="btn btnsch" hidden>일정 만들기</button></c:otherwise>
		</c:choose>
		</div>
		<br><br><br><br><br>
		<c:if test="${dto.unum == sessionScope.unum }">
		<!--  <div id="gaipmemberlist">  -->
		<br><br>
			<div id="gaipmember0" data-aos="fade-zoom-in" data-aos-easing="ease-in-back"
    		 data-aos-delay="300"  data-aos-offset="0">
			<b style="margin-left:80px;font-size:20px">가입신청 확인</b><br><br>
					<c:forEach items="${list }" var="standby">
					<ul class="member_list0">
						<c:if test="${standby.acceptcall == 0 }">
						<li>
							<div class="memberinfo" >
								이름 : ${standby.uname } / 성별 : ${standby.gender } / 나이 : <span>${2023-standby.age.substring(0, 4) }세</span>
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
			<br><br>
			<div id="gaipmember1" data-aos="fade-zoom-in" data-aos-easing="ease-in-back"
    		 data-aos-delay="300"  data-aos-offset="0">
			<b style="margin-left:100px;font-size:20px;">모임원</b><br><br>
				<c:forEach items="${list }" var="pass">
				<ul>
					<c:if test="${pass.acceptcall == 1 }">
					<li>	
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름 : ${pass.uname } / 성별 : ${pass.gender } &nbsp;	<c:if test="${sessionScope.unum != pass.unum}"><button onclick="mandate(${pass.unum });">위임</button>	</c:if>
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
			<button type="button" class="btn btn-sm btn-light"
				style="width: 100px;background-color:rgb(254, 154, 46,0.7);" onclick="location.href='./moimlist'"><i class="bi bi-list-stars"></i>&nbsp;목록</button>
			<c:choose>
			 <c:when test="${sessionScope.unum == udto.unum}">
			<button type="button" class="btn btn-sm btn-light"
				style="width: 100px;background-color:rgb(254, 154, 46,0.7);" onclick="location.href='./updateform?mnum=${dto.mnum}&mname=${dto.mname}'"><i class="bi bi-pencil-square"></i>&nbsp;수정</button>
			<button type="button" class="btn btn-sm btn-light" id="delmoim" onclick="del(${dto.mnum})"
				style="width: 100px;background-color:rgb(254, 154, 46,0.7);"><i class="bi bi-trash"></i>&nbsp;삭제</button>
			</c:when>
			<c:otherwise>
			<button type="button" class="btn btn-sm btn-light"
				style="width: 100px;background-color:rgb(254, 154, 46,0.7);" onclick="alert('작성자가 아닙니다')"><i class="bi bi-pencil-square"></i>&nbsp;수정</button>
			<button type="button" class="btn btn-sm btn-light" 
				style="width: 100px;background-color:rgb(254, 154, 46,0.7);" onclick="alert('작성자가 아닙니다')"><i class="bi bi-trash"></i>&nbsp;삭제</button>
			</c:otherwise>
			</c:choose>
		</div>	
		<script>
		AOS.init();

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
		<pre>
		${dto.mcontent}
		</pre>
		</div>
		
		

		
<!-- 모임참석자 모달 -->
	<div class="container mt-3">
  <button type="button" id="mslist" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sjmModal"></button>
</div>

<div class="modalzone">
<!-- The Modal -->
<div class="modal" id="sjmModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">참석자 리스트</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
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
			          $("#gaip_btn").html('<div id="gaip_cancle"><button type="button" class="btn btn-secondary" style="width: 350px; margin: 0 auto 0 10%;background-color:rgb(254, 154, 46,0.7);" onclick="deleteGaip();">가입대기</button></div>');
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
	
	function joinSchedule(msnum){
		const unum = ${sessionScope.unum};
	
		  if (confirm("해당 일정에 참석 하시겠습니까?")) {
			    $.ajax({
			      type: "get",
			      url: "joinSchedule",
			      dataType: "text",
			      data: {
			        msnum: msnum,
			        unum: unum,
			        mnum: mnum
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("참석이 완료됐습니다.");
			          window.location.reload();
			        }
			      },
			    });
			  } else {		
			    return; // 함수 즉시 종료
			  }
			}
	
	function cancelSchedule(msnum){
		const unum = ${sessionScope.unum};
	
		  if (confirm("참석을 취소하시겠습니까?")) {
			    $.ajax({
			      type: "get",
			      url: "cancelSchedule",
			      dataType: "text",
			      data: {
			    	  unum: unum,
			          msnum: msnum			        
			      },
			      success: function(res) {
			        if (res == "success") {
			          alert("참석이 취소됐습니다.");
			          window.location.reload();
			        }
			      },
			    });
			  } else {
			    return; // 함수 즉시 종료
			  }
			}
	
	function mandate(unum){	
		if(confirm("모임장을 위임 하시겠습니까?")){
		$.ajax({
			type:"get",
			url:"mandate",
			dataType:"text",
			   data: {
				      mname: mname,
				      unum: unum
				    },
			success:function(res){
				if(res == "success") {
					alert("모임장을 위임하였습니다");
					window.location.reload();
				} 
			},
		});	
	} else {
	    return; // 함수 즉시 종료
	  }
	}
    
	function personlist(msnum){
		$.ajax({
			type:"get",
	        url:"mslist",
	        dataType:"json",
	        data:{"msnum":msnum},
	        success:function(res){
	        var mslist=document.getElementById("mslist");
	        	
	        	let s="";
	        	let n="";
	        	s+=`	
	        		<!-- The Modal -->
	        		<div class="modal" id="sjmModal">
	        		  <div class="modal-dialog modal-dialog-centered">
	        		    <div class="modal-content">

	        		      <!-- Modal Header -->
	        		      <div class="modal-header">
	        		        <h4 class="modal-title">참석자리스트</h4>
	        		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	        		      </div>

	        		      <!-- Modal body -->
	        		      <div class="modal-body">
	        		        Modal body..
	        		      </div>

	        		      <!-- Modal footer -->
	        		      <div class="modal-footer">
	        		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	        		      </div>

	        		    </div>
	        		  </div>
	        		</div>
	        		</div>`
	        	
	        	$.each(res,function(idx,ele){
	        		
	        		n+=`<li>\${ele.uname}</li>`
	        		
	        	});
	        	$(".modalzone").html(s);
	        	$(".modal-body").html(n);
	        	mslist.click();
	        	
	        	
	        }
	        
		});
		
	}

</script>

</body>
</html>