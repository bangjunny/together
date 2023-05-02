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
   body, body *{
      font-family: 'Jua'
   }
</style>
</head>
<body>
<h1>지역 게시판</h1>
<div style="width: 600px;height: 900px;background-color: #ddd;">
    <h3>제목</h3>
    <h6 style="float: right;">추천수</h6>
    <h6 style="float: right;">조회수&nbsp;</h6>
    <h6 style="float: left">작성자&nbsp;</h6>
    <h6>작성일</h6>
    <hr>
    <div>
        <div style="margin-left: 100px">
            <div style="border: 5px solid pink;width: 100px;height: 100px;">사진영역</div>
        </div>
    </div>
    <pre>
        게시글 영역
    </pre>
    <br><br><br>

    <i class="bi bi-hand-thumbs-up" style="font-size: 40px;margin-left: 245px"></i>
    <i class="bi bi-hand-thumbs-down" style="font-size: 40px;margin-left: 30px"></i>

    <hr>
    <div style="margin: auto">
    <button type="submit" class="btn btn-sm btn-success" style="margin-left: 225px">수정</button>
    <button type="button" class="btn btn-sm btn-success">목록으로</button>
    <button type="button" class="btn btn-sm btn-success">삭제</button>
    </div>
    <hr>
    <form action="/action_page.php">
        <div class="mb-3 mt-3">
            <textarea class="form-control" rows="5" id="comment" name="text" style="height: 200px;resize: none;width: 500px;margin-left: 50px"
            placeholder="내용을 입력해주세요"></textarea>
        </div>
        <button type="submit" class="btn btn-primary btn-sm" style="float: right;margin-right: 30px;">입력</button>
    </form>
</div>
</div>
</body>
</html>
