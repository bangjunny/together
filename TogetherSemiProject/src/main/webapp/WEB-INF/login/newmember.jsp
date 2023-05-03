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
    	<form id="join-form" method="post" action="join_process.jsp">
			  <h2>회원가입</h2>
			  
			  <div class="input-wrap">
			    <label for="user_email">이메일</label>
			    <input type="email" name="user_email" id="user_email" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_pw">비밀번호</label>
			    <input type="password" name="user_pw" id="user_pw" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_pw_check">비밀번호 확인</label>
			    <input type="password" name="user_pw_check" id="user_pw_check" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_name">이름</label>
			    <input type="text" name="user_name" id="user_name" required>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_age">생년월일</label>
			    
			    <span class="ps_box">
			    	<input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
			    </span>
			    
			    <div class="bir_mm">
			    	<span class="ps_box">
			    		<select id="mm" class="sel" aria-label="월">
			    			<option value="">월</option>
			    				<option value="01">
			    					1
			    				</option>
			    				
			    				<option value="02">
			    					2
			    				</option>
			    				
			    				<option value="03">
			    					3
			    				</option>
			    				
			    				<option value="04">
			    					4
			    				</option>
			    				
			    				<option value="05">
			    					5
			    				</option>
			    				
			    				<option value="06">
			    					6
			    				</option>
			    				
			    				<option value="07">
			    					7
			    				</option>
			    				
			    				<option value="08">
			    					8
			    				</option>
			    				
			    				<option value="09">
			    					9
			    				</option>
			    				
			    				<option value="10">
			    					10
			    				</option>
			    				
			    				<option value="11">
			    					11
			    				</option>
			    				
			    				<option value="12">
			    					12
			    				</option>
			    			</select>
			    		</span>
			    	</div>
			  </div>
			  
			  <div class=" bir_dd">
			  	<span class="ps_box">
			  		<input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2">
			  		<label for="dd" class="lbl"></label>
			  	</span>
			  </div>
			  
			  <div class="input-wrap">
			  	<label for="user_gender">성별</label>
			  	<div class="ps_box gender_code">
			     <select id="gender" name="gender" class="sel" aria-label="성별">
			     	<option value="" selected="">성별</option>
			     	<option value="M">남자</option>
			     	<option value="F">여자</option>
			     	<option value="U">선택 안함</option>
			     </select>
			    </div>
			    
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_city">지역</label>
			    <div class="ps_box_city" style="left: 122px;">
               		<select id = "city1" name="gi1" >
	               		<option value="서울특별시" selected="">서울특별시</option>
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
               		
               		<select id = "city2" name="gi1">
               			<option>강남구</option>
               		</select>
            	</div>
			  </div>
			  
			  <div class="input-wrap">
			    <label for="user_phone">휴대전화</label>
			    <input type="tel" name="user_phone" id="user_phone" required>
			  </div>
			   
			  <button type="submit" class="btn-submit">가입하기</button>
			</form>
    </div>
  
</body>
</html>











