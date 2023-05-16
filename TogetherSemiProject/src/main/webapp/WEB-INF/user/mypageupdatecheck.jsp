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
<form method="post" action="/user/mypagePassCheck">
  <label for="password">비밀번호를 입력하세요:</label>
  <input type="password" id="mypagepass" name="pass">
  <button type="submit" id= >확인</button>
</form>  
  
  

<!--
<script type="text/javascript">
	$(function(){
		
		$("#mypagepass").click(function(){
			//비번
			let pass=$("#mypagepass").val();
			
			$.ajax({
				type:"get",
				url:"/user/mypagePassCheck",
				data:{"pass":pass},
				dataType:"text",
				success:function(res){
					if(res.result=='success'){						
						location.href=`./mypageupdate?unum=\${unum}`;//수정페이지로 이동
					}else{
						alert('비밀번호가 맞지 않습니다');
					}
				}
			})			
		});
	});
</script>

  -->

</body>
</html>