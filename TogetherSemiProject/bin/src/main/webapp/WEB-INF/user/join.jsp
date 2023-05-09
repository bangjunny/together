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
      
      .btn-wrap {
        display: flex;
        flex-direction: column;
      }
      
      .in {
         height:50px;
         width: 100%;
      }
      
      .gen {
         height:50px;
         width:100%;
      }
      
      .cit {
         height:50px;
         width:197px;
      }
      
      .btn-submit {
        width:100%;
        height:50px;
        background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
        background-position: left;
        background-size: 200%;
        color:white;
        font-weight: 700;
        border:none;
        cursor:pointer;
        transition: 0.4s;
        margin-top:20px;
        font-size:18px;
      }

      .btn-submit:hover {
           background-position: right;
      }
      
      input:focus {
          outline: none;
      }
      
      .pswdImg {
          width: 18px;
          height: 20px;
          display: inline-block;
          position: absolute;
          top: 50%;
          right: 16px;
          margin-top: -10px;
          cursor: pointer;
      }
      
      .box {
          display: block;
          width: 100%;
          height: 50px;
          border: solid 1px #dadada;
          padding: 10px 14px 10px 14px;
          box-sizing: border-box;
          background: #fff;
          position: relative;
      }
      
      .int {
          display: block;
          position: relative;
          width: 100%;
          height: 29px;
          border: none;
          background: #fff;
          font-size: 15px;
      }
      
      .box.int_pass {
          padding-right: 40px;
      }

      .box.int_pass_check {
          padding-right: 40px;
      }
      
      .step_url {
          /*@daham.com*/
          position: absolute;
          top: 16px;
          right: 13px;
          font-size: 15px;
          color: #8e8e8e;
      }
      
      select {
          width: 100%;
          height: 29px;
          font-size: 15px;
          background: #fff
          background-size: 20px 8px;
          -webkit-appearance: none;
          display: inline-block;
          text-align: start;
          border: solid 1px #dadada;
          cursor: default;
      }
      
      .la{
       font-size:18px;
      }
      
      /* 에러메세지 */
   
      .error_next_box {
          margin-top: 9px;
          font-size: 12px;
          color: red;    
          display: none;
      }
      
      #alertTxt {
          position: absolute;
          top: 19px;
          right: 38px;
          font-size: 12px;
          color: red;
          display: none;
      }
      
      .olmessagef {color: red; margin-top:9px; font-size:12px;}
	  .olmessaget {color: green; margin-top:9px; font-size:12px;}
         
    </style>
</head>
<body>
    <div class="container-fluid">
       
       <form id="join-form" method="post" action="userinsert">
       
       <h2>회원가입</h2>
  
           <!-- ID -->
                <div class="input-wrap">
                <label for="id" class="la">이메일</label>                
                <span class="box int_id">
                   <input type="email" id="email" name="email" class="int" maxlength="20">                                     
                </span>
                <span id="olmessage"></span> 
                <span class="error_next_box"></span>
                </div>
           
           
           <!-- PW1 -->
                <div class="input-wrap">
                    <label for="pswd1" class="la">비밀번호</label>
                    <span class="box int_pass">
                        <input type="password" id="pass" name="pass" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div class="input-wrap">
                    <label for="pswd2" class="la">비밀번호 재확인</label>
                    <span class="box int_pass_check">
                        <input type="password" id="pass_check" name="pass_check" class="int" maxlength="20">
                        <img src="m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>
           
           <!-- NAME -->
                <div class="input-wrap">
                    <label for="name" class="la">이름</label>
                    <span class="box int_name">
                        <input type="text" id="uname" name="uname" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
           
           <div class="input-wrap">
             <label for="age" class="la">생년월일</label>
             <span class="box int_age">
                <input type="date" id="age" name="age" class="int">
             </span>
             <span class="error_next_box"></span>
            </div>
           
           <!-- GENDER -->
                <div class="input-wrap">
                    <label for="gender" class="la">성별</label>
                        <select id="gender" name="gender" class="gen">
                           <option hidden>성별</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>                            
                    <span class="error_next_box">필수 정보입니다.</span>
                </div>
           
           <div class="input-wrap">
             <label for="user_city" class="la">지역</label>
             <div class="ps_box_city" style="left: 122px;">
                     <select id = "city" name="city1" class="cit">
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
                     
                      <select id="district" name="city2" class="cit">
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
                           var districts = ['가람동','고운동', '금남면', '나성동', '누리동', '다솜동', '다정동', '대평동', '도담동', '반곡동', '보람동', '부강면', '산울동', '새롬동', '세종동', '소담동', '소정면','아름동', '어진동', '연기면', '연동면', '연서면', '용호동', '장군면', '전동면', '전의면', '조치원읍', '종촌동', '집현동', '한별동', '한솔동', '합강동', '해밀동'];            
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
             <label for="user_phone" class="la">휴대전화</label>
             <span class="box int_mobile">
                <input type="tel" id="hp" name="hp" class="int" maxlength="16" placeholder="전화번호 입력">
             </span>
             <span class="error_next_box"></span>
           </div>
           
            
            
           <div class="btn-wrap">
              <button type="submit" class="btn-submit">가입하기</button>
           </div>
         </form>
    </div>
    
    <script type="text/javascript">
    
    /*변수 선언*/
    
    var email = document.querySelector('#email');
    
    var pw1 = document.querySelector('#pass');
    var pwMsg = document.querySelector('#alertTxt');
    var pwImg1 = document.querySelector('#pswd1_img1');

    var pw2 = document.querySelector('#pass_check');
    var pwImg2 = document.querySelector('#pswd2_img1');
    var pwMsgArea = document.querySelector('.int_pass');
    
    var userName = document.querySelector('#uname');
    
    var age = document.querySelector('#age');
    
    var gender = document.querySelector('#gender');
    
    var mobile = document.querySelector('#hp');
    
    var error = document.querySelectorAll('.error_next_box');
    
    /*이벤트 핸들러 연결*/
    
    email.addEventListener("focusout", isEmailCorrect);
    
    pw1.addEventListener("focusout", checkPw);
    pw2.addEventListener("focusout", comparePw);
    
    userName.addEventListener("focusout", checkName);
    
    age.addEventListener("focusout", checkage);
    
    gender.addEventListener("focusout", function() {
        if(gender.value === "성별") {
            error[5].style.display = "block";
        } else {
            error[5].style.display = "none";
        }
    });
    
    mobile.addEventListener("focusout", checkPhoneNum);
    
    
    /*콜백 함수*/
    
    function isEmailCorrect() {
        var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

        if(email.value === ""){ 
           //error[0].innerHTML = "필수 정보입니다.";
            error[0].style.display = "block"; 
        } else if(!emailPattern.test(email.value)) {
           error[0].innerHTML = "이메일 주소를 다시 확인해주세요.";
            error[0].style.display = "block";
        } else {
            error[0].style.display = "none"; 
        }

    }
    
    function checkPw() {
        var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
        if(pw1.value === "") {
            error[1].innerHTML = "필수 정보입니다.";
            error[1].style.color = "red";
            error[1].style.display = "block";
        } else if(!pwPattern.test(pw1.value)) {
            error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            error[1].style.color = "red";
            pwMsg.innerHTML = "사용불가";
            pwMsg.style.color = "red";
            pwMsgArea.style.paddingRight = "93px";
            error[1].style.display = "block";
            
            pwMsg.style.display = "block";
            pwImg1.src = "m_icon_not_use.png";
        } else {
            error[1].style.display = "none";
            pwMsg.innerHTML = "안전";
            pwMsg.style.display = "block";
            pwMsg.style.color = "#03c75a";
            pwImg1.src = "m_icon_safe.png";
        }
    }

    function comparePw() {
        if(pw2.value === pw1.value && pw2.value != "") {
            pwImg2.src = "m_icon_check_enable.png";
            error[2].style.color = "red";
            error[2].style.display = "none";
        } else if(pw2.value !== pw1.value) {
            pwImg2.src = "m_icon_check_disable.png";
            error[2].style.color = "red";
            error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
            error[2].style.display = "block";
        } 

        if(pw2.value === "") {
            error[2].innerHTML = "필수 정보입니다.";
            error[2].style.color = "red";
            error[2].style.display = "block";
        }
    }
    
    function checkName() {
         var namePattern = /^[a-zA-Z가-힣]+$/; // 특수기호, 공백 사용 불가능
         if (userName.value === "") {
           error[3].innerHTML = "필수 정보입니다.";
           error[3].style.display = "block";
         } else if (!namePattern.test(userName.value)) {
           error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
           error[3].style.display = "block";
         } else {
           error[3].style.display = "none";
         }
       }
    
    function checkage() {
       
       if(age.value === "") {
            error[4].innerHTML = "필수 정보입니다.";
            error[4].style.display = "block";
        } else {
            error[4].style.display = "none";
        }
    }
    
    function checkPhoneNum() {
         var isPhoneNum = /^[0-9]*$/;

         if(mobile.value === "") {
           error[6].innerHTML = "필수 정보입니다.";
           error[6].style.display = "block";
         } else if(!isPhoneNum.test(mobile.value)) {
           error[6].innerHTML = "숫자로만 입력해주세요.";
           error[6].style.display = "block";
         } else {
           error[6].style.display = "none";
         }
       }
    
    $("#email").focusout(function(){
    	$(".btn-submit").attr("type", "button");
    	const email = $("#email").val();
    	$.ajax({
    	type: "get",
    	async: false,
    	url: "http://localhost:9000/user/emailCheck",
    	data: {email: email},
    	success: function (data) {
    	if(data == 0 && email=='' ) {
    		$("#olmessage").text("필수 정보입니다.");
    		$("#olmessage").addClass("olmessagef");
    		$("#olmessage").removeClass("olmessaget");
    		}else if(data == 0 && email!=''){
    		$("#olmessage").text("사용 가능한 이메일 입니다.");
    		$("#olmessage").addClass("olmessaget");
    		$("#olmessage").removeClass("olmessagef");
    		$(".btn-submit").attr("type", "submit");
    		}else{
    			$("#olmessage").text("이미 사용중인 이메일 입니다.");
        		$("#olmessage").addClass("olmessagef");
        		$("#olmessage").removeClass("olmessaget");	
    		}
    		}
    	})
    	});
    
    const form = document.querySelector('form');
    
    	form.addEventListener('submit', function(event) {
    	    const nameInput = document.querySelector('#uname');
    	    if (nameInput.value == ''){
    	        event.preventDefault();
    	        if (confirm('이름을 입력해주세요')) {
    	            nameInput.focus();
    	        }
    	        return;
    	    }
    	    const genderInput = document.querySelector('#gender');
    	    if (genderInput.value == '성별'){
    	        event.preventDefault();
    	        if (confirm('성별을 선택해주세요')) {
    	            genderInput.focus();
    	        }
    	        return;
    	    }
    	    const cityInput=document.querySelector('#city');
    	    if (cityInput.value == '시, 도 선택'){
    	    	event.preventDefault();
    	        if(confirm('지역을 선택해주세요')){
    	    	    cityInput.focus();
    	    	}
    	    	return;
    	    }
    	    const hpInput=document.querySelector('#hp');
    	    if (hpInput.value == ''){
    	    	event.preventDefault();
    	        if(confirm('전화번호를 입력해주세요')){
    	        hpInput.focus();
    	    	}
    	    	return;
    	    }
    	});
    /* form.addEventListener('submit', function(event) {
    	const nameInput=document.querySelector('#uname');
    	if (nameInput.value == ''){
    		event.preventDefault();
    	    alert('이름을 입력해주세요');
    	    nameInput.focus();
    	}
    });
    
    form.addEventListener('submit', function(event) {
    	const genderInput=document.querySelector('#gender');
    	if (genderInput.value == '성별'){
    		event.preventDefault();
    	    alert('성별을 선택해주세요');
    	    genderInput.focus();
    	}
    }); */
    

    </script>

  
</body>
</html>










