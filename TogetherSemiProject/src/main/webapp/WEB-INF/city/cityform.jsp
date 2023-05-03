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
<style>
        body, body * {
            font-family: 'Jua'
        }

        .container  {
            width: 500px;
            margin: 0 auto;
            margin-top: 40px;
            background-color: #ddd;
        }

        .layout > input, textarea {
            width: 100%;
            height: 600px;
            box-sizing: border-box;
            margin-top: 10px;

        }

        .layout > textarea{
            width: 100%;
            margin-top: 50px;
            min-height: 300px;
        }

    </style>
</head>
<body>
<h1>지역 게시판</h1>
<div class="container">
    <form action="insert" method="post" enctype="multipart/form-data">
        <br>
        제목&nbsp;<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요" style="width: 100%">
        <br>
        <input type="file" class="form-control" name="upload" id="myfile">
        <br>
        <textarea name="content" class="form-control" style="resize: none;" placeholder="내용을 입력해주세요."></textarea>
        <br>
        <hr>
            <button type="submit" class="btn btn-success" onclick="location.href=''" style="margin-left: 180px">작성</button>
            <button type="submit" class="btn btn-success" onclick="history.back()">취소</button>
    </form>
</div> <!-- /container -->
</body>

</html>
