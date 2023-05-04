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
	body, body *{
		font-family: 'Jua'
	}
	table {
		position: absolute;
		margin-left: 200px;
	}
	
	label {
		cursor: pointer;
	}
</style>
</head>
<body>
<!-- 이미지 출력할곳 -->
<img id="showimg"
style="position: absolute;left:350px;top:0px; width: 200px; height:200px; border-radius:200px">

<div style="width:500px" id="tableform">
	<form action="insert" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" border="1" bgcolor="#ddd" style="width:500px">
		<tr>
			<td style="width:100px;">모임 이름</td>
			<td>
				<input type="text" class="form-control" name="mname" required="required" placeholder="모임 이름을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td style="width:100px;">모임장</td>
			<td>
				<input type="text" class="form-control" name="jang" required="required" placeholder="모임장 이름을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>
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
			<td>카테고리</td>
			<td>
				<label data-bs-toggle="modal" data-bs-target="#mySportsModal">
				<i class="bi bi-dribbble"></i>
				<h7>운동/스포츠</h7>
				</label>
				&nbsp;&nbsp;
				<label data-bs-toggle="modal" data-bs-target="#myGameModal">
				<i class="bi bi-controller"></i>
				<h7>게임/오락</h7>
				</label>
				&nbsp;&nbsp;&nbsp;
				<label data-bs-toggle="modal" data-bs-target="#myTravelModal">
				<i class="bi bi-geo-alt"></i>
				<h7>여행/아웃도어</h7>
				</label>
				<br>
				<label data-bs-toggle="modal" data-bs-target="#myBookModal">
				<i class="bi bi-book"></i>
				<h7>책/글</h7>
				</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label data-bs-toggle="modal" data-bs-target="#myWorkModal">
				<i class="bi bi-briefcase"></i>
				<h7>업종/직무</h7>
				</label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<label data-bs-toggle="modal" data-bs-target="#myLangModal">
				<i class="bi bi-translate"></i>
				<h7>외국/언어</h7>
				</label>
				<br>
				<label data-bs-toggle="modal" data-bs-target="#myMusicModal">
				<i class="bi bi-music-note-beamed"></i>
				<h7>음악/악기</h7>
				</label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<label data-bs-toggle="modal" data-bs-target="#mySocialModal">
				<i class="bi bi-cup-straw"></i>
				<h7>사교/인맥</h7>
				</label>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<label data-bs-toggle="modal" data-bs-target="#myCraftsModal">
				<i class="bi bi-palette"></i>
				<h7>공예/만들기</h7>
				</label>		
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" class="form-control" name="upload" id="moimfile">
			</td>
		</tr>
		<tr colspan="2">
			<td>모임 소개</td>
			<br>
			<td>
				<textarea style="width:100%; height:300px;" name="mcontent" required="required" class="form-control"></textarea>
			</td>
		</tr>
		<tr>
			<td>공개 여부</td>
			<td>
				<label>
					<input type="radio" name="open" value="공개">공개</input>
					&nbsp;&nbsp;&nbsp;
					<input type="radio" name="open" value="비공개">비공개</input>
				</label>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-success" id="btnsubmit">만들기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-danger" onclick="history.back()">취소</button>
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

const form = document.querySelector('form');
form.addEventListener('submit', (event) => {
  const radioButton = document.querySelector('input[name="open"]:checked');
  if (!radioButton) {
    event.preventDefault();
    alert('공개 여부를 선택해주세요.');
  }
});
</script>

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
        <input type="checkbox" value="football">축구
        <input type="checkbox" value="baseketball">농구
        <input type="checkbox" value="baseball">야구
        <input type="checkbox" value="tennis">테니스
        <input type="checkbox" value="badminton">배드민턴
        <br>
        <input type="checkbox" value="cycle">자전거
        <input type="checkbox" value="climbing">클라이밍
        <input type="checkbox" value="tabletennis">탁구
        <input type="checkbox" value="running">러닝/마라톤
        <input type="checkbox" value="golf">골프
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
        <input type="checkbox" value="dart">다트
        <input type="checkbox" value="boardgame">보드게임
        <input type="checkbox" value="mindgame">두뇌심리게임
        <input type="checkbox" value="onlinegame">온라인게임
        <input type="checkbox" value="consolegame">콘솔게임
        <br>
        <input type="checkbox" value="groupplay">단체놀이
        <input type="checkbox" value="tarotcard">타로카드
        <input type="checkbox" value="magic">마술
        <input type="checkbox" value="baduk">바둑
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
        <input type="checkbox" value="mountainclimbing">등산
        <input type="checkbox" value="tracking">산책/트래킹
        <input type="checkbox" value="camping">캠핑/백패킹
        <input type="checkbox" value="domestictravel">국내여행
        <input type="checkbox" value="overseastravel">해외여행
        <input type="checkbox" value="fishing">낚시
        <br>
        <input type="checkbox" value="paragliding">패러글라이딩
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
        <input type="checkbox" value="football">책/독서
        <input type="checkbox" value="baseketball">인문학
        <input type="checkbox" value="baseball">심리학
        <input type="checkbox" value="tennis">철학
        <input type="checkbox" value="badminton">역사
        <br>
        <input type="checkbox" value="cycle">시사/경제
        <input type="checkbox" value="climbing">작문/글쓰기
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
        <input type="checkbox" value="football">축구
        <input type="checkbox" value="baseketball">농구
        <input type="checkbox" value="baseball">야구
        <input type="checkbox" value="tennis">테니스
        <input type="checkbox" value="badminton">배드민턴
        <br>
        <input type="checkbox" value="cycle">자전거
        <input type="checkbox" value="climbing">클라이밍
        <input type="checkbox" value="tabletennis">탁구
        <input type="checkbox" value="running">러닝/마라톤
        <input type="checkbox" value="golf">골프
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
        <input type="checkbox" value="football">축구
        <input type="checkbox" value="baseketball">농구
        <input type="checkbox" value="baseball">야구
        <input type="checkbox" value="tennis">테니스
        <input type="checkbox" value="badminton">배드민턴
        <br>
        <input type="checkbox" value="cycle">자전거
        <input type="checkbox" value="climbing">클라이밍
        <input type="checkbox" value="tabletennis">탁구
        <input type="checkbox" value="running">러닝/마라톤
        <input type="checkbox" value="golf">골프
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
        <input type="checkbox" value="football">축구
        <input type="checkbox" value="baseketball">농구
        <input type="checkbox" value="baseball">야구
        <input type="checkbox" value="tennis">테니스
        <input type="checkbox" value="badminton">배드민턴
        <br>
        <input type="checkbox" value="cycle">자전거
        <input type="checkbox" value="climbing">클라이밍
        <input type="checkbox" value="tabletennis">탁구
        <input type="checkbox" value="running">러닝/마라톤
        <input type="checkbox" value="golf">골프
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
        <input type="checkbox" value="football">축구
        <input type="checkbox" value="baseketball">농구
        <input type="checkbox" value="baseball">야구
        <input type="checkbox" value="tennis">테니스
        <input type="checkbox" value="badminton">배드민턴
        <br>
        <input type="checkbox" value="cycle">자전거
        <input type="checkbox" value="climbing">클라이밍
        <input type="checkbox" value="tabletennis">탁구
        <input type="checkbox" value="running">러닝/마라톤
        <input type="checkbox" value="golf">골프
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
        <input type="checkbox" value="football">축구
        <input type="checkbox" value="baseketball">농구
        <input type="checkbox" value="baseball">야구
        <input type="checkbox" value="tennis">테니스
        <input type="checkbox" value="badminton">배드민턴
        <br>
        <input type="checkbox" value="cycle">자전거
        <input type="checkbox" value="climbing">클라이밍
        <input type="checkbox" value="tabletennis">탁구
        <input type="checkbox" value="running">러닝/마라톤
        <input type="checkbox" value="golf">골프
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>
</body>
</html>











