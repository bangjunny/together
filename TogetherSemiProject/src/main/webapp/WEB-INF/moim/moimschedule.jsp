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
	
	#tableform {
		margin-left: 400px;
		margin-top: 200px;
	}
</style>
</head>
<body>
<div id="tableform" style="width:400px" >
	<form action="insertSchedule" method="post" enctype="multipart/form-data" id="moimform">
	<table class="table table-bordered" border="1" bgcolor="#ddd" style="width:400px;">
		<caption style="align:top; font-size:20px;">일정 만들기</caption>		
		<tr>
			<td colspan="2">
				<input type="text" id="mssubject" class="form-control" name="mssubject" required="required" placeholder="일정 제목을 입력해주세요">
			</td>
		</tr>
		<tr>
			<td style="width:50px;" align="center"><i class="bi bi-calendar"></i></td>
			<td>
				<input type="date" class="form-control" id="msdate" name="msdate" required="required">
			</td>
		</tr>
		<tr>
			<td style="width:50px;" align="center"><i class="bi bi-clock"></i></td>
			<td>
				<input type="time" class="form-control" id="mstime" name="mstime" required="required">
			</td>
		</tr>
		<tr>
			<td style="width:50px;" align="center"><i class="bi bi-geo-alt"></i></td>
			<td>
				<input type="text" class="form-control" id="mslocation" name="mslocation" required="required" placeholder="장소를 입력해주세요">
			</td>
		</tr>
		<tr>
			<td style="width:50px;" align="center"><b>￦</b></td>
			<td>
				<input type="text" class="form-control" id="mscost" name="mscost" required="required" placeholder="예시) 식사비 15000원">
			</td>
		</tr>
		<tr>
		<input type="hidden" name="mnum" value="${mnum}">
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
</body>
</html>











