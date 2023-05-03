<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="ch-new-plugin-theme" name="theme-color" content="#686868">
<title>로그인 페이지</title>
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
        
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            color: #555;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>로그인</h1>
        <form action="login_process.jsp" method="post">
        <div class="form-group">
          <label for="user-type">개인회원/기업회원 선택</label>
          <select id="user-type" name="user-type">
            <option value="personal">개인회원</option>
            <option value="company">기업회원</option>
          </select>
        </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="pass">비밀번호</label>
                <input type="password" id="pass" name="pass" required>
            </div>
          
        <div class="form-group">
          <input type="submit" value="Login">
        </div>
        
            
            <div class="form-group">
                <span>계정이 없으신가요? </span>
                <a href="/login/newmember">회원가입</a>
            </div>
        </form>
    </div>
</body>
</html>