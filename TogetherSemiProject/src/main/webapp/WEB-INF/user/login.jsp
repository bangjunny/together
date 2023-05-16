<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="ch-new-plugin-theme" name="theme-color" content="#686868">
<title>로그인 페이지</title>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
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
            max-width: 400px !important;
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
        
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
            font-size: 0.9em;
            font-weight: bold;
        }
        
        .form-group input[type="email"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            /* color: #555; */
        }
        
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #00a0e9;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .form-group input[type="submit"]:hover {
            background-color: #0077c0;
        }
        
        .form-group .message {
            margin-top: 10px;
            color: #f00;
            font-size: 0.8em;
        }
        .kakao {
        	width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>로그인</h1>
        <form action="loginaction" method="post">
        
            <div class="form-group">
               <!--  <label for="user_id">아이디</label> -->
                <input type="email" id="user_email" name="email" autofocus="autofocus" 
                placeholder="아이디" required
                value="${!(saveemail==null or saveemail=='no')?sessionScope.loginemail:''}">
            </div>
            
            <div class="form-group">
                <!-- <label for="user_pw">비밀번호</label> -->
                <input type="password" id="user_pw" name="pass" 
                placeholder="비밀번호" required>
            </div>
          
	        <div class="form-group">
	          <input type="submit" value="Login">
	        </div>
        

			<div class="form-group">
				<!-- <span>계정이 없으신가요? </span> -->
				
				<label>
					<input type="checkbox" name="saveemail"
					${!(saveemail==null or saveemail=='no')?"checked":"" }> 이메일 저장	
				</label>
				<a href="/user/join">회원가입</a><br>
			</div>
			
			<br>
			
            <%-- 카카오 --%>
            <a href="javascript:kakaoLogin();">
				<img src="/photo/kakao_login_large_wide.png" class="kakao">
			</a>
			<br><br>
			
			<!-- 네이버 로그인 버튼 노출 영역 -->
			<div id="naver_id_login"></div>
			
			<!-- //네이버 로그인 버튼 노출 영역 -->
			<script type="text/javascript">
				var naver_id_login = new naver_id_login("eeKSBaviQtr4I8frMTNN", "http://localhost:9000/user/callback");
			  	var state = naver_id_login.getUniqState();
			  	naver_id_login.setButton("green", 3,70);
			  	naver_id_login.setDomain("http://localhost:9000/user/login");
			  	naver_id_login.setState(state);
			  	//naver_id_login.setPopup(); // 팝업창으로 뜨게하는 코드
			  	naver_id_login.init_naver_id_login();
			</script>
			
			<!--  <br><br>
			
			<a href="javascript:kakaoLogout();">
				<span>카카오 로그아웃</span>
			</a>-->
            
            <script>
            	window.Kakao.init('3dfe81a9edd8da85e0d913072ea5cf93');
            	
            	function kakaoLogin() {
            		window.Kakao.Auth.login({
            			scope:'profile_nickname, account_email, gender, birthday',
            			success: function(res){
            				console.log(res);
            				window.Kakao.API.request({
            					url:'/v2/user/me',
            					success: res => {
            						const kakao_account = res.kakao_account;
            						console.log(kakao_account);
            						const email = kakao_account.email;
            	                    console.log(email);
            						//console.log(kakao_account.email);
            						console.log(kakao_account.gender);
            						console.log(kakao_account.birthday);
            						console.log(res.properties.nickname);
            						
            						$.ajax({
            							type: "get",
            							async: false,
            							url: "emailCheck",
            							data:{email:email},
            							success: function(data){
            								if(data == 0 && email!=''){
            									
            									location.href= "./kakaojoin?email=" + email 
    											+ "&gender=" + kakao_account.gender 
    											+ "&birthday=" + kakao_account.birthday 
    											+ "&nickname=" + res.properties.nickname;
            								}
            								else{
            									
            									$.ajax({
                        							type: "get",
                        							url: "otherlogin",
                        							dataType:"text",
                        							data :{"email":email},
                        							success: function(){
            											//alert("성공");
            											location.href="/";
                        							}
            									});
            								}
            							}
            						});
            					}
            				});
            			}
            		});
            	}
            	
            	// 카카오 로그아웃
            	/*function kakaoLogout() {
    			    if (Kakao.Auth.getAccessToken()) {
    			      Kakao.API.request({
    			        url: '/v1/user/unlink',
    			        success: function (response) {
    			        	console.log(response)
    			        },
    			        fail: function (error) {
    			          console.log(error)
    			        },
    			      })
    			      Kakao.Auth.setAccessToken(undefined)
    			    }
    			  }  */
            </script>

        </form>
    </div>
</body>
</html>