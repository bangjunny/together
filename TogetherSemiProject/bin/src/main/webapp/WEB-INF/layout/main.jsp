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
	body{
		font-family: 'Jua';
		
	}
	a{
		cursor: pointer;
	}
	#main_container{
		width: 100%;
		height: 100%;
	}
	#main_head_logo{
		position: relative;
		left: 400px;
		top: 75px;
	}
	#main_header{
		width: 1200px;
		height: 500px;
		margin: 0 auto;
		display: flex;
		justify-content: space-around;
    	align-items: center;
		
	}
	#main_header_txt{
		margin-top: 25px;
		width: 400px;
		height: 300px;
		font-size: 25px;
		
	}
	#main_header_pic{
		width: 600px;
	}
	#main_btn_wrap{
		position: relative;
		left: 500px;
		bottom: 100px;
		width: 200px;
		display: flex;
		justify-content: space-between;
	}
	#main_list_go{
		margin-top: 100px;
		text-align: center;
	}
	.mainphoto{
		width: 200px;
		height: 200px;
		margin-right: 50px;
		margin-bottom: 50px;
	}
	#main_list_txt{
		margin: 0 auto;
		width: 800px;
		display: flex;
		justify-content: space-around;
		font-size: 20px;
		
	}
	#main_mid_pic{
		margin-top: 50px;
		width: 100%;
		height: 600px;
		background-image:url("./photo/mid_pic.jpg");
  		background-attachment: fixed;			
	}
	#main_bot_title{
		margin: 20px 0px 20px 0px;
		text-align: center;
	}
	#main_bot{
		width: 1200px;
		height: 600px;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
	}
	#main_bot_txt {
 		width: 45%;
  		position: relative; /* add this line to make sure the position of the <span> is relative to this container */
	}

	#main_bot_txt span {
  		position: absolute;
  		top: 80px; /* adjust this value as needed to move the <span> down */
	}
	#main_bot_pic{
		width: 45%;
	}
	
	#main_bot_imgs{
		width: 1000px;
		height: 500px;
		margin: 30px auto;
		display: flex;
		justify-content: center;
		justify-content: space-around;
	}
	#main_bot_imgs img{
		width: 200px;
		height: 200px;	
	}
</style>
<script type="text/javascript">
	//Define initial variables.

	var words = ["communities", "skills", "networks", "passions", "careers", "friendships"];
	var photos = ["/photo/main_1.jpg", "/photo/bot_1.jpg", "/photo/bot_1.jpg", "/photo/bot_1.jpg", "/photo/bot_1.jpg", "/photo/bot_1.jpg"]
	var count = 0;

	// Call the changeWord function once to start the rotation immediately
	changeMain();

	// Call the changeMain function every 2 seconds
	setInterval(changeMain, 2000); 

	function changeMain() {
  	// Define the current word to be displayed
  	var current_word = words[count];
  	var current_photo = photos[count];

  	// Change the word in the HTML
  	$("#rotate_word").html(current_word);
  	$("#rotate_photo").attr("src", current_photo);
  	


  	// Get the index of the next word in the array
  	count++;

  // If we've reached the end of the word list, go back to the start
  if (count == words.length) {
    count = 0;
  }
}

</script>
</head>
<body>
<div id="main_container">
<div id="main_head_logo">
<img alt="" src="./photo/logo.png" style="width: 75px; height: 75px;"> <b style="font-size: 25px;">다 함께!</b>
</div>
<div id="main_header">

	<div id="main_header_txt">
		Lorem ipsum dolor sit amet, consectetur adipisicing elited do eiusmod tempor incididunt ut labore e, st dolore magna aliqua. Ut enim ad minim veniam <span id="rotate_word" style="color: red">ninja</span>
	</div>
	<div id="main_header_pic">
		<img src="./photo/main_1.jpg" id="rotate_photo">
	</div>
	
</div>
	<div id="main_btn_wrap">
		<button type="button" onclick="location.href='로그인'">로그인</button>
		<button type="button" onclick="location.href='회원가입'">회원가입</button>
	</div>
<div id="main_list_go">
	<a href="모임 게시판">
	<img class="mainphoto" src="./photo/moim.png">
	</a>
	<a href="지역 게시판">
	<img class="mainphoto" src="./photo/local.png">
	</a>
	<a href="지도 페이지">
	<img class="mainphoto" src="./photo/map.png">
	</a>
	<br>
	<div id="main_list_txt">
		<span>모임 게시판</span>
		<span>지역 게시판</span>
		<span>지도로 위치 검색</span>
	</div>
	
	<div id="main_mid_pic">
		<!-- <img src="./photo/mid_pic.jpg"> -->
	</div>
	<h1 style="position: relative; bottom: 500px; color: white;">대충 괜찮은 문장</h1>
	<h3 style="position: relative; bottom: 475px; color: white;">적당히 설명하는 문장의 행렬은 나에게 스타크래프트 1.16.1 립버전 철수는 말했다 공열안와자였다 몹시 무시무시한 죠나단 스타크래프트 1.16.1 립버전</h3>
	
</div>
<div id="main_bot_title">
<h2 >Lorem ipsum</h2>
</div>
<div id="main_bot">
	<div id="main_bot_pic">
		<img src="/photo/bot_1.jpg">
	</div>
	<div id="main_bot_txt">
		<span>
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
		</span>
	</div>
</div>
	<div id="main_bot_imgs">
		<img src="/photo/bot_1.jpg">
		<img src="/photo/bot_2.jpg">
		<img src="/photo/bot_3.jpg">
		<img src="/photo/bot_4.jpg">
	</div>

</div>
</body>
</html>
