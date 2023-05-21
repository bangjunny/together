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
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body, body * {
/* 	font-family: 'Jua'; */
}

#maincontainer {
	width: 1140px;
	margin: 0 auto;
	position: relative !importent;
	/* background-color: rgba(245, 245, 220, 0.2); */
}

.outbox {
}

.box {
	width: 370px;
	height: 192px;
	border-radius: 12px;
	float: left;
	padding: 20px 15px;
	background-color: white;
	border: 1px solid #ddd;
	cursor: pointer;
	margin-bottom: 20px;
	margin-right: 10px;
}

.listimg {
	border-radius: 12px;
	width: 150px;
	height: 150px;
}

.listimg img {
	width: 100%;
	height: 100%;
	border-radius: 12px;
}

.listtext {
	padding-left: 170px;
	padding-top: 5px;
	height: 150px;
}

.spancity {
	font-style: italic;
	color: #ddd
}

#ta1 {
	margin: 0 auto;
	cursor: pointer;
	border-collapse: separate;
	border-radius: 12px;
	border: 1px solid #ddd;
}

#ta1img {
	width: 75px;
	height: 75px;
}

#ta1img img {
	border-radius: 12px;
}

#taltext {
	
}
.listsubject{
	text-overflow: ellipsis;
	overflow: hidden;
	white-space : nowrap;
	display:inline-block;
	width:300px;
	margin-right: 50px;
}

select {

 	width: 150px;
    height: 30px;
    font-size: 15px;
    background: #fff;
    background-size: 20px 8px;
    border-radius:5px;
    display: inline-block;
    text-align: start;
    border: solid 1px #848484;
    cursor: default;
    padding-left: 5px;

}
.sea {
	margin-bottom: 10px;
	height: 40px;
}

.sear {
	border: solid 1px #848484;
     width: 250px;
     height: 30px;
     font-size: 15px;
     background: #fff;
     background-size: 20px 8px;
     border-radius:5px;
}

#search {
	width:120px; 
	background-color:#FE9A2E;
	margin-bottom: 5px;
}

</style>
</head>
<body>
<div id="maincontainer">
<%-- <h1>
	<c:choose>
		<c:when test="${unum == 0 && city1 == 'no' || city1==null}">
			<!-- 비회원일 때, 지역 전체 -->
			지역 전체에 게시글이 총
		</c:when>
		<c:when test="${unum == 0 && city1 != 'no'}">
			<!-- 비회원일 때, 특정 지역 -->
			${city1}의 ${city2}에 글이 총
		</c:when>
		<c:otherwise>
			<!-- 회원일 때 -->
			${city1}의 ${city2}에 글이 총
		</c:otherwise>
	</c:choose>
	${totalCount}개 있습니다
</h1> --%>

<div class="ajaxzone" style="height: 213px;"></div>

	<span>
	<button class="btn btn-sm text-white" style="margin-top:0px;margin-bottom:20px; width:100px;background-color:#FE9A2E"
	id="liketop" onclick="liketop()">추천수 TOP3</button>
	<button class="btn btn-sm text-white" style="margin-top:0px;margin-bottom:20px; width:100px;background-color:#FE9A2E" 
	id="readtop" onclick="readtop()">조회수 TOP3</button>
	</span>
	 
	<div class="sea">
		<form action="list" method="get" style="float: right;">
			<select id="city" name="city1">
				<option hidden>시, 도 선택</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="울산광역시">울산광역시</option>
				<option value="세종특별자치시">세종특별자치시</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="제주특별자치도">제주특별자치도</option>
			</select>
			<select id="district" name="city2">
				<option>시, 군, 구 선택</option>
			</select>
		    <input class="sear" name="keyword" value="${keyword }" type="text">
			<button id="search" type="submit" class="btn btn-sm text-white">선택지역 검색</button>
		</form>
	</div>
	
	<c:forEach var="list" items="${list}" varStatus="i">
	<c:choose>
		<c:when test="${unum!=0 }">
			<table style="width: 100%" id="ta1" onclick="location.href='detail?cbnum=${list.cbnum}'">
		</c:when>
		<c:otherwise>
			<table style="width: 100%" id="ta1" onclick="guest()">
		</c:otherwise>
	</c:choose>
	<tr>
	<td id="ta1img" >
		<c:choose>
			<c:when test="${list.photo_idx!=null }">
				<img style="width:100%;height:100%" src="https://kr.object.ncloudstorage.com/together-bucket-104/city/${list.photo_idx }">
			</c:when>
			<c:otherwise>
				<img style="width:100%;height:100%" src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">
			</c:otherwise>
		</c:choose>
		</td>
		<td id="ta1text">
		<b class="listsubject">&nbsp;&nbsp;${list.subject }</b>
		<span style="display:inline-block;margin-left:0px;width:100px">${list.uname}</span>|
		<span style="margin-left:30px;display:inline-block;width:150px">추천수 : ${list.cblike}</span>
		<span style="margin-left:15px;display:inline-block;width:150px">조회수 : ${list.readcount}</span>
		<span style="margin-right:30px;display:inline-block;width:150px">
		작성일 : <fmt:formatDate value="${list.cbwriteday }" pattern="yyyy-MM-dd"/>
		</span>
		</td>
	</tr>
	</table>
	<br>
	</c:forEach>
	
	<button type="button" class="btn btn-sm text-white btnlist" style="width:150px;background-color:#FE9A2E;float: right;"
	 id="write" onclick="writeform();">글쓰기</button>
<!-- 	<button type="button" class="btn btn-sm text-white" style="margin-top:10px;margin-bottom:10px; width:150px;background-color:#FE9A2E;float: right;margin-right: 5px;"
	 id="mywrite" onclick="mywrite();">내가 쓴 게시글</button>
	<button type="button" class="btn btn-sm text-white" style="margin-top:10px;margin-bottom:10px; width:150px;background-color:#FE9A2E;float: right;margin-right: 5px;"
	 id="mylike" onclick="mylike();">내가 추천한 게시글</button> -->

	
	<!-- 페이징처리 -->
<div style="margin:0 auto;width: 700px; text-align: center; font-size: 16px;">
<c:choose>
	<c:when test="${city1!='no' && keyword!=null}"> 
		<!-- 이전 -->
		<c:if test="${startPage>1 }">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="list?city1=${city1 }&city2=${city2 }&keyword=${keyword }&currentPage=${startPage-1 }">이전</a>
		</c:if>
		&nbsp;
		<!-- 페이지 번호 출력 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==pp }">
				<a style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
					href="list?city1=${city1 }&city2=${city2 }&keyword=${keyword }&currentPage=${pp }">${pp }</a>
			</c:if>
			<c:if test="${currentPage!=pp }">
				<a style="color: black; text-decoration: none; cursor: pointer;"
					href="list?city1=${city1 }&city2=${city2 }&keyword=${keyword }&currentPage=${pp }">${pp }</a>
			</c:if>
        &nbsp;
    	</c:forEach>
		<!-- 다음 -->
		<c:if test="${endPage<totalPage }">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="list?city1=${city1 }&city2=${city2 }&keyword=${keyword }&currentPage=${endPage+1 }">다음</a>
		</c:if>
	</c:when>
		<c:when test="${city1=='no' && keyword!=null}">
		<!-- 이전 -->
		<c:if test="${startPage>1 }">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="list?keyword=${keyword }&currentPage=${startPage-1 }">이전</a>
		</c:if>
		&nbsp;
		<!-- 페이지 번호 출력 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==pp }">
				<a style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
					href="list?keyword=${keyword }&currentPage=${pp }">${pp }</a>
			</c:if>
			<c:if test="${currentPage!=pp }">
				<a style="color: black; text-decoration: none; cursor: pointer;"
					href="list?keyword=${keyword }&currentPage=${pp }">${pp }</a>
			</c:if>
        &nbsp;
    	</c:forEach>
		<!-- 다음 -->
		<c:if test="${endPage<totalPage }">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="list?keyword=${keyword }&currentPage=${endPage+1 }">다음</a>
		</c:if>
	</c:when>
	
		<c:when test="${city1!='no' && keyword==null}">
		<!-- 이전 -->
		<c:if test="${startPage>1 }">
			<a style="color: black text-decoration: none; cursor: pointer;"
				href="list?city1=${city1 }&city2=${city2 }&currentPage=${startPage-1 }">이전</a>
		</c:if>
		&nbsp;
		<!-- 페이지 번호 출력 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==pp }">
				<a style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
					href="list?city1=${city1 }&city2=${city2 }&currentPage=${pp }">${pp }</a>
			</c:if>
			<c:if test="${currentPage!=pp }">
				<a style="color: black; text-decoration: none; cursor: pointer;"
					href="list?city1=${city1 }&city2=${city2 }&currentPage=${pp }">${pp }</a>
			</c:if>
        &nbsp;
    	</c:forEach>
		<!-- 다음 -->
		<c:if test="${endPage<totalPage }">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="list?city1=${city1 }&city2=${city2 }&currentPage=${endPage+1 }">다음</a>
		</c:if>
	</c:when>
		
	<c:otherwise>
		<!-- 이전 -->
		<c:if test="${startPage>1 }">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="list?currentPage=${startPage-1 }">이전</a>
		</c:if>
		&nbsp;
		<!-- 페이지 번호 출력 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage==pp }">
				<a style="color: blue; font-size: 23px;text-decoration: none; cursor: pointer;"
					href="list?currentPage=${pp }">${pp }</a>
			</c:if>
			<c:if test="${currentPage!=pp }">
				<a style="color: black; text-decoration: none; cursor: pointer;"
					href="list?currentPage=${pp }">${pp }</a>
			</c:if>
        &nbsp;
    	</c:forEach>
		<!-- 다음 -->
		<c:if test="${endPage<totalPage }">
			<a style="color: black; text-decoration: none; cursor: pointer;"
				href="list?currentPage=${endPage+1 }">다음</a>
		</c:if>
	</c:otherwise>
</c:choose>
</div>
</div>
</div>
	<script type="text/javascript">
	$(function(){
		liketop();
		alternatingFunctions();
	});
	$(document).ready(function() {
		$('#city').change(function() {
			var city = $(this).val();
				if (city === '서울특별시') {
					var districts = ['지역전체','강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
				} else if (city === '부산광역시') {
					var districts = ['지역전체','강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'];
				} else if (city === '대구광역시') {
					var districts = ['지역전체','남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구'];
				} else if (city === '인천광역시') {
					var districts = ['지역전체','강화군', '계양구', '남구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군'];
                    } else if (city === '광주광역시') {
                       var districts = ['지역전체','광산구', '남구', '동구', '북구', '서구'];
                    } else if (city === '대전광역시') {
                       var districts = ['지역전체','대덕구', '동구', '서구', '유성구', '중구'];
                    } else if (city === '울산광역시') {
                       var districts = ['지역전체','남구', '동구', '북구', '울주군'];            
                    } else if (city === '세종특별자치시') {
                       var districts = ['지역전체','가람동','고운동', '금남면', '나성동', '누리동', '다솜동', '다정동', '대평동', '도담동', '반곡동', '보람동', '부강면', '산울동', '새롬동', '세종동', '소담동', '소정면','아름동', '어진동', '연기면', '연동면', '연서면', '용호동', '장군면', '전동면', '전의면', '조치원읍', '종촌동', '집현동', '한별동', '한솔동', '합강동', '해밀동'];            
                    } else if (city === '경기도') {
                       var districts = ['지역전체','가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', ' 포천시', '하남시', '화성시'];
                    } else if (city === '강원도') {
                       var districts = ['지역전체','강릉시', '동해시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양양군', '영월군', '인제군', '정선군', '철원군', '화천군', '횡성군'];
                    } else if (city === '충청북도') {
                       var districts = ['지역전체','청주시', '충주시', '제천시', '보은군', '옥천군', '영동군', '진천군', '괴산군', '음성군', '단양군'];
                    } else if (city === '충청남도') {
                       var districts = ['지역전체','천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
                    } else if (city === '전라북도') {
                       var districts = ['지역전체','전주시 완산구', '전주시 덕진구', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '순창군', '고창군', '부안군'];
                    } else if (city === '전라남도') {
                       var districts = ['지역전체','광양시', '나주시', '목포시', '순천시', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
                    } else if (city === '경상북도') {
                       var districts = ['지역전체','경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시'];
                    } else if (city === '경상남도') {
                       var districts = ['지역전체','창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '함안군', '창녕군', '고성군', '남해군', '하동군', '산청군', '함양군', '거창군', '합천군'];
                    } else if (city === '제주특별자치도') {
                       var districts = ['지역전체','제주시', '서귀포시'];
                    } else {
                     $('#district').empty().prop('disabled', true);
                   }
                   var districtSelect = $('#district');
                   districtSelect.empty();
                   /* districtSelect.append($('<option>', { value: '', text: '시, 군, 구 선택' })); */
                   $.each(districts, function(index, value) {
                     districtSelect.append($('<option>', { value: value, text: value }));
                   });
                   districtSelect.prop('disabled', false);
                 });
               });
	function writeform(){
		if(${unum==0}){
			let a = confirm("비회원은 게시글을 작성할수 없습니다. \n\"확인\" 버튼 클릭시 로그인 페이지로 이동합니다");
			if(a){
				location.href='/user/login';
			}
			
		} else {
		location.href='cityform?unum=${unum}&city1=${city1}&city2=${city2}';
		}
	}
	function mylike(){
		if(${unum==0}){
			let a = confirm("비회원은 게시글을 조회할수 없습니다. \n\"확인\" 버튼 클릭시 로그인 페이지로 이동합니다");
			if(a){
				location.href='/user/login';
			}
			
		} else {
		location.href='../user/mypagecblikelist?unum=${unum}';
		}
	}
	function mywrite(){
		if(${unum==0}){
			let a = confirm("비회원은 게시글을 조회할수 없습니다. \n\"확인\" 버튼 클릭시 로그인 페이지로 이동합니다");
			if(a){
				location.href='/user/login';
			}
			
		} else {
		location.href='../user/mypagecblist?unum=${unum}';
		}
	}
	function guest() {
		let b = confirm("비회원은 게시글을 조회할수 없습니다.\n\"확인\" 버튼 클릭시 로그인 페이지로 이동합니다");
		if(b){
			location.href='/user/login';
		}
	}
	function liketop(){
		const city1 = '${city1}';
		const city2 = '${city2}';
		const keyword = '${keyword}';
		const unum = ${unum};
		$.ajax({
			type:"get",
	        url:"liketop",
	        dataType:"json",
	        data:{"city1":city1,"city2":city2,"keyword":keyword},
	        success:function(res){
	        	let s="";
	        	$.each(res,function(idx,ele){
	        		s+=`<div class="outbox">`;
	        			if(unum==0){
	        				s+=`<div class="box" onclick="guest()">`
	        			} else {
	        				s+=`<div class="box" onclick="location.href='detail?cbnum=\${ele.cbnum}'">`
	        			}
	        			s+=`<div class="listimg" style="float: left;">`
	        				if(ele.photo_idx!=null){
	        					s+=`<img src="https://kr.object.ncloudstorage.com/together-bucket-104/city/\${ele.photo_idx }">`
	        				} else{
	        					s+=`<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">`
	        				}
	        			s+=`</div>
	        			<div class="listtext">
	        				<b><div style="overflow:hidden;text-overflow: ellipsis;word-wrap: break-word;
	        			        display: -webkit-box;
	        		        -webkit-line-clamp: 2 ;
	        		        -webkit-box-orient: vertical;width:170px;height:45px">\${ele.subject}</div></b>
	        				작성자:\${ele.uname }<br>
	        				조회수:\${ele.readcount }<br>
	        				추천수:\${ele.cblike }<br>
	        				<span class="spancity">#\${ele.city1} #\${ele.city2}</span>
	        			</div>
	        		</div>
	        		</div>`;
	        	});
	        	$("div.ajaxzone").animate({ opacity: 0, marginLeft: "0" }, 500, function() {
		        	$("div.ajaxzone").html(s);
		        	$("div.ajaxzone").animate({ opacity: 1, marginLeft: "0" }, 500);
		        	});
	        }
		});
	}
	function readtop(){
		const city1 = '${city1}';
		const city2 = '${city2}';
		const keyword = '${keyword}';
		const unum = ${unum};
		$.ajax({
			type:"get",
	        url:"readtop",
	        dataType:"json",
	        data:{"city1":city1,"city2":city2,"keyword":keyword},
	        success:function(res){
	        	let s="";
	        	$.each(res,function(idx,ele){
	        		s+=`<div class="outbox">`;
	        			if(unum==0){
	        				s+=`<div class="box" onclick="guest()">`
	        			} else {
	        				s+=`<div class="box" onclick="location.href='detail?cbnum=\${ele.cbnum}'">`
	        			}
	        			s+=`<div class="listimg" style="float: left;">`
	        				if(ele.photo_idx!=null){
	        					s+=`<img src="https://kr.object.ncloudstorage.com/together-bucket-104/city/\${ele.photo_idx }">`
	        				} else{
	        					s+=`<img src="https://kr.object.ncloudstorage.com/together-bucket-104/moim/595a63db-47b3-4d25-b7a5-05451064b243">`
	        				}
	        			s+=`</div>
	        			<div class="listtext">
	        				<b><div style="overflow:hidden;text-overflow: ellipsis;word-wrap: break-word;
	        			        display: -webkit-box;
	        		        -webkit-line-clamp: 2 ;
	        		        -webkit-box-orient: vertical;width:170px;height:45px">\${ele.subject}</div></b>
	        				작성자:\${ele.uname }<br>
	        				조회수:\${ele.readcount }<br>
	        				추천수:\${ele.cblike }<br>
	        				<span class="spancity">#\${ele.city1} #\${ele.city2}</span>
	        			</div>
	        		</div>
	        		</div>`;
	        	});
	        	$("div.ajaxzone").animate({ opacity: 0, marginLeft: "0" }, 500, function() {
		        	$("div.ajaxzone").html(s);
		        	$("div.ajaxzone").animate({ opacity: 1, marginLeft: "0" }, 500);
		        	});
	        }
		});
	}
	$("#search").click(function(){
		if($("#city").val()=="시, 도 선택"){
			alert("지역을 선택해 주세요");
			return false;
		}
	});
	let flag = true;

	function alternatingFunctions() {
	  if (flag) {
			liketop();
	  } else {
	   		readtop();
	  }
	  flag = !flag;
	}

	setInterval(alternatingFunctions, 8000);
	

</script>
</body>
</html>