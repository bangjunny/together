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
                placeholder="아이디" required>
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
				<span>계정이 없으신가요? </span>
				<a href="/user/join">회원가입</a><br>
			</div>
			
			
            <%-- 카카오 --%>
            <a href="javascript:kakaoLogin();">
				<img src="/photo/kakao_login_large_wide.png" class="kakao">
			</a>
			<br><br>
			<a href="javascript:kakaoLogout();">
				<span>카카오 로그아웃</span>
			</a>
            
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
            							url: "http://localhost:9000/user/emailCheck",
            							data:{email:email},
            							success: function(data){
            								if(data == 0 && email!=''){
            									
            									location.href= "./kakaojoin?email=" + email 
    											+ "&gender=" + kakao_account.gender 
    											+ "&birthday=" + kakao_account.birthday 
    											+ "&nickname=" + res.properties.nickname;
            								}
            								else{
            									
            									
            									location.href="/";
            								}
            							}
            						});
            					}
            				});
            			}
            		});
            	}
            	
            	// 카카오 로그아웃
            	function kakaoLogout() {
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
    			  }  
            </script>

			<%-- <a href="javascript:kakaoLogin();">
				<img src="https://${imageUrl}/login/kakao_login_large_wide.png" >
			</a>
			<br>
			<a href="javascript:kakaoLogout();">
				<span>카카오 로그아웃</span>
			</a>
			
			<!-- 카카오 스크립트 -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
			Kakao.init('3dfe81a9edd8da85e0d913072ea5cf93'); //발급받은 키 중 javascript키를 사용해준다.
			console.log(Kakao.isInitialized()); // sdk초기화여부판단
			
			//카카오 로그인
			function kakaoLogin() {
			    Kakao.Auth.login({
			      success: function (response) {
			        Kakao.API.request({
			          url: '/v2/user/me',
			          success: function (response) {
			        	  console.log(response)
			        	  //conseole.log(response.account_email)
			          },
			          fail: function (error) {
			            console.log(error)
			          },
			        })
			      },
			      fail: function (error) {
			        console.log(error)
			      },
			    })
			  }
			
			//카카오 로그아웃  
			function kakaoLogout() {
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
			  }  
			</script> --%>
        </form>
    </div>
</body>
</html>