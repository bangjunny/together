<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="ch-new-plugin-theme" name="theme-color" content="#686868">
<title>회원가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="login.css">
  <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            background-color: #f7f7f7;
            font-family: "맑은 고딕", sans-serif;
        }
        
        .container {
            max-width: 400px;
            margin: 20 auto;
            padding: 40px 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0px 0px 5px #ddd;
            text-align: center;
        }
        
        .container h1 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #333;
            font-size: 2em;
        }
        
       #join-form {
		  width: 500px;
		  margin: 0 auto;
		  padding: 50px;
		  background-color: #fff;
		  border-radius: 10px;
		  box-shadow: 0px 0px 10px #ccc;
		}
		
		#join-form h2 {
		  margin-bottom: 20px;
		  font-size: 2rem;
		}
		
		.input-wrap {
		  display: flex;
		  flex-direction: column;
		  margin-bottom: 20px;
		}
		
    </style>
</head>
<body>
    <div class="container-fluid">
    	<form id="join-form" method="post" action="userinsert">
			  <h2>회원가입</h2>
			  
			  <div class="input-wrap">
			    <label for="user_email">이메일</label>
			    <input type="email" name="email" id="email" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_pw">비밀번호</label>
			    <input type="password" name="pass" id="pass" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_pw_check">비밀번호 확인</label>
			    <input type="password" name="pass_check" id="pass_check" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_name">이름</label>
			    <input type="text" name="uname" id="uname" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_age">생년월일</label>
			    <input type="date" name="age" required>
			   </div>
			  
			  <div class="input-wrap">
			  	<label for="user_gender">성별</label>
			  	<div class="ps_box gender_code">
			     <select id="gender" name="gender" aria-label="성별">
			     	<option value="M">남자</option>
			     	<option value="F">여자</option>
			     </select>
			    </div>
			    
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_city">지역</label>
			    <div class="ps_box_city" style="left: 122px;">
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
            	</div>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_phone">휴대전화</label>
			    <input type="tel" name="hp" id="hp" required>
			  </div>
			   
			  <button type="submit" class="btn-submit">가입하기</button>
			</form>
    </div>
  
</body>
</html>











