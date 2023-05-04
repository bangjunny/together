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
	div {
		position: absolute;
		margin-left: 200px;
	}
</style>
</head>
<body>
<!-- 이미지 출력할곳 -->
<img id="showimg"
style="position: absolute;left:750px;top:20px; width: 200px; height:200px; border-radius:200px">

<div style="width:500px">
	<form action="insert" method="post" enctype="multipart/form-data">
	<table class="table" border="1" bgcolor="lightgray" >
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
				<select id="city1" name="city1" required="required">
					<option value="서울시">서울시</option>
					<option>경기도</option>
				</select>
				<select id="city2" name="city2" required="required">
					<option selected disabled hidden>-</option>
					<option>강남구</option>
					<option>강서구</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<select id="category" name="category" required="required">
					<option selected disabled hidden>선택해주세요</option>
					<option>운동</option>
					<option>게임</option>
					<option>음악</option>
					<option>여행</option>
				</select>				
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
</body>
</html>











