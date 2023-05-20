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
	#btn_wrap{
		width: 100%;
		display: flex;
		justify-content: flex-end;
	}
	.bot_btn{
		width: 100%;
		position: fixed;
		bottom: 0;
		margin-bottom: 20px;
	}
	#scrollbtn{
		width: 50px;
		height: 50px;
		border: 1px #808080 solid;
		background-color: rgb(252, 252, 240);	
		border-radius: 100px;
		margin-right: 10px;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* 그림자 효과 설정 */
	}
	#scrollbtn:hover{
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.7); 
	}
	#util_btn{
		width: 50px;
		height: 50px;
		border: 1px #808080 solid;
		border-radius: 100px;
		background-color: rgb(252, 252, 240);	
		margin-right: 10px;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* 그림자 효과 설정 */
	}
	#util_btn:hover{
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.7); 
	}
	#util_close_btn{
		width: 50px;
		height: 50px;
		border: 1px #808080 solid;
		border-radius: 100px;
		background-color: rgb(252, 252, 240);	
		margin-right: 10px;
		box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* 그림자 효과 설정 */
	}
	#util_close_btn:hover{
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.7); 
	}
	#util_window{
		width: 100%;
		display: flex;
		justify-content: flex-end;
	}
	#util_page{
		width: 300px;
		height: 400px;
		margin-right: 40px;
		margin-bottom: 15px;
		bottom:0;
		border: 1px #808080 solid;
		border-radius: 5px;
		background-color: white;
		box-shadow: 1px 2px 3px #808080;
		display: none;
	}
	#util_content{
		width: 100%;
		height: 80%;
		display: flex;
   		flex-direction: column;
   		align-items: center;
   		justify-content: space-around;
	}
</style>

</head>
<body>
	
	
	
	<div id="util_window">
		<div id="util_page">
			<div id="util_content">
	  		    <button onclick="location.href='/user/mypage?unum=${sessionScope.unum}'"><i class="bi bi-house-fill"></i>&nbsp; 마이프로필 홈</button><br>
	   		    <button onclick="location.href='/user/mypagegaiplist?unum=${sessionScope.unum}'"><i class="bi bi-people-fill"></i>&nbsp; 내 모임</button><br>
	            <button onclick="location.href='/user/mypagecblist?unum=${sessionScope.unum}'"><i class="bi bi-pencil-square"></i>&nbsp; 내가 작성한 글</button><br>
	    		<button onclick="location.href='/user/mypagecblikelist?unum=${sessionScope.unum}'"><i class="bi bi-heart-fill"></i>&nbsp; 내가 추천한 게시글</button>
			</div>
		</div>
	</div>
	<div id="btn_wrap">
		<button id="scrollbtn"><i class="bi bi-chevron-double-up"></i></button>
		<c:if test="${sessionScope.unum ne null }">
			<button id="util_btn"><i class="bi bi-gear"></i></button>
		</c:if>
	</div>


	
</body>
<script type="text/javascript">
$(document).ready(function() {
    $(document).on("click", "#util_btn", function() {
      $("#util_page").css("display", "block");
      $("#util_btn").replaceWith(`<button id="util_close_btn"><i class="bi bi-gear-fill"></i></button>`);
    });

    $(document).on("click", "#util_close_btn", function() {
      $("#util_page").css("display", "none");
      $("#util_close_btn").replaceWith(`<button id="util_btn"><i class="bi bi-gear"></i></button>`);
    });
  });
	
	 function scrollToTop() {
		    window.scrollTo({
		      top: 0,
		      behavior: "smooth" // 부드러운 스크롤 이동
		    });
		  }

		  // 윈도우의 scroll 이벤트에 함수 바인딩
		  window.addEventListener("scroll", function() {
		    var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
		  });

		  // 버튼 클릭 이벤트에 함수 바인딩
		  document.getElementById("scrollbtn").addEventListener("click", scrollToTop);
	
</script>
</html>
