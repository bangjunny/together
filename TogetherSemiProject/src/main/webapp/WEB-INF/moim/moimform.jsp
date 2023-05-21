<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

	.tit {
		font-size: 30px;
		margin-bottom: 30px;
	}	
	
	.modu {
		width:1140px;
		margin: 0 auto;
		margin-top:10px;
	}
	 
	.catego {
		width:695px;
	}
	
	.catego td {
       width : 150px;
       font-size:18px;
     }
       
    .motable td{
       width: 195px;
     }
	
	.bi {
       	cursor: pointer;
       	color : #FE9A2E
     }
      
      .filebox label {
        display: inline-block;
        padding: 5px 10px;
        color: black;
        vertical-align: middle;
        background-color: #F2F2F2;
        border: 1px solid #848484;
        border-radius: 5px;
        cursor: pointer;
        height: 39px;
        width:350px;
        margin-top: 7px;
        text-align: center;
      }
      
      .filebox input[type="file"] {
          position: absolute;
          width: 0;
          height: 0;
          padding: 0;
          overflow: hidden;
          border: 0;
      }
    
    .moimjuin {
    	margin-top:5px;
    	font-size:15px;
    	border:none;
    	width:90px;
    }
    
    .moname{
    	margin-right:10px;
        width: 250px;
        background: #fff;
        font-size: 15px;
        float: left;
        border: solid 1px #dadada;
      	padding: 10px 14px 10px 14px;
      	height: 40px;
      	border-radius:5px;
    }
    
    .joocheck {
    	height: 38px;
    	width:90px;
    	background: #FE9A2E;
      	background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        cursor:pointer;
        border-radius: 5px;
        transition: background-color 0.2s;
    }
    
    .joocheck:hover {
      	background: #FE642E;
      }
    
    select {
    	height: 40px;
    	width: 140px;
        font-size: 15px;
        background: #fff;
        background-size: 20px 8px;
        border-radius:5px;
        -webkit-appearance: none;
        display: inline-block;
        text-align: start;
        border: solid 1px #dadada;
        cursor: default;
        padding-left: 5px;
    }
    
    .pickcate {
    	float:left;
    	font-size: 18px;
    	margin-right: 10px;
    }

	#showimg{
	width: 350px;
	height:350px;
	boarder:1px solid black;
	}
	
	.mainlayout .main{
		width: 100%;
		height: 1200px;
	}
	
	label {
		cursor: pointer;
	}
	
	.tag {
		font-size:20px;
	}
	
	.olmessagef {
		color: red; 
		font-size: 13px;
		float: left;
	}
	.olmessaget {
		color: green; 
		font-size: 13px;
		float: left; 	
	}
	
	#selcategory {
		margin-top:2px;
		font-size:18px;
	}
	
	.de {
		margin-top: 20px;
		margin-bottom: 10px;
	}
	
	.butt {
		margin-top: 15px;
		margin-bottom: 15px;
	}
	
	.makemo {
		margin-right: 30px;
		height: 36px;
    	width:100px;
    	background: #FE9A2E;
      	background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        cursor:pointer;
        border-radius: 5px;
        transition: background-color 0.2s;
	}
	
	.makemo:hover {
		background: #FE642E;
	}
	
	.notmo {
		height: 36px;
    	width:100px;
    	background: #A4A4A4;
      	background-size: 200%;
        color:white;
        font-weight: 500;
        border:none;
        cursor:pointer;
        border-radius: 5px;
        transition: background-color 0.2s;
	}
	
	.notmo:hover {
		background: #424242;
	}
	
	
</style>
</head>
<body>

<div class="modu">
	
	<div class="tit">모임 생성하기</div>

	<form action="insert" method="post" enctype="multipart/form-data" id="moimform">
	
	
	<table class="table">
		
			<td rowspan="4" style="width:440px;">
			<!-- 이미지 출력할곳 -->
				<div>
					<img id="showimg">
					<div class="filebox">
           				<label for="moimfile">대표사진 파일 업로드</label> 
          				<input type="file" name="upload" id="moimfile">
      				</div>
				</div>
			</td>
		
			<td style="width:120px;"><span class="tag"> 모임 이름 : </span></td>
			<td style="width:400px;">
			<div style="margin-bottom: 7px;">
				<input type="text" id="moimname" class="moname" name="mname" maxlength="20" required="required" placeholder="모임 이름을 입력해주세요.">
				
				<button id="overlappedMname" type="button" class="joocheck">중복확인</button>
			</div>
			<div>
				<span id="olmessage"></span>
			</div>
			</td>
			
			<td style="width:92px;"><span class="tag"> 모임장 : </span></td>
			<td>
				<input type="text" class="moimjuin" value="${uname}" readonly>
				<input type="hidden" name="unum" value="${unum}">
			</td>
		</tr>
		
		<tr>
			<td><span class="tag"> 활동 지역 : </span></td>
			<td colspan="3">
               		<select id = "city" name="city1" >
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

   					<script>
					    $(document).ready(function() {
					      $('#city').change(function() {
					        var city = $(this).val();
					        if (city === '서울특별시') {
					          var districts = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
					        } else if (city === '부산광역시') {
					           var districts = ['강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'];
					        } else if (city === '대구광역시') {
					            var districts = ['남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구'];
					         } else if (city === '인천광역시') {
					            var districts = ['강화군', '계양구', '남구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군'];
					         } else if (city === '광주광역시') {
					            var districts = ['광산구', '남구', '동구', '북구', '서구'];
					         } else if (city === '대전광역시') {
					            var districts = ['대덕구', '동구', '서구', '유성구', '중구'];
					         } else if (city === '울산광역시') {
					            var districts = ['남구', '동구', '북구', '울주군'];            
					         } else if (city === '세종특별자치시') {
					            var districts = ['세종특별자치시'];            
					         } else if (city === '경기도') {
					            var districts = ['가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', ' 포천시', '하남시', '화성시'];
					         } else if (city === '강원도') {
					            var districts = ['강릉시', '동해시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양양군', '영월군', '인제군', '정선군', '철원군', '화천군', '횡성군'];
					         } else if (city === '충청북도') {
					            var districts = ['청주시', '충주시', '제천시', '보은군', '옥천군', '영동군', '진천군', '괴산군', '음성군', '단양군'];
					         } else if (city === '충청남도') {
					            var districts = ['천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
					         } else if (city === '전라북도') {
					            var districts = ['전주시 완산구', '전주시 덕진구', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '순창군', '고창군', '부안군'];
					         } else if (city === '전라남도') {
					            var districts = ['광양시', '나주시', '목포시', '순천시', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
					         } else if (city === '경상북도') {
					            var districts = ['경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시'];
					         } else if (city === '경상남도') {
					            var districts = ['창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '함안군', '창녕군', '고성군', '남해군', '하동군', '산청군', '함양군', '거창군', '합천군'];
					         } else if (city === '제주특별자치도') {
					            var districts = ['제주시', '서귀포시'];
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
					  </script>
			</td>
		</tr>
		<tr>
			<td colspan="4">
			<div style="margin-bottom: 10px;"> 
				<span class="tag">카테고리</span>
			</div>
			
			<div class="cat">
				<label data-bs-toggle="modal" data-bs-target="#mySportsModal">
				<table class=catego>
					<tr>
						<td>
							<i class="bi bi-dribbble"></i>
							<h7>운동/스포츠</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myGameModal">
							<i class="bi bi-controller"></i>
							<h7>게임/오락</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myTravelModal">
							<i class="bi bi-geo-alt"></i>
							<h7>여행/아웃도어</h7>
							</label>
						</td>
					</tr>
					
					<tr>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myBookModal">
							<i class="bi bi-book"></i>
							<h7>책/글</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myWorkModal">
							<i class="bi bi-briefcase"></i>
							<h7>업종/직무</h7>
							</label>
						</td>
						<td>
							<label data-bs-toggle="modal" data-bs-target="#myLangModal">
							<i class="bi bi-translate"></i>
							<h7>외국/언어</h7>
							</label>
						</td>
					</tr>
				
					<tr>
					<td>
						<label data-bs-toggle="modal" data-bs-target="#myMusicModal">
						<i class="bi bi-music-note-beamed"></i>
						<h7>음악/악기</h7>
						</label>
					</td>
					<td>	
						<label data-bs-toggle="modal" data-bs-target="#mySocialModal">
						<i class="bi bi-cup-straw"></i>
						<h7>사교/인맥</h7>
						</label>
					</td>
					<td>
						<label data-bs-toggle="modal" data-bs-target="#myCraftsModal">
						<i class="bi bi-palette"></i>
						<h7>공예/만들기</h7>
						</label>
					</td>
				</tr>
				
			 </table>
			</div>		
		<tr>
			<td colspan="4">
				<div class="pickcate">
					<span class="tag">선택한 카테고리 :	</span>
				</div>
				<div type="text" id="selcategory"></div>
				<input type="hidden" class="selcategory" name="category" value="null">
			</td>
		</tr>
		<tr colspan="3">
			<td colspan="5">
				<div class="de" style="margin-bottom: 10px;">
					<span class="tag">상세 정보</span>
				</div>
				<textarea style="width:100%; height:300px;" name="mcontent" required="required" class="form-control"></textarea>			
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<div class="butt">
					<button type="button" class="makemo" id="btnsubmit">생성하기</button>
					<button type="button" class="notmo" onclick="history.back()">취소</button>
				</div>
			</td>
		</tr>
	</table>
	</form>
</div>


<script type="text/javascript">
$("#moimfile").change(function(){
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
		$("#showimg").attr("src",e.target.result);
		}
		reader.readAsDataURL($(this)[0].files[0]);
	}
});

const hiddenInput = document.querySelector('.selcategory');

const form = document.querySelector('form');
form.addEventListener('submit', function(event) {
  if (hiddenInput.value == "null") {
    event.preventDefault();
    alert('카테고리를 선택해주세요');
  }
});

form.addEventListener('submit', function(event) {
	const cityInput=document.querySelector('#city');
	if (cityInput.value == "시, 도 선택"){
		event.preventDefault();
	    alert('지역을 선택해주세요');
	}
});

</script>

<!-- Modal -->
	<!-- The Modal -->
	<div class="modal" id="mySportsModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">운동/스포츠</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="축구">축구</td>
			      	<td><input type="radio" name="categorys" value="농구">농구</td>
			      	<td><input type="radio" name="categorys" value="야구">야구</td>
			      	<td><input type="radio" name="categorys" value="테니스">테니스</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="배드민턴">배드민턴</td>
			      	<td><input type="radio" name="categorys" value="자전거">자전거</td>
			      	<td><input type="radio" name="categorys" value="클라이밍">클라이밍</td>
			      	<td><input type="radio" name="categorys" value="탁구">탁구</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="러닝/마라톤">러닝/마라톤</td>
			      	<td><input type="radio" name="categorys" value="골프">골프</td>
			      	<td><input type="radio" name="categorys" value="볼링">볼링</td>
			      	<td></td>
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myGameModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">게임/오락</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="다트">다트</td>
			      	<td><input type="radio" name="categorys" value="보드게임">보드게임</td>
			      	<td><input type="radio" name="categorys" value="두뇌심리게임">두뇌심리게임</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="온라인게임">온라인게임</td>
			      	<td><input type="radio" name="categorys" value="콘솔게임">콘솔게임</td>
			      	<td><input type="radio" name="categorys" value="단체놀이">단체놀이</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="타로카드">타로카드</td>
			      	<td><input type="radio" name="categorys" value="마술">마술</td>
			      	<td><input type="radio" name="categorys" value="바둑">바둑</td>  
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myTravelModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">여행/아웃도어</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="등산">등산</td>
			      	<td><input type="radio" name="categorys" value="국내여행">국내여행</td>
			      	<td><input type="radio" name="categorys" value="산책/트래킹">산책/트래킹</td>
			      	<td><input type="radio" name="categorys" value="패러글라이딩">패러글라이딩</td>
			      	
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="낚시">낚시</td>
			      	<td><input type="radio" name="categorys" value="해외여행">해외여행</td>
			      	<td><input type="radio" name="categorys" value="캠핑/백패킹">캠핑/백패킹</td>
			      	<td></td>
		      	</tr>
	      	</table>     
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myBookModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">책/글</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="책/독서">책/독서</td>
			      	<td><input type="radio" name="categorys" value="인문학">인문학</td>
			      	<td><input type="radio" name="categorys" value="심리학">심리학</td>
			      	<td><input type="radio" name="categorys" value="철학">철학</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="역사">역사</td>
			      	<td><input type="radio" name="categorys" value="시사/경제">시사/경제</td>
			      	<td><input type="radio" name="categorys" value="작문/글쓰기">작문/글쓰기</td>
			      	<td></td>
		      	</tr>
		    </table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myWorkModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">업족/직무</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="의료/건강/제약">의료/건강/제약</td>
			      	<td><input type="radio" name="categorys" value="IT/포털/인터넷">IT/포털/인터넷</td>
			      	<td><input type="radio" name="categorys" value="교육업">교육업</td> 	
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="광고/마케팅업계">광고/마케팅업계</td>
			      	<td><input type="radio" name="categorys" value="디자인업계  ">디자인업계</td>
			      	<td><input type="radio" name="categorys" value="무역/상사">무역/상사</td>      	
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="금융업">금융업</td>
			      	<td><input type="radio" name="categorys" value="세무/회계">세무/회계</td>
			      	<td><input type="radio" name="categorys" value="전자/기계/전기">전자/기계/전기</td>  	
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="패션/의류/뷰티">패션/의류/뷰티</td>
			      	<td><input type="radio" name="categorys" value="서비스업">서비스업</td>
			      	<td><input type="radio" name="categorys" value="식음료/외식업">식음료/외식업</td>
		      	</tr>      	
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myLangModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">외국/언어</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="영어">영어</td>
			      	<td><input type="radio" name="categorys" value="일본어">일본어</td>
			      	<td><input type="radio" name="categorys" value="중국어">중국어</td>
			      	
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="프랑스어">프랑스어</td>
			      	<td><input type="radio" name="categorys" value="스페인어">스페인어</td>
			      	<td><input type="radio" name="categorys" value="러시아어">러시아어</td>
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myMusicModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">음악/악기</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="노래/보컬">노래/보컬</td>
			      	<td><input type="radio" name="categorys" value="기타/베이스">기타/베이스</td>
			      	<td><input type="radio" name="categorys" value="드럼">드럼</td>
			      	<td><input type="radio" name="categorys" value="피아노">피아노</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="바이올린">바이올린</td>
			      	<td><input type="radio" name="categorys" value="밴드/합주">밴드/합주</td>
			      	<td><input type="radio" name="categorys" value="작사/작곡">작사/작곡</td>
			      	<td><input type="radio" name="categorys" value="힙합">힙합</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="클래식">클래식</td>
			      	<td><input type="radio" name="categorys" value="재즈">재즈</td>
			      	<td></td>
			      	<td></td>
		      	</tr>	      	
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="mySocialModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">사교/인맥</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="지역">지역</td>
			      	<td><input type="radio" name="categorys" value="나이">나이</td>
			      	<td><input type="radio" name="categorys" value="성별">성별</td>
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="싱글/연애">싱글/연애</td>
			      	<td><input type="radio" name="categorys" value="기혼/유부">기혼/유부</td>
			      	<td><input type="radio" name="categorys" value="돌싱">돌싱</td> 	
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="와인/커피/차">와인/커피/차</td>
			      	<td><input type="radio" name="categorys" value="맛집/미식회">맛집/미식회</td>
			      	<td></td>
		      	</tr>
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myCraftsModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">공예/만들기</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<table class="motable">
		      	<tr>
			      	<td><input type="radio" name="categorys" value="미술/그림">미술/그림</td>
			      	<td><input type="radio" name="categorys" value="캘리그라피">캘리그라피</td>
			      	<td><input type="radio" name="categorys" value="천연비누/화장품">천연비누/화장품</td>
		      	</tr>
		      	
		      	<tr>
			      	<td><input type="radio" name="categorys" value="가죽공예">가죽공예</td>
			      	<td><input type="radio" name="categorys" value="가구/목공예">가구/목공예</td>
			      	<td><input type="radio" name="categorys" value="도자/점토공예">도자/점토공예</td>
			      	
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="자수/뜨개질">자수/뜨개질</td>
			      	<td><input type="radio" name="categorys" value="키덜트/프라모델">키덜트/프라모델</td>
			      	<td><input type="radio" name="categorys" value="메이크업/네일">메이크업/네일</td>
		      	</tr>
		      	
		      	<tr>
		      		<td><input type="radio" name="categorys" value="캔들/디퓨저/석고 ">캔들/디퓨저/석고</td>
		      		<td></td>
			      	<td></td>
		      	</tr>	
	      	</table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
		
<script>
$(function() {
    // 체크박스 값이 변경될 때마다 실행되는 함수
    $('input[name="categorys"]').on('change', function() {
      // 모든 체크박스를 해제
      //$('input[name="categorys"]').not(this).prop('checked', false);
      
      // 선택된 체크박스 값을 출력
      var selected = $(this).val();
      $('#selcategory').text(selected);
      $('.selcategory').val(selected);
    });
  }); 
  
$("#overlappedMname").click(function(){
	$("#btnsubmit").attr("type", "button");
	const mname = $("#moimname").val();
	
	if(mname==""){
		$("#olmessage").text("필수 정보입니다.");
		$("#olmessage").addClass("olmessagef");
		$("#olmessage").removeClass("olmessaget");
	}
	else{
		
		$.ajax({
			type: "get",
			async: false,
			url: "/moim/makeCheck",
			data: {"mname": mname},
			success: function (data) {
				if(data == 1) {
					$("#olmessage").text("이미 사용중인 모임 이름 입니다.");
					$("#olmessage").addClass("olmessagef");
					$("#olmessage").removeClass("olmessaget");
				
				}else {
					$("#olmessage").text("사용 가능한 모임 이름 입니다.");
					$("#olmessage").addClass("olmessaget");
					$("#olmessage").removeClass("olmessagef");
					$("#btnsubmit").attr("type", "submit");
					$("#formmname").val($("#moimname").val());
				}
			}
		});	
	}
});
</script>
</body>
</html>










