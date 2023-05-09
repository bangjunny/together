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
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick-theme.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
<style>
	body{
		font-family: 'NanumPenScript';
	}
	a:link,a:visited,a:hover {
		color: black;
		text-decoration: none;
	}
	.list_a span{
		text-decoration: none;
	
	}

	#main_container{
		width: 100%;
		height: 100%;
	}
  	#main_header{
      width: 1400px;
      height: 500px;
      margin: 0 auto;
      display: flex;
      align-items: center;      
   }

	#main_head_logo{
		position: relative;
		bottom: 200px;
		left: 175px;
	}	
	#main_header_txt{
		margin-top: 25px;
		margin-right:50px;
		width: 500px;
		height: 300px;
		font-size: 25px;
	}
	
	#main_header_pic{
		width: 600px;
		
	}
	#main_header_pic img{
		width: 600px;
	}
	#rotate_photo{
		width: 700px;
		height: 500px;
		
	}
	#main_btn_wrap{
		margin-top: 50px;
		margin-left:70px;
		width: 200px;
		display: flex;
		justify-content: space-between;
	}
	#main_list_go{
		margin: 150px auto 150px auto;
		text-align: center;
		display: flex;
		justify-content: center;
		align-items: center;
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
		height: 700px;
		background-image:url("../photo/mid_pic.jpg");
  		background-attachment: fixed;			
	} 
	#main_mid_txt{
		position: relative; 
		bottom: 500px; 
		color: white;		
	}
	#main_mid_txt h1, h3{
		background-color: transparent;
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
	.main_bot_pic{
		width: 45%;
	}
	
	.main_bot_imgs{
		width: 1000px;
		height: 300px;
		margin: 0 auto;

	}
	.main_bot_imgs img{
		width: 200px;
		height: 200px;	
		margin-right: 25px;
	}
</style>
<script type="text/javascript">
	//Define initial variables.

	var words = ["communities", "skills", "networks", "passions", "careers", "friendships"];
	var photos = ["/photo/main_1.jpg", "/photo/main_2.jpg", "/photo/main_3.jpg", "/photo/main_7.jpg", "/photo/main_5.jpg", "/photo/main_6.jpg"]
	var count = 0;

	// Call the changeWord function once to start the rotation immediately
	changeMain();

	// Call the changeMain function every 3 seconds
	setInterval(changeMain, 3000); 

	function changeMain() {
  	// Define the current word to be displayed
  	var current_word = words[count];
  	var current_photo = photos[count];

    // Fade out the old image
    $("#rotate_photo").fadeOut("2s", function() {
      // Change the word and photo in the HTML
      $("#rotate_photo").attr("src", current_photo);

      // Fade in the new image
      $("#rotate_photo").fadeIn("2s");
    });
	
    // Fade out the old image
    $("#rotate_word").fadeOut("2s", function() {
      // Change the word and photo in the HTML

      $("#rotate_word").html(current_word);

      // Fade in the new image
      $("#rotate_word").fadeIn("2s");
    });



  	// Get the index of the next word in the array
  	count++;

  // If we've reached the end of the word list, go back to the start
  if (count == words.length) {
    count = 0;
  }
}

</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#bot_btn1").click(function() {
		$("#slide_btn1").trigger("click");
		
	});
	$("#bot_btn2").click(function() {
		$("#slide_btn2").trigger("click");
		
	});
	$("#bot_btn3").click(function() {
		$("#slide_btn3").trigger("click");
		
	});
	$("#bot_btn4").click(function() {
		$("#slide_btn4").trigger("click");
		
	});
});

</script>
</head>
<body>
<div id="main_container">
<div id="main_header">
	<div id="main_head_logo">
		<img src="../photo/logo.png" style="width: 75px; height: 75px;"> <b style="font-size: 25px;">다 함께!</b>
	</div>

	<div id="main_header_txt">
		Lorem ipsum dolor sit amet, consectetur adipisicing elited do eiusmod tempor incididunt ut labore e, st dolore magna aliqua. Ut enim ad <span id="rotate_word" style="color: red">communities</span>
	
		
	<div id="main_btn_wrap">
		<button type="button" class="btn btn-light" onclick="location.href='/user/login'">로그인</button>
		<button type="button" class="btn btn-light" onclick="location.href='/user/join'">회원가입</button>
	</div>
	</div>
	<div id="main_header_pic">
		<img src="../photo/main_1.jpg" id="rotate_photo">
	</div>
	
</div>
<div id="main_list_go">
	<a class="list_a" href="/moim/moimlist">
	<img class="mainphoto" src="../photo/moim.png"><br>
	<span>모임 게시판</span>
	</a>
	<a class="list_a" href="/city/list">
	<img class="mainphoto" src="../photo/local.png"><br>
	<span>지역 게시판</span>
	</a>
	<a class="list_a" href="/mapcontact">
	<img class="mainphoto" src="../photo/map.png"><br>
	<span>지도로 위치 검색</span>
	</a>
	<br>
</div>
	
	<div id="main_mid_pic">
	</div>
	<div id="main_mid_txt">
		<h1>대충 괜찮은 문장</h1>
		<h3>적당히 설명하는 문장의 행렬은 나에게 스타크래프트 1.16.1 립버전 철수는 말했다 공열안와자였다 몹시 무시무시한 죠나단 스타크래프트 1.16.1 립버전</h3>
	</div>
	
<div id="main_bot_title">
<h2 >Lorem ipsum</h2>
</div>

<div id="main_bot">
	<div class="main_bot_pic">
      	<img src="../photo/bot_1.jpg" style="width: 500px; height: 500px;">		
    	<img src="../photo/bot_2.jpg" style="width: 500px; height: 500px;">
		<img src="../photo/bot_3.jpg" style="width: 500px; height: 500px;">
		<img src="../photo/bot_4.jpg" style="width: 500px; height: 500px;">		
	</div>
	
	<div id="main_bot_txt">
		<span>
			Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
		</span>
	</div>
	
</div>
<div class="main_bot_imgs">
		<img src="../photo/bot_1.jpg" id="bot_btn1" >
		<img src="../photo/bot_2.jpg" id="bot_btn2" >
		<img src="../photo/bot_3.jpg" id="bot_btn3" >
		<img src="../photo/bot_4.jpg" id="bot_btn4" >
</div>

</div>
<script type="text/javascript">

	  $('.main_bot_pic').slick({
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 5000,
		  arrows: true,
		  fade: true,
	    asNavFor: '.main_bot_imgs'
	  });
	  $('.main_bot_imgs').slick({
	    slidesToShow: 3,
	    slidesToScroll: 1,
	    asNavFor: '.main_bot_pic',
	    centerMode: true,
	    focusOnSelect: true
	  });

</script>
</body>
</html>
